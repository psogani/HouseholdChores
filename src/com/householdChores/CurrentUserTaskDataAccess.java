package com.householdChores;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CurrentUserTaskDataAccess 
{

	public ArrayList<UserTasks> getCurrentUserTask(String userid)
	{
		JDBCConnection jdbc = new JDBCConnection();
		Connection conn = jdbc.makeConnection();
		
		//create an object to store data
		ArrayList<UserTasks> tasks=new ArrayList<UserTasks>();
		
		if(conn!=null)
		{

			Statement stmt = null;
			ResultSet rs=null;

			try
			{
				System.out.println("Creating statementfor task...");
				stmt = conn.createStatement();

				String currentTasks;
				currentTasks = "SELECT * FROM tasks t,taskAssigned ta, users u where u.uid ='" + userid + "' and t.taskId = ta.taskId and u.uid = ta.uid and t.done = 0";
				rs = stmt.executeQuery(currentTasks);
				
				//populate the userTasks object
				while(rs.next())
				{
					UserTasks userTask=new UserTasks();
					userTask.setIsTaskDue(true);
					userTask.setUserId(userid);
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

}
