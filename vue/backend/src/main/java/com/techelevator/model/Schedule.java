package com.techelevator.model;

public class Schedule {

	private int classID;
	private String className;
	private int dayOfTheWeek;
	private int timeSlot;
	private int maxOccupancy;
	private int reservedSpaces;
	
	
	
	
	
	
	
	
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getDayOfTheWeek() {
		return dayOfTheWeek;
	}
	public void setDayOfTheWeek(int dayOfTheWeek) {
		this.dayOfTheWeek = dayOfTheWeek;
	}
	public int getTimeSlot() {
		return timeSlot;
	}
	public void setTimeSlot(int timeSlot) {
		this.timeSlot = timeSlot;
	}
	public int getMaxOccupancy() {
		return maxOccupancy;
	}
	public void setMaxOccupancy(int maxOccupancy) {
		this.maxOccupancy = maxOccupancy;
	}
	public int getReservedSpaces() {
		return reservedSpaces;
	}
	public void setReservedSpaces(int reservedSpaces) {
		this.reservedSpaces = reservedSpaces;
	}
	
	
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + classID;
		result = prime * result + ((className == null) ? 0 : className.hashCode());
		result = prime * result + dayOfTheWeek;
		result = prime * result + maxOccupancy;
		result = prime * result + reservedSpaces;
		result = prime * result + timeSlot;
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
		Schedule other = (Schedule) obj;
		if (classID != other.classID)
			return false;
		if (className == null) {
			if (other.className != null)
				return false;
		} else if (!className.equals(other.className))
			return false;
		if (dayOfTheWeek != other.dayOfTheWeek)
			return false;
		if (maxOccupancy != other.maxOccupancy)
			return false;
		if (reservedSpaces != other.reservedSpaces)
			return false;
		if (timeSlot != other.timeSlot)
			return false;
		return true;
	}
	
	
	
	
	
	
	
	
}
