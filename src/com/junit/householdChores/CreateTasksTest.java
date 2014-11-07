package com.junit.householdChores;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.householdChores.InsertTaskController;
import com.householdChores.JDBCConnection;
import com.householdChores.TaskDataInsert;
import com.mysql.jdbc.PreparedStatement;

public class CreateTasksTest {
	
	TaskDataInsert taskDataInsert = new TaskDataInsert();
	InsertTaskController insertTaskController = new InsertTaskController();

	@Test
	public void insertTasksTest() {
		
		String[] taskName = {"testTask1","testTask2","testTask3"};
		String[] pointValue = {"5","2","3"};
		boolean[] recurring = {true,false,true};
		String date = "2014-11-14";
		
		boolean isSuccessfull = taskDataInsert.insertTaskData(taskName, pointValue, recurring, date);
		boolean deleted = false;
		
		
		//Remove tasks from the database so that this test will be successful next time
		
		if(isSuccessfull)
		{
			boolean multipleDeleted = true;
			
			//System.out.println("DELETE");
			
			JDBCConnection jdbcConnection = new JDBCConnection();
			Connection conn = jdbcConnection.makeConnection();
			
			if(conn != null)
			{
				try
				{
					PreparedStatement st = null;
					for(int i = 0; i< taskName.length; i++)
					{
						
						String sql;
						sql = "DELETE FROM tasks WHERE taskName = ?";
						
						st = (PreparedStatement) conn.prepareStatement(sql); 

						st.setString(1,taskName[i]);  
						
						int pstStatusCode = st.executeUpdate();
						
						if(pstStatusCode != 0)
						{	
							multipleDeleted = multipleDeleted & true;
						}
						
						else multipleDeleted = false;
						
					}
					st.close();
					conn.close();
					
				}
				catch(Exception e)
				{
					System.out.print(e);
				}
			}
			
			deleted = multipleDeleted;
			
		}
		
		assertTrue("Successful Taskset Insertion Test", isSuccessfull && deleted);
		
		
	}
	
	@Test
	public void getTaskPageTest() {
		
		assertNotNull(insertTaskController.getTaskPage());

	}
	
	@Test
	public void processTaskPageTest() {
		
		assertNotNull(insertTaskController.processTaskPage("2014-12-12"));
		

	}
	

}
