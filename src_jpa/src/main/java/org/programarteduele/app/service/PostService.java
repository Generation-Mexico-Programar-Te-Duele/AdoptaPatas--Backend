package org.programarteduele.app.service;

import java.util.List;

import org.programarteduele.app.entity.Post;

public interface PostService {
	
    Post createPost(Post post, Long userId);
    Post updatePost(Long postId, Post updatedPost);
    void deletePost(Long postId);
    Post getPostById(Long postId);
    List<Post> getAllPosts();

}
