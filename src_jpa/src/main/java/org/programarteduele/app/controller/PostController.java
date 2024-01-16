package org.programarteduele.app.controller;

import java.util.List;

import org.programarteduele.app.entity.Post;
import org.programarteduele.app.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("adoptapatas/v1/posts")
public class PostController {

	   @Autowired
	    private PostService postService;

	    @PostMapping("/{userId}")
	    public ResponseEntity<Post> createPost(@RequestBody Post post, @PathVariable Long userId) {
	        Post createdPost = postService.createPost(post, userId);
	        if (createdPost != null) {
	            return new ResponseEntity<>(createdPost, HttpStatus.CREATED);
	        } else {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        }
	    }

	    @PutMapping("/{postId}")
	    public ResponseEntity<Post> updatePost(@PathVariable Long postId, @RequestBody Post updatedPost) {
	        Post updatedPostResult = postService.updatePost(postId, updatedPost);
	        if (updatedPostResult != null) {
	            return new ResponseEntity<>(updatedPostResult, HttpStatus.OK);
	        } else {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        }
	    }

	    @DeleteMapping("/{postId}")
	    public ResponseEntity<Void> deletePost(@PathVariable Long postId) {
	        postService.deletePost(postId);
	        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	    }

	    @GetMapping("/{postId}")
	    public ResponseEntity<Post> getPostById(@PathVariable Long postId) {
	        Post post = postService.getPostById(postId);
	        if (post != null) {
	            return new ResponseEntity<>(post, HttpStatus.OK);
	        } else {
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        }
	    }

	    @GetMapping
	    public ResponseEntity<List<Post>> getAllPosts() {
	        List<Post> posts = postService.getAllPosts();
	        return new ResponseEntity<>(posts, HttpStatus.OK);
	    }
	    
}
