package com.techelevator.authentication;

import java.util.List;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.model.Category;
import com.techelevator.model.Exercise;
import com.techelevator.model.JdbcWorkoutDao;
import com.techelevator.model.Workout;




public class WorkoutDaoIntegrationTest {

	private static SingleConnectionDataSource dataSource;
	private JdbcWorkoutDao dao;
	private static JdbcTemplate jdbcTemplate;
	private Workout workout;

	@Before
	public void setup() {
		jdbcTemplate = new JdbcTemplate(dataSource);
		dao = new JdbcWorkoutDao(dataSource);
	}

	@BeforeClass
	public static void setupDataSource() {
		dataSource = new SingleConnectionDataSource();
		dataSource.setUrl("jdbc:postgresql://localhost:5432/workout_app");
		dataSource.setUsername("postgres");
		dataSource.setPassword("postgres1");

		dataSource.setAutoCommit(false);
	}

	@AfterClass
	public static void closeDataSource() throws SQLException {
		dataSource.destroy();
	}

	@After
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}

	protected DataSource getDataSource() {
		return dataSource;
	}
	
	@Test
	public void retrieveWorkoutsByCategoryTest() {
		List<Workout> testWorkouts = dao.retrieveWorkoutsByCategory(1);
		assertNotNull(testWorkouts);
		assertEquals(3, testWorkouts.size());
		assertEquals("Upper-Body", testWorkouts.get(0).getName());
	}

	@Test
	public void retrieveExercisesByWorkoutIDTest() {
		List<Exercise> testExercises = dao.retrieveExercisesByWorkoutID(1);
		assertNotNull(testExercises);
		assertEquals(3, testExercises.size());
		assertEquals("Bicep Curls", testExercises.get(0).getName());
	}
	@Test
	public void retrieveCategoriesTest() {
		List<Category> testCategories = dao.retrieveCategories();
		assertNotNull(testCategories);
		assertEquals(4, testCategories.size());
		assertEquals("Strength", testCategories.get(0).getName());
	}
	
}
