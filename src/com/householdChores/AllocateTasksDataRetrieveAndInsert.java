package com.householdChores;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.mysql.jdbc.PreparedStatement;


public class AllocateTasksDataRetrieveAndInsert {
	
	private Map<String,String> parameters;
	private String[] taskArray;
	private String[] userArray;
	private JDBCConnection jdbc;
	private Connection conn;
	private ArrayList<UserTasks> tasks = new ArrayList<UserTasks>();
	
	public AllocateTasksDataRetrieveAndInsert(Map<String, String> parameters)
	{
		this.parameters = parameters;
	}
	
	public AllocateTasksDataRetrieveAndInsert()
	{		
	}
	
	public AllocateTasksDataRetrieveAndInsert(String[] tasks, String[] users)
	{		
		this.taskArray = tasks;
		this.userArray = users;
	}
	
	
	
	
	public ArrayList<UserTasks> getTaskData()
	{
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();
		
		if(conn!=null)
		{
			Statement stmt = null;
			ResultSet rs = null;

			try
			{
				stmt = conn.createStatement();

				String allGroupTasksSQL;
				allGroupTasksSQL = "select * from tasks where (done=0 or recurring=1) and taskId NOT IN (select t.taskId from tasks t, taskassigned ta where t.taskId=ta.taskId and t.recurring!=1)";
				
				rs = stmt.executeQuery(allGroupTasksSQL);
				
				while(rs.next())
				{
					UserTasks userTask = new UserTasks();
					userTask.setIsTaskDue(true);
					userTask.setPointValue(rs.getString("pointValue"));
					userTask.setTaskName(rs.getString("taskName"));
					userTask.setTaskId(rs.getString("taskId"));
					userTask.setEndDate(rs.getString("endDate"));
					tasks.add(userTask);
				}

				rs.close();
				stmt.close();
				conn.close();
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}
		return tasks;
	}
	
	
	public boolean assignTasks()
	{
		
		boolean updated = false;
		
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();
		PreparedStatement pst=null;
		Statement stmt = null;
		ResultSet rs = null;

		if(conn != null)
		{
			try
			{
				for(int i = 0; i < userArray.length; i++)
				{
					String checkSQL;
					checkSQL = "SELECT * FROM taskAssigned where taskId = '" + taskArray[i] + "'" ;
					stmt = conn.createStatement();
					
					rs = stmt.executeQuery(checkSQL);
					
					if(rs.next())
					{
						//UPDATE - Modify the SQL BASED ON WHAT PARAMETERS WE ARE GETTING
						String updateSQL;
						updateSQL = "UPDATE TABLE taskAssigned SET uid = ? WHERE taskId = ?";
						
						pst = (PreparedStatement) conn.prepareStatement(updateSQL); 
						pst.setString(1,userArray[i]);        
						pst.setString(2,taskArray[i]);
						
						int pstStatusCode = pst.executeUpdate();
						
						if (pstStatusCode != 0) updated = true;
					}
					
					else
					{
						String insertSQL;
						insertSQL = "INSERT INTO taskAssigned(uid, taskId) VALUES(?,?)";
						
						pst = (PreparedStatement) conn.prepareStatement(insertSQL); 
						pst.setString(1,userArray[i]);        
						pst.setString(2,taskArray[i]);
						
						int pstStatusCode = pst.executeUpdate();
						
						if (pstStatusCode != 0) updated = true;
					}	
					
					
				}
				
				pst.close();
				stmt.close();
				rs.close();
				conn.close();
							
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}
		return updated;
	}
}