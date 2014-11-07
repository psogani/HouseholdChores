package com.junit.householdChores;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import com.householdChores.AllocateTasksController;
import com.householdChores.AllocateTasksDataRetrieveAndInsert;
import com.householdChores.UserTasks;



public class AllocateTasksTest {

	AllocateTasksController allocateTasksController;
	AllocateTasksDataRetrieveAndInsert allocateTasksDataRetrieveAndInsertNoParams;
	AllocateTasksDataRetrieveAndInsert allocateTasksDataRetrieveAndInsertWithParams;
	
	@Before
	public void setUp()
	{
		allocateTasksController = new AllocateTasksController();
		allocateTasksDataRetrieveAndInsertNoParams = new AllocateTasksDataRetrieveAndInsert();
		
		String[] tasks = {"1","2"};
		String[] users = {"1","1"};
		
		allocateTasksDataRetrieveAndInsertWithParams = new AllocateTasksDataRetrieveAndInsert(tasks,users);
		
	}
	
	
	@Test
	public void getTaskDataTest() {
		
		ArrayList<UserTasks> userTaskList = allocateTasksDataRetrieveAndInsertNoParams.getTaskData();
		assertTrue("Get Tasks Test",userTaskList.size() > 0);
		
	}
	
	@Test
	public void assignTasksTest() {
		
		boolean assigned = allocateTasksDataRetrieveAndInsertWithParams.assignTasks();
		assertTrue("Assign Task Test", assigned);
		fail("Not yet implemented");
	}
	
	
	
	@Test
	public void getAllocateTaskPageTest() {
		
		assertNotNull(allocateTasksController.getTaskData());
		
	}

}
