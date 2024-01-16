package org.programarteduele.app.service.implementation;

import java.util.List;
import java.util.Optional;

import org.programarteduele.app.entity.Comment;
import org.programarteduele.app.entity.Post;
import org.programarteduele.app.entity.User;
import org.programarteduele.app.repository.CommentRepository;
import org.programarteduele.app.repository.PostRepository;
import org.programarteduele.app.repository.UserRepository;
import org.programarteduele.app.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImplementation implements CommentService{

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PostRepository postRepository;

    @Override
    public Comment createComment(Comment comment, Long userId, Long postId) {
        Optional<User> userOptional = userRepository.findById(userId);
        Optional<Post> postOptional = postRepository.findById(postId);

        if (userOptional.isPresent() && postOptional.isPresent()) {
            User user = userOptional.get();
            Post post = postOptional.get();

            comment.setUser(user);
            comment.setPost(post);
            // Igual, filtros para creación de comentario
            return commentRepository.save(comment);
        } else {
            // TODO manejo excepción
            return null;
        }
    }

    @Override
    public Comment updateComment(Long commentId, Comment updatedComment) {
        Optional<Comment> commentOptional = commentRepository.findById(commentId);
        if (commentOptional.isPresent()) {
            Comment existingComment = commentOptional.get();
            // Se pueden agregar implementaciones para actualización de usuario 
            existingComment.setCommentContent(updatedComment.getCommentContent());
            return commentRepository.save(existingComment);
        } else {
            // Manejo de excepción
            return null;
        }
    }

    @Override
    public void deleteComment(Long commentId) {
        Optional<Comment> commentOptional = commentRepository.findById(commentId);
        commentOptional.ifPresent(comment -> commentRepository.delete(comment));
        // Manejo de excepción comentario no encontrado
    }

    @Override
    public Comment getCommentById(Long commentId) {
        return commentRepository.findById(commentId).orElse(null);
    }

    @Override
    public List<Comment> getAllComments() {
        return (List<Comment>) commentRepository.findAll();
    }


}
