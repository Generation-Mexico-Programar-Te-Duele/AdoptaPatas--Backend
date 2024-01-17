package org.programarteduele.app.controller;

import java.util.List;

import org.programarteduele.app.entity.Post;
import org.programarteduele.app.service.PostService;
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
@RequestMapping("adoptapatas/v1/posts")
public class PostController {
	
	@Autowired
	PostService roleService;
	
	@PostMapping
	ResponseEntity<Post> setRole(@RequestBody Post role){
		Post newRole = roleService.createPost(role);
		return new ResponseEntity<>( newRole, HttpStatus.CREATED);
	}
	
	@GetMapping
	ResponseEntity< List<Post> > getAllRoles(){
		List<Post> roles = roleService.getAllPosts();
		return new ResponseEntity<>( roles, HttpStatus.OK);
	}
	
	@GetMapping("{id}")
	Post getRoleById(@PathVariable("id") Long id) {
		log.info("Se solicita los datos del id:" + id);
		Post role = roleService.getPostById(id);
		return role;
	}

}
