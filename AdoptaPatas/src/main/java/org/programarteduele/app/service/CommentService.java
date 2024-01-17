package org.programarteduele.app.service;

import java.util.List;

import org.programarteduele.app.entity.Comment;
import org.programarteduele.app.entity.Post;

public interface CommentService {
	
	Comment getCommentById(Integer id);
	Comment createComment(Comment comment);
	List<Comment> getAllComments();
	List<Comment> getCommentsByPostId(int postId);
	Comment updateComment(Comment comment, Integer id);
	void deleteComment(Integer id);

}
