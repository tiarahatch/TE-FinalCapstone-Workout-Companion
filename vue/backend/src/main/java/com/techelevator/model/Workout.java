package com.techelevator.model;

public class Workout {

	private int workoutID;
	private String name;
	private int workoutTime;
	
	
	public int getWorkoutID() {
		return workoutID;
	}
	public void setWorkoutID(int workoutID) {
		this.workoutID = workoutID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getWorkoutTime() {
		return workoutTime;
	}
	public void setWorkoutTime(int workoutTime) {
		this.workoutTime = workoutTime;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + workoutID;
		result = prime * result + workoutTime;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Workout other = (Workout) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (workoutID != other.workoutID)
			return false;
		if (workoutTime != other.workoutTime)
			return false;
		return true;
	}
	
	
	
}
