package org.programarteduele.app.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Table(name = "post_comment_likes")
public class CommentLike {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@ManyToOne()
	@JsonIgnore
	@JoinColumn(name = "comment_id")
	private Comment comment;

	@ManyToOne()
	@JoinColumn(name = "user_id")
	private User user;
}
