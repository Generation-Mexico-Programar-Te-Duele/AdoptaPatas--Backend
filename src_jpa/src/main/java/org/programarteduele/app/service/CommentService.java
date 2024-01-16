package org.programarteduele.app.service;

import java.util.List;

import org.programarteduele.app.entity.Comment;

public interface CommentService {
	
    Comment createComment(Comment comment, Long userId, Long postId);
    Comment updateComment(Long commentId, Comment updatedComment);
    void deleteComment(Long commentId);
    Comment getCommentById(Long commentId);
    List<Comment> getAllComments();

}
