package org.programarteduele.app.entity;

import java.util.Date;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="notification")
public class Notification {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "type_id", referencedColumnName = "id")
    private NotificationType type;

    @ManyToOne
    @JoinColumn(name = "source_user_id", referencedColumnName = "id")
    private User sourceUser;

    @ManyToOne
    @JoinColumn(name = "post_id", referencedColumnName = "id")
    private Post post;

    @ManyToOne
    @JoinColumn(name = "comment_id", referencedColumnName = "comment_id")
    private Comment comment;

    @Column(name = "received_at",columnDefinition="DATETIME DEFAULT CURRENT_TIMESTAMP")
	@Temporal(TemporalType.TIMESTAMP)
    private Date receivedAt;

    @Column(name = "read_at",columnDefinition="DATETIME DEFAULT CURRENT_TIMESTAMP")
	@Temporal(TemporalType.TIMESTAMP)
    private Date readAt;

}
