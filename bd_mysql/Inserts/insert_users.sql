-- Inserción de datos en tabla user
SELECT * FROM user;


-- User 1
INSERT INTO user (first_name, last_name, username, age, email, phone, password_hash, city, state, profile_picture, bio)
		VALUES ('John', 'Doe', 'john_pet', 43, 'john@example.com','128467365', 'hashed_password_1','Agustos', 'Alabama','profile1.jpg', 'Looking forward to adopt a pet!');
        
-- Adding Users who are registered as shelters
-- User as shelter 1
INSERT INTO user (first_name, last_name, username, age, email, phone, password_hash, city, state, profile_picture, bio, user_type_rol)
	VALUES ('Sarah', 'Johnson', 'sarah_furbuddie', 25, 'sara@example.com','123987654', 'hashed_password_7', 'Furrytown', 'Texas', 'profile7.jpg', 'Fostering pets and making a difference.', 'PetPoster', 'Shelter');

-- Eliminar todos los datos y resetear el valor de id a 1.
-- TRUNCATE TABLE user; 