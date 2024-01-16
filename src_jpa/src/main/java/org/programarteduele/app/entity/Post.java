package org.programarteduele.app.entity;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="user_post")
public class Post {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne // Muchas publicaciones pueden ser hechas por un usuario
	@JoinColumn(name = "user_author_id", referencedColumnName = "id", nullable=false)
	private User user;
	
	@Column(name="content", columnDefinition="TINYTEXT")
	private String postContent;
	
	@Column(name="created_at", updatable = false)
    @CreationTimestamp
	private LocalDateTime createdAt;
	
	@Column(name="image", length=255)
	private String postImage;
	
	@OneToMany(mappedBy = "post")
    private List<PostLike> postLikes;
	
    @OneToMany(mappedBy = "post")
    private List<Comment> postComments;

}
