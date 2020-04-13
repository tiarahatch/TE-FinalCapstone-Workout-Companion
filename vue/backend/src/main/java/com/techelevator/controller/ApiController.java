package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.model.Category;
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
    
    
    @GetMapping(path="/categories")
	public List<Category> getCategories() {
    	List<Category> categories = jdbcWorkoutDao.retrieveCategories();
    	
    	return categories;
    }
    
	
	@GetMapping(path = "/workouts/{id}")
    public List<Workout> getWorkoutsByCategory(@PathVariable String id) {
		int categoryIDInt = Integer.parseInt(id);
		
		List<Workout> workouts = jdbcWorkoutDao.retrieveWorkoutsByCategory(categoryIDInt);
		
		return workouts;
	}
	
	
	@GetMapping(path = "/exercise/{id}")
	public List<Exercise> getExercisesByWorkout(@PathVariable String id) {
		int workoutIDInt = Integer.parseInt(id);
		
		List<Exercise> exercises = jdbcWorkoutDao.retrieveExercisesByWorkoutID(workoutIDInt);
		
		return exercises;
		
	}
	
	@GetMapping(path="/weeklyschedule")
	public List<List<Schedule>> getWeeklySchedule() {
		
		
		List<List<Schedule>> weeklySchedule = jdbcScheduleDao.retreieveWeekScheduleByDay();
		
		
		return weeklySchedule;
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