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
	
	AllocateTasksDataRetrieveAndInsert(Map<String, String> parameters)
	{
		this.parameters = parameters;
	}
	
	AllocateTasksDataRetrieveAndInsert()
	{		
	}
	
	AllocateTasksDataRetrieveAndInsert(String[] tasks, String[] users)
	{		
		this.taskArray = tasks;
		this.userArray = users;
	}
	
	
	
	
	ArrayList<UserTasks> getTaskData()
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
				
				allGroupTasksSQL = "SELECT u.fname, u.userId, t.* from tasks t, taskAssigned ta, users u where (t.done = 0 or t.recurring = 1) and t.taskId = ta.taskId and ta.uid = u.uid";
				
				rs = stmt.executeQuery(allGroupTasksSQL);
				
				while(rs.next())
				{
					UserTasks userTask = new UserTasks();
					userTask.setIsTaskDue(true);
					userTask.setUserName(rs.getString("fname"));
					userTask.setUserId(rs.getString("userId"));
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
	
	
	boolean assignTasks()
	{
		
		boolean updated = false;
		
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();

		if(conn != null)
		{
			try
			{
				for(int i = 0; i < userArray.length; i++)
				{
					String checkSQL;
					checkSQL = "SELECT * FROM taskAssigned where taskId = " + taskArray[i];
					
					Statement stmt = null;
					ResultSet rs = null;
					stmt = conn.createStatement();
					
					rs = stmt.executeQuery(checkSQL);
					
					if(rs.next())
					{
						//UPDATE - Modify the SQL BASED ON WHAT PARAMETERS WE ARE GETTING
						String updateSQL;
						updateSQL = "UPDATE taskAssigned SET uid = ? WHERE taskId = ?";
						
						PreparedStatement pst = (PreparedStatement) conn.prepareStatement(updateSQL); 
						pst.setInt(1,Integer.parseInt(userArray[i]));        
						pst.setInt(2,Integer.parseInt(taskArray[i]));
						
						int pstStatusCode = pst.executeUpdate();
						
						if (pstStatusCode != 0) updated = true;
						pst.close();
						stmt.close();
						rs.close();
						conn.close();
						return updated;
					}
					
					else
					{
						String insertSQL;
						insertSQL = "INSERT INTO taskAssigned VALUES(uid, taskId) VALUES(?,?)";
						
						PreparedStatement pst = (PreparedStatement) conn.prepareStatement(insertSQL); 
						pst.setInt(1,Integer.parseInt(userArray[i]));        
						pst.setInt(2,Integer.parseInt(taskArray[i]));
						
						int pstStatusCode = pst.executeUpdate();
						
						if (pstStatusCode != 0) updated = true;
						pst.close();
						stmt.close();
						rs.close();
						conn.close();
						return updated;
					}	
					
					
				}
							
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}
		return updated;
	}
}