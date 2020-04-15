package com.techelevator.model;

public class Exercise {
	
	private int exerciseID;
	
	private String name;

	private int reps;
	
	private int sets;
	
	private String description;
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getExerciseID() {
		return exerciseID;
	}
	public void setExerciseID(int exerciseID) {
		this.exerciseID = exerciseID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReps() {
		return reps;
	}
	public void setReps(int reps) {
		this.reps = reps;
	}
	public int getSets() {
		return sets;
	}
	public void setSets(int sets) {
		this.sets = sets;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + exerciseID;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + reps;
		result = prime * result + sets;
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
		Exercise other = (Exercise) obj;
		if (exerciseID != other.exerciseID)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (reps != other.reps)
			return false;
		if (sets != other.sets)
			return false;
		return true;
	}
	
	
	
}
