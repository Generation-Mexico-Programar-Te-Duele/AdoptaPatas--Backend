package org.programarteduele.app.controller;

import java.util.List;

import org.programarteduele.app.entity.Comment;
import org.programarteduele.app.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("adoptapatas/v1/comments")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping("/{userId}/{postId}")
    public ResponseEntity<Comment> createComment(@RequestBody Comment comment,
                                                @PathVariable Long userId,
                                                @PathVariable Long postId) {
        Comment createdComment = commentService.createComment(comment, userId, postId);
        if (createdComment != null) {
            return new ResponseEntity<>(createdComment, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{commentId}")
    public ResponseEntity<Comment> updateComment(@PathVariable Long commentId,
                                                @RequestBody Comment updatedComment) {
        Comment updatedCommentResult = commentService.updateComment(commentId, updatedComment);
        if (updatedCommentResult != null) {
            return new ResponseEntity<>(updatedCommentResult, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{commentId}")
    public ResponseEntity<Void> deleteComment(@PathVariable Long commentId) {
        commentService.deleteComment(commentId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/{commentId}")
    public ResponseEntity<Comment> getCommentById(@PathVariable Long commentId) {
        Comment comment = commentService.getCommentById(commentId);
        if (comment != null) {
            return new ResponseEntity<>(comment, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping
    public ResponseEntity<List<Comment>> getAllComments() {
        List<Comment> comments = commentService.getAllComments();
        return new ResponseEntity<>(comments, HttpStatus.OK);
    }
    
}
