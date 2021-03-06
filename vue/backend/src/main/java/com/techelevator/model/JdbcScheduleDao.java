package com.techelevator.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	private SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
	
	@Autowired
	public JdbcScheduleDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<List<Schedule>> retreieveWeekScheduleByDay(){
		
		List<List<Schedule>> fullSchedule = new ArrayList<List<Schedule>>();
		
		String sqlRetrieveDaySchedule = "SELECT * " +
				"FROM schedule " +
				"JOIN class_options ON class_option = class_options.class_option_id " +
				"WHERE date = ? ORDER BY timeslot";
		
		for(int i = 0; i < 7; i++) {
			List<Schedule> daySchedule = new ArrayList<Schedule>();
			
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveDaySchedule, Date.valueOf(LocalDate.now().plusDays(i)));
			
			while(results.next()) {
				
				daySchedule.add(mapRowToSchedule(results));
			}
			
			fullSchedule.add(daySchedule);
		}
		
		return fullSchedule;
	}
	
	private Schedule mapRowToSchedule(SqlRowSet results) {
		Schedule schedule = new Schedule();
		schedule.setClassID(results.getInt("class_id"));
		schedule.setClassName(results.getString("class_name"));
		String formatedDate = sdf.format(results.getDate("date"));
		schedule.setDate(formatedDate);
		schedule.setTimeSlot(results.getInt("timeslot"));
		schedule.setMaxOccupancy(results.getInt("max_occupancy"));
		schedule.setReservedSpaces(results.getInt("reserved_spaces"));
		schedule.setClassDescription(results.getString("class_description"));
		
		return schedule;
	}


	
	
}
