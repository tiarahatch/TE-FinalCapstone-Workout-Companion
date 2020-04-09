package com.techelevator.model;

import java.util.List;

public interface ScheduleDao {
	

	public List<Schedule> retrieveFullSchedule();
	
	public List<Schedule> retrieveDaySchedule();
	
	public List<Schedule> retrieveWeekSchedule();
	
	public List<Schedule> retrieveMonthSchedule();
	
	public List<List<Schedule>> retreieveWeekScheduleByDay();
	
}
