package com.techelevator.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcScheduleDao implements ScheduleDao {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcScheduleDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Schedule> retrieveFullSchedule() {
		List<Schedule> fullSchedule = new ArrayList<Schedule>();
		
		String sqlRetrieveFullSchedule = "SELECT * FROM schedule";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveFullSchedule);
		
		while(results.next()) {
			
			fullSchedule.add(mapRowToSchedule(results));
		}
		
		return fullSchedule;
	}
	
	
	
	
	private Schedule mapRowToSchedule(SqlRowSet results) {
		Schedule schedule = new Schedule();
		schedule.setClassID(results.getInt("class_id"));
		schedule.setClassName(results.getString("class_name"));
		schedule.setDayOfTheWeek(results.getInt("day_of_week"));
		schedule.setTimeSlot(results.getInt("timeslot"));
		schedule.setMaxOccupancy(results.getInt("max_occupancy"));
		schedule.setReservedSpaces(results.getInt("reserved_spaces"));
		
		return schedule;
	}
	
	
}
