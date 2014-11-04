package com.householdChores;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

public class TaskCompleteUpdateDone {
	private String [] checkBoxValues;
	private JDBCConnection jdbc;
	private Connection conn;
	
	public void setCheckBoxValues(String[] checkBoxValues){
		this.checkBoxValues = checkBoxValues;
	}
	
	public boolean updateDoneColumnDb(){
		
		//System.out.println("In register user");
		
		boolean inserted = false;
		
		jdbc = new JDBCConnection();
		conn = jdbc.makeConnection();

		if(conn != null)
		{
			try
			{
				String sql;
				PreparedStatement pst = null;
				for(int i = 0; i < checkBoxValues.length; i++){
					sql = "update tasks set done = 1 where tasks.taskId = ?";
					pst =(PreparedStatement) conn.prepareStatement(sql);
					pst.setString(1,checkBoxValues[i]);
					int pstStatusCode = pst.executeUpdate();
					if(pstStatusCode != 0)
					{	
						inserted = true;
					}
					else{
						System.out.println("Insertion error");
						break;
					}
				}
				
				if(inserted == true)
					System.out.println("Done column in tasks table successfully updated");
				
				pst.close();
				conn.close();
				
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
		}

		return inserted;
	}
	

}
