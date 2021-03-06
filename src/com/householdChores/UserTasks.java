package com.householdChores;

public class UserTasks 
{
	private Boolean isTaskDue;
	
	private String userId;
	
	private String userName;
	
	private String taskName;
	
	private String taskId;
	
	private String endDate;
	
	private String pointValue;
	
	private boolean isDone;
	
	private boolean isRecurring;
	
	
	public boolean isDone() {
		return isDone;
	}

	public void setDone(boolean isDone) {
		this.isDone = isDone;
	}

	public boolean isRecurring() {
		return isRecurring;
	}

	public void setRecurring(boolean isRecurring) {
		this.isRecurring = isRecurring;
	}

	public Boolean getIsTaskDue() {
		return isTaskDue;
	}
	
	public void setIsTaskDue(Boolean isTaskDue) {
		this.isTaskDue = isTaskDue;
	}
	
	public String getEndDate() {
		return endDate;
	}
	public String getPointValue() {
		return pointValue;
	}
	public String getTaskId() {
		return taskId;
	}
	public String getTaskName() {
		return taskName;
	}
	public String getUserId() {
		return userId;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setPointValue(String pointValue) {
		this.pointValue = pointValue;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
