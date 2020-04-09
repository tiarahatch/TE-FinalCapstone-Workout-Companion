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
	private Date todaysDate = Date.valueOf(LocalDate.now());
	
	
	
	@Autowired
	public JdbcScheduleDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Schedule> retrieveFullSchedule() {
		List<Schedule> fullSchedule = new ArrayList<Schedule>();
		
		String sqlRetrieveFullSchedule = "SELECT * FROM schedule ORDER BY date, timeslot";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveFullSchedule);
		
		while(results.next()) {
			
			fullSchedule.add(mapRowToSchedule(results));
		}
		
		return fullSchedule;
	}
	
	@Override
	public List<Schedule> retrieveDaySchedule() {
	List<Schedule> fullSchedule = new ArrayList<Schedule>();
		
		
		
		String sqlRetrieveDaySchedule = "SELECT * " +
				"FROM schedule " +
				"WHERE date = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveDaySchedule, todaysDate);
		
		while(results.next()) {
			
			fullSchedule.add(mapRowToSchedule(results));
		}
		
		return fullSchedule;
	}
	@Override
	public List<Schedule> retrieveWeekSchedule() {
		
		List<Schedule> fullSchedule = new ArrayList<Schedule>();
		
		Date weekDate = Date.valueOf(LocalDate.now().plusDays(7));
				String sqlRetrieveDaySchedule = "SELECT * " +
						"FROM schedule " + 
						"WHERE date BETWEEN ? AND ?";
				SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveDaySchedule, todaysDate, weekDate);
				
				while(results.next()) {
					
					fullSchedule.add(mapRowToSchedule(results));
				}
				
				return fullSchedule;
			}

	@Override
	public List<Schedule> retrieveMonthSchedule() {
	List<Schedule> fullSchedule = new ArrayList<Schedule>();
		
		Date monthDate = Date.valueOf(LocalDate.now().plusDays(30));
				String sqlRetrieveDaySchedule = "SELECT * " +
						"FROM schedule " + 
						"WHERE date BETWEEN ? AND ?";
				SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveDaySchedule, todaysDate, monthDate);
				
				while(results.next()) {
					
					fullSchedule.add(mapRowToSchedule(results));
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
		
		return schedule;
	}


	
	
}
