package com.techelevator.controller;

import java.util.List;

import javax.validation.Valid;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.authentication.JwtTokenHandler;
import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.authentication.UserCreationException;
import com.techelevator.model.JdbcScheduleDao;
import com.techelevator.model.Schedule;
import com.techelevator.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
public class ScheduleController {

	@Autowired
	private JdbcScheduleDao jdbcScheduleDao;

	@RequestMapping("/schedule")
	public List<Schedule> getSchedule() {

		List<Schedule> fullSchedule = jdbcScheduleDao.retrieveFullSchedule();

		return fullSchedule;
	}

}
