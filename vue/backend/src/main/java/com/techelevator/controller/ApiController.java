package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.model.Exercise;
import com.techelevator.model.JdbcScheduleDao;
import com.techelevator.model.Schedule;
import com.techelevator.model.ScheduleDao;
import com.techelevator.model.Workout;
import com.techelevator.model.WorkoutDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * ApiController
 */
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiController {

    @Autowired
    private AuthProvider authProvider;

    @Autowired
	private ScheduleDao jdbcScheduleDao;
    
    @Autowired
    private WorkoutDao jdbcWorkoutDao;
	
	@GetMapping(path= "/schedule", produces = "application/json")
	public List<Schedule> getSchedule() {

		List<Schedule> fullSchedule = jdbcScheduleDao.retrieveFullSchedule();

		return fullSchedule;
	}
	
	@GetMapping(path = "/getWorkouts", produces = "application/json")
    public List<Workout> getWorkouts() {
		
		List<Workout> workouts = jdbcWorkoutDao.retrieveWorkouts();
		
		return workouts;
	}
	
	@GetMapping(path = "/getExercises", produces = "application/json")
	public List<Exercise> getExercises() {
		
		List<Exercise> exercises = jdbcWorkoutDao.retrieveExercises();
		
		return exercises;
	}
	
	
	@GetMapping(path = "/exercise/{id}")
	public List<Exercise> getExercisesByWorkout(@PathVariable String id) {
		int workoutIDInt = Integer.parseInt(id);
		
		List<Exercise> exercises = jdbcWorkoutDao.retrieveExercisesByWorkoutID(workoutIDInt);
		
		return exercises;
		
	}
	
	@GetMapping(path="/dailyschedule")
	public List<Schedule> getDailySchedule() {
		List<Schedule> dailySchedule = jdbcScheduleDao.retrieveDaySchedule();
		
		return dailySchedule;
	}
	
	@GetMapping(path="/weeklyschedule")
	public List<List<Schedule>> getWeeklySchedule() {
		
		//List<Schedule> weeklySchedule = jdbcScheduleDao.retrieveWeekSchedule();
		
		List<List<Schedule>> weeklySchedule = jdbcScheduleDao.retreieveWeekScheduleByDay();
		
		
		return weeklySchedule;
	}
	
	@GetMapping(path="/monthlyschedule")
	public List<Schedule> getMonthlySchedule() {
		List<Schedule> monthlySchedule = jdbcScheduleDao.retrieveMonthSchedule();
		
		return monthlySchedule;
	}
    
    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String authorizedOnly() throws UnauthorizedException {
        /*
        You can lock down which roles are allowed by checking
        if the current user has a role.
        
        In this example, if the user does not have the admin role
        we send back an unauthorized error.
        */
        if (!authProvider.userHasRole(new String[] { "admin" })) {
            throw new UnauthorizedException();
        }
        return "Success";
    }
    
    
    
}