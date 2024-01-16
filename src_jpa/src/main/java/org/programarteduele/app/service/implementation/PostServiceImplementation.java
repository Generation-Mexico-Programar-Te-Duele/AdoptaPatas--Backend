package org.programarteduele.app.service.implementation;

import java.util.List;
import java.util.Optional;

import org.programarteduele.app.entity.Post;
import org.programarteduele.app.entity.User;
import org.programarteduele.app.repository.PostRepository;
import org.programarteduele.app.repository.UserRepository;
import org.programarteduele.app.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImplementation implements PostService {

	 @Autowired
	    private PostRepository postRepository;

	    @Autowired
	    private UserRepository userRepository;

	    @Override
	    public Post createPost(Post post, Long userId) {
	        Optional<User> userOptional = userRepository.findById(userId);
	        if (userOptional.isPresent()) {
	            User user = userOptional.get();
	            post.setUser(user);
	           
	            return postRepository.save(post);
	        } else {
	           
	            return null;
	        }
	    }

	    @Override
	    public Post updatePost(Long postId, Post updatedPost) {
	        Optional<Post> postOptional = postRepository.findById(postId);
	        if (postOptional.isPresent()) {
	            Post existingPost = postOptional.get();
	           
	           
	            existingPost.setPostContent(updatedPost.getPostContent());
	           
	            return postRepository.save(existingPost);
	        } else {
	           
	            return null;
	        }
	    }

	    @Override
	    public void deletePost(Long postId) {
	        Optional<Post> postOptional = postRepository.findById(postId);
	        postOptional.ifPresent(post -> postRepository.delete(post));
	       
	    }

	    @Override
	    public Post getPostById(Long postId) {
	        return postRepository.findById(postId).orElse(null);
	    }

	    @Override
	    public List<Post> getAllPosts() {
	        return (List<Post>) postRepository.findAll();
	    }
	    
	  

}

