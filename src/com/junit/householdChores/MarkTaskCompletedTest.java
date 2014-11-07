package com.junit.householdChores;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.householdChores.JDBCConnection;
import com.householdChores.TaskCompleteUpdateDone;
import com.mysql.jdbc.PreparedStatement;

public class MarkTaskCompletedTest {
	
	TaskCompleteUpdateDone taskCompleteUpdateDone;
	private String [] checkBoxValues = {"1","2"};

	@Before
	public void setUp() throws Exception {
		
		taskCompleteUpdateDone = new TaskCompleteUpdateDone();

	}

	@Test
	public void updateDoneColumnDbTest() {
		
		boolean updated = taskCompleteUpdateDone.updateDoneColumnDb();
		
		assertTrue(updated);
			
	}
	
	@After
	public void tearDown() throws Exception {
		
		JDBCConnection jdbcConnection = new JDBCConnection();
		Connection conn = jdbcConnection.makeConnection();
		
		if(conn != null)
		{
			try
			{
				PreparedStatement st = null;
				for(int i = 0; i< checkBoxValues.length; i++)
				{
					
					String sql;
					sql = "UPDATE tasks SET done = 0 WHERE taskId = ?";
					
					st = (PreparedStatement) conn.prepareStatement(sql); 

					st.setString(1,checkBoxValues[i]);  
					
					int pstStatusCode = st.executeUpdate();
					
				}
				st.close();
				conn.close();
				
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}	
	}

}
