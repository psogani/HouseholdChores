package com.householdChores;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class CurrentUserTaskDataAccess 
{

	public int getCurrentPoints(ArrayList<UserTasks> currentTasks)
	{
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		Calendar c = Calendar.getInstance();
//		c.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
//		Date d=c.getTime();
//		c.add(Calendar.DATE,7);
//		Date end_date = c.getTime();
//		try
//		{
//			String dt=df.format(end_date);
//			end_date=df.parse(dt);
//		}
//		catch(Exception e)
//		{
//			System.out.println(e);
//		}
				


		//System.out.println("date is "+end_date);

		int points=0;
		for(int i=0;i<currentTasks.size();i++)
		{
			UserTasks ut=currentTasks.get(i);
			points+=Integer.parseInt(ut.getPointValue());
		}

		return points;
	}

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
