package com.techelevator.model;

import java.util.List;

public interface ScheduleDao {
	
	public List<List<Schedule>> retreieveWeekScheduleByDay();
	
}
