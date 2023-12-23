SELECT * FROM adoptapatas.notification;

INSERT INTO notification (user_id, post_id, comment_id, notification_type, is_read)
		VALUES (1, 1, 1, "Ha comentado tu publicación", 1);

INSERT INTO notification (user_id, post_id, notification_type, is_read)
		VALUES (5, 5, "Le ha gustado tu publición", 0);

INSERT INTO notification (user_id, user_follower_id, notification_type, is_read)
		VALUES (6, 4, "Te ha seguido!", 1);

INSERT INTO notification (user_id, message_id, notification_type, is_read)
		VALUES (8, 4, "Te ha mandado un mensaje!", 0);

INSERT INTO notification (user_id, message_id, notification_type, is_read)
		VALUES (4, 8, "Te ha mandado un mensaje!", 1);
