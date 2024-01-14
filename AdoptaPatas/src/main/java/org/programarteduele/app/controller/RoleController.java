package org.programarteduele.app.controller;

import java.util.List;

import org.programarteduele.app.entity.UserType;
import org.programarteduele.app.service.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("adoptapatas/v1/userstype")
public class RoleController {
	
	@Autowired
	UserTypeService roleService;
	
	/*
	@PostMapping
	ResponseEntity<UserType> setRole(@RequestBody UserType role){
		UserType newRole = roleService.createRole(role);
		return new ResponseEntity<>( newRole, HttpStatus.CREATED);
	}
	*/
	
	@GetMapping
	ResponseEntity< List<UserType> > getAllRoles(){
		List<UserType> roles = roleService.getAllRoles();
		return new ResponseEntity<>( roles, HttpStatus.OK);
	}
	
	@GetMapping("{id}")
	UserType getRoleById(@PathVariable("id") Long id) {
		log.info("Se solicita los datos del id:" + id);
		UserType role = roleService.getRoleById(id);
		return role;
	}

}
