-- Inserción de datos en tabla user
SELECT * FROM user;
-- User 1
INSERT INTO user (first_name, last_name, username, email, phone, 
				password_hash, street_name, city, state, zip_code, profile_picture, bio)
		VALUES ('John', 'Doe', 'john_pet', 'john@example.com','128467365', 'hashed_password_1','Alabama St 3',
				'Agustos', 'Alabama', '55331','profile1.jpg', 'Looking forward to adopt a pet!');
-- User 2
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio)
VALUES ('Jane', 'Smith', 'jane_animallover', 'jane@example.com','987654321', 'hashed_password_2',
        'Maple Ave 15', 'Springfield', 'Illinois', '62701', 'profile2.jpg', 'Passionate about animal welfare!');

-- User 3
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio)
VALUES ('Alice', 'Johnson', 'alice_pawprints', 'alice@example.com','555123456', 'hashed_password_3',
        'Oak St 7', 'Barksville', 'California', '90210', 'profile3.jpg', 'Rescuing pets is my mission!');

-- User 4
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio)
VALUES ('Bob', 'Williams', 'bob_furryfriends', 'bob@example.com','123456789', 'hashed_password_4',
        'Cedar Ln 22', 'Pawsburg', 'New York', '10001', 'profile4.jpg', 'Animal enthusiast seeking companionship.');

-- User 5
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio)
VALUES ('Emma', 'Taylor', 'emma_petpal', 'emma@example.com','111222333', 'hashed_password_5',
        'Pine St 10', 'Furville', 'Texas', '75001', 'profile5.jpg', 'Creating a home for furry friends!');
        
-- Adding Users who are registered as shelters
-- User as shelter 1
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio, role, user_type)
VALUES ('Michael', 'Anderson', 'mike_pawlover', 'michael@example.com','555678912', 'hashed_password_6',
        'Oakwood Blvd 18', 'Pawsville', 'Florida', '33101', 'profile6.jpg', 'Adopting pets brings joy to my life!', 'PetPoster', 'Shelter');

-- User as shelter 2
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio, role, user_type)
VALUES ('Sarah', 'Johnson', 'sarah_furbuddies', 'sarah@example.com','123987654', 'hashed_password_7',
        'Cedar Ave 5', 'Furrytown', 'Texas', '75002', 'profile7.jpg', 'Fostering pets and making a difference.', 'PetPoster', 'Shelter');

-- User as shelter 3
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio, role, user_type)
VALUES ('Chris', 'Williams', 'chris_petrescuer', 'chris@example.com','987654321', 'hashed_password_8',
        'Maple St 12', 'Pawstropolis', 'California', '90211', 'profile8.jpg', 'Rescuing pets is a lifelong commitment.', 'PetPoster', 'Shelter');

-- User as shelter 4
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio, role, user_type)
VALUES ('Olivia', 'Davis', 'olivia_animaladvocate', 'olivia@example.com','111222333', 'hashed_password_9',
        'Birch Ln 8', 'Furville', 'New York', '10002', 'profile9.jpg', 'Advocating for the well-being of animals.', 'PetPoster', 'Shelter');

-- User as shelter 5
INSERT INTO user (first_name, last_name, username, email, phone, 
                password_hash, street_name, city, state, zip_code, profile_picture, bio, role, user_type)
VALUES ('Daniel', 'Garcia', 'daniel_petsupporter', 'daniel@example.com','555444666', 'hashed_password_10',
        'Willow St 25', 'Pawhaven', 'Arizona', '85001', 'profile10.jpg', 'Supporting pet adoption and care initiatives.', 'PetPoster', 'Shelter');
