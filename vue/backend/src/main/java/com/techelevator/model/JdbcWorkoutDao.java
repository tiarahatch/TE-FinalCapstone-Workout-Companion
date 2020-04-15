package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcWorkoutDao implements WorkoutDao {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcWorkoutDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	

@Override
public List<Category> retrieveCategories() {
	List<Category> categories = new ArrayList<Category>();
	
	String sqlRetrieveCategories = "SELECT * FROM category";
	SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveCategories);
	
	while(results.next()) {
		Category category = new Category();
		category.setCategoryID(results.getInt("category_id"));
		category.setName(results.getString("name"));
		categories.add(category);
	}
	return categories;
}

	
	@Override
	public List<Workout> retrieveWorkoutsByCategory(int categoryID) {
		List<Workout> workouts = new ArrayList<Workout>();
		
		String sqlRetrieveWorkoutsByCategory = "SELECT * " +
				"FROM premade_workout " +
				"JOIN category_workout ON premade_workout.workout_id = category_workout.workout_id " +
				"JOIN category ON category.category_id = category_workout.category_id " +
				"WHERE category_workout.category_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveWorkoutsByCategory, categoryID);
		
		while(results.next()) {
			
			workouts.add(mapRowToWorkout(results));
			
		}
		return workouts;
	}
		
	@Override
	public List<Exercise> retrieveExercisesByWorkoutID(int workoutID) {
		List<Exercise> exercises = new ArrayList<Exercise>();
		
		String sqlRetrieveExercisesByWorkoutID = 
		"SELECT *" + 
		" FROM exercise" +
		" JOIN workout_exercise ON exercise.exercise_id = workout_exercise.exercise_id" +
		" JOIN premade_workout ON workout_exercise.workout_id = premade_workout.workout_id" +
		" WHERE workout_exercise.workout_id = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveExercisesByWorkoutID, workoutID);
		
		
	while(results.next()) {
			
			exercises.add(mapRowToExercise(results));
			
		}
		return exercises;
	}

private Workout mapRowToWorkout(SqlRowSet results) {
	Workout workout = new Workout();
	workout.setWorkoutID(results.getInt("workout_id"));
	workout.setName(results.getString("name"));
	return workout;
}

private Exercise mapRowToExercise(SqlRowSet results) {
	Exercise exercise = new Exercise();
	exercise.setExerciseID(results.getInt("exercise_id"));
	exercise.setName(results.getString("name"));
	exercise.setReps(results.getInt("reps"));
	exercise.setSets(results.getInt("sets"));
	exercise.setDescription(results.getString("description"));
	exercise.setYtLink(results.getString("yt_link"));
	return exercise;
}



}
