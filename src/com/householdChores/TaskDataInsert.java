package com.householdChores;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.mysql.jdbc.PreparedStatement;


public class TaskDataInsert 
{
	public boolean insertTaskData(String[] taskName,String[] pointValue,boolean[] recurring,String date)
	{

		JDBCConnection jdbc = new JDBCConnection();
		Connection conn = jdbc.makeConnection();
		boolean isSuccessfull = false;
		
		if(conn!=null)
		{

			try
			{
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date start_date = df.parse(date);
				java.sql.Date sqlStartDate=new java.sql.Date(start_date.getTime());

				java.util.Date end_date = df.parse(date);
				Calendar cal = Calendar.getInstance();
				cal.setTime(end_date);
				cal.add(Calendar.DATE,7);
				end_date = cal.getTime();
				java.sql.Date sqlEndDate=new java.sql.Date(end_date.getTime());

				
				PreparedStatement pst=null;
				for(int i=0;i<taskName.length;i++)
				{
					String inserTaskSql;
					inserTaskSql = "INSERT INTO tasks(taskName,pointValue,recurring,startDate,endDate) VALUES(?,?,?,?,?)";
					
					pst =(PreparedStatement) conn.prepareStatement(inserTaskSql); 
					pst.setString(1,taskName[i]);  
					pst.setString(2,pointValue[i]);
					if(recurring[i])
					{
						pst.setString(3,"1");
					}
					else
					{
						pst.setString(3,"1");
					}
				
					pst.setDate(4,sqlStartDate);
					pst.setDate(5,sqlEndDate);
					
					int pstStatusCode = pst.executeUpdate();
					if(pstStatusCode != 0){
						 System.out.println("success");
					 }

				}
				isSuccessfull = true;
				pst.close();
				conn.close();
			

			}
			catch(Exception e)
			{
				System.out.println(e);
			}


		}
		return isSuccessfull;
	}
}
