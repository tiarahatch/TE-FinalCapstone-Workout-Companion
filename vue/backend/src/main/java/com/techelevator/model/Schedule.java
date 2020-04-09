package com.techelevator.model;

import java.sql.Date;
import java.time.LocalDate;

public class Schedule {

	private int classID;
	private String className;
	private String date;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	
	
	
	
	
	
	
	
	
	
}
