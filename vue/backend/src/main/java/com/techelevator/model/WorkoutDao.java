package com.techelevator.model;

import java.util.List;

public interface WorkoutDao {

	public List<Workout> retrieveWorkoutsByCategory(int categoryID);
	
	
	public List<Exercise> retrieveExercisesByWorkoutID(int workoutID);
	
	public List<Category> retrieveCategories();
	
}
