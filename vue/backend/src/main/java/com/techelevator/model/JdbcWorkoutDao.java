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
	public List<Workout> retrieveWorkouts() {
		List<Workout> workouts = new ArrayList<Workout>();
		
		String sqlRetrieveWorkouts = "SELECT * FROM premade_workout";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveWorkouts);
		
		while(results.next()) {
			
			workouts.add(mapRowToWorkout(results));
			
		}
		return workouts;
	}

	@Override
	public List<Exercise> retrieveExercises() {
	List<Exercise> exercises = new ArrayList<Exercise>();
		
		String sqlRetrieveExercises = "SELECT * FROM exercise";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRetrieveExercises);
		
		while(results.next()) {
			
			exercises.add(mapRowToExercise(results));
			
		}
		return exercises;
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
	workout.setWorkoutTime(results.getInt("workout_time"));
	return workout;
}

private Exercise mapRowToExercise(SqlRowSet results) {
	Exercise exercise = new Exercise();
	exercise.setExerciseID(results.getInt("exercise_id"));
	exercise.setName(results.getString("name"));
	exercise.setReps(results.getInt("reps"));
	exercise.setSets(results.getInt("sets"));
	return exercise;
}



}
