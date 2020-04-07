package com.techelevator.model;

import java.util.List;

public interface WorkoutDao {

	public List<Workout> retrieveWorkouts();
	
	public List<Exercise> retrieveExercises();
	
	public List<Exercise> retrieveExercisesByWorkoutID(int workoutID);
	
}
