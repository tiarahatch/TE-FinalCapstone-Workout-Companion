DROP TABLE schedule;
DROP TABLE category_workout;
DROP TABLE workout_exercise;
DROP TABLE exercise;
DROP TABLE premade_workout;
DROP TABLE category;
DROP TABLE class_options;
DROP TABLE user_profile;

Create table category (
category_id serial,
name VARCHAR,

constraint pk_exercise_category primary key (category_id)
);

insert into category(name)
values ('Strength'),('Cardio'),('Flexibility'),('Crossfit');

CREATE TABLE schedule (
class_id SERIAL,
class_option INT,
date DATE,
timeslot INT,
max_occupancy INT,
reserved_spaces INT,
CONSTRAINT pk_schedule PRIMARY KEY (class_id)
);

CREATE TABLE class_options(
class_option_id SERIAL,
class_name VARCHAR,
class_description VARCHAR,
CONSTRAINT pk_class_options PRIMARY KEY (class_option_id)
);


create table premade_workout (
workout_id serial,
name varchar,

constraint pk_premade_workout primary key (workout_id)
);

insert into premade_workout (name)

values('Upper-Body'),('Lower-Body'), ('Back'), ('HIIT'), ('Various-Circuit'), ('At-Home Cardio'), ('Yoga'), 
('Pilates'), ('Stretches'), ('Body Weight'), ('Push-Pull-Run'), ('Jumps and Lunges');


CREATE TABLE exercise (
exercise_id SERIAL,
name VARCHAR,
reps INT,
sets INT, 
CONSTRAINT pk_exercise PRIMARY KEY (exercise_id)
);

INSERT INTO exercise (name, reps, sets)
VALUES ('Bicep Curls', 10, 3), ('Pull Ups', 3, 3), ('Dips', 10, 2), ('Squats', 5, 4), ('Lunges', 10, 4), ('Box Step Ups', 8, 3), ('Dead Lifts', 3, 2), ('Dumbbell Rows', 5, 3),
('Seated Cable Rows', 10, 4), ('Bicycle Crunches', 20, 2), ('Tuck Ups', 7, 4), ('Mountain Climbers', 12, 3), ('Elliptical', 60, 3), ('Treadmill', 60, 2), ('Stair Stepper', 60, 2),
('Air Squats', 15, 2), ('High Knees', 10, 2), ('Jump Lunges', 9, 4), ('Navasana', 60, 2), ('Vriksasana', 60, 2), ('Tadasana', 60, 1), ('Leg Circles', 15, 2), ('Single Leg Stretches', 12, 3),
('Criss-Crosses', 9, 2), ('Calf Stretch', 60, 1), ('Lower Back Stretch', 60, 1), ('Hamstring Stretch', 60, 1), ('Push Ups', 10, 2), ('Sit Ups', 10, 2), ('Tuck Jumps', 9, 3), ('Jog', 60, 2);


CREATE TABLE workout_exercise (
workout_id INT,
exercise_id INT,
CONSTRAINT fk_workout FOREIGN KEY (workout_id) REFERENCES premade_workout (workout_id),
CONSTRAINT fk_exercise FOREIGN KEY (exercise_id) REFERENCES exercise (exercise_id)
);

INSERT INTO workout_exercise (workout_id, exercise_id)
VALUES (1,1), (1,2), (1,3), (2,4), (2,5), (2,6), (3,7), (3,8), (3,9), (4,10), (4,11), (4,12), 
(5,13), (5,14), (5,15), (6,16), (6,17), (6,18), (7,19), (7,20), (7,21), (8,22), (8,23), (8,24), (9,25), 
(9,26), (9,27), (10,28), (10,29), (10,30), (11,28), (11,2), (11,31), (12,5), (12,18), (12,17);

CREATE TABLE category_workout (
category_id INT,
workout_id INT,
CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category (category_id), 
CONSTRAINT fk_workout FOREIGN KEY (workout_id) REFERENCES premade_workout (workout_id)
);

CREATE TABLE user_profile (
profile_id serial,
user_id int,
fullName varchar,
birthdate date,
height int,
currentWeight int,
goalWeight int, 
gender varchar,

CONSTRAINT pk_user_profile primary key (profile_id),
CONSTRAINT fk_user foreign key (user_id) REFERENCES users (id)
);

INSERT INTO category_workout (category_id, workout_id)
VALUES (1,1), (1,2), (1,3), (2,4), (2,5), (2,6), (3,7), (3,8), (3,9), (4,10), (4,11), (4,12);          

INSERT INTO class_options (class_name, class_description)
VALUES ('Yoga', 'In this class, postures are practiced to align, strengthen and promote flexibility in the body. Breathing techniques and meditation are also integrated. You can expect an emphasis on simplicity, repetition, and ease of movement. Full-body relaxation and balance are the goals, as we make a full circuit of the body’s range of motion with standing postures, twists, backbends, forward folds, and hip openers.'),
('Water Aerobics', 'Take the plunge and try this low-impact workout that builds muscle strength and boosts your endurance. It''s fun, and it can be as challenging as you like. Each water aerobics class includes a warm-up, cardio and strength-training exercises, and a cooldown. Expect exercises like water walking, bicep curls, leg lifts, and kickboard moves. You won''t be swimming, and most water workouts are done in the shallow end of the pool.'),
('Spinning', 'A fun, heart-pumping workout on a beautiful Star Trac spin bike. Ride on the flats, up hills, through rolling hills led by a certified instructor motivated by great music. Spinning is perfect for everyone since you control the resistance and pedal speed creating just the right intensity for you.'),
('Pilates', 'Pilates is a form of low-impact exercise that aims to strengthen muscles while improving postural alignment and flexibility. Pilates moves tend to target the core, although the exercises work other areas of your body as well. Our signature contemporary Reformer class will strengthen and lengthen your entire body. Creatively flow from the Reformer to the Springboard, EXO-Chair, Mat, TRX, and more. Experience the benefits of classical Pilates with a twist.'),
('Kick Boxing', 'Cardio kickboxing is a group fitness class that combines martial arts techniques with fast-paced cardio. This high-energy workout challenges the beginner and elite athlete alike. Build stamina, improve coordination and flexibility, and burn calories as you build lean muscle with this fun and challenging workout. ')
;



INSERT INTO schedule (date, timeslot, class_option, max_occupancy, reserved_spaces)
VALUES ('2020-04-08', 6, 1, 10, 0), ('2020-04-09', 6, 1, 10, 0), ('2020-04-10', 6, 1, 10, 0),
 
('2020-04-13', 6, 1, 10, 0), ('2020-04-13', 6, 1, 10, 0), ('2020-04-14', 6, 1, 10, 0), ('2020-04-15', 6, 1, 10, 0), 

('2020-04-16', 6, 1, 10, 0), ('2020-04-17', 6, 1, 10, 0), ('2020-04-20', 6, 1, 10, 0), ('2020-04-21', 6, 1, 10, 0),

('2020-04-22', 6, 1, 10, 0), ('2020-04-23', 6, 1, 10, 0), ('2020-04-24', 6, 1, 10, 0), ('2020-04-27', 6, 1, 10, 0),
 
('2020-04-28', 6, 1, 10, 0), ('2020-04-29', 6, 1, 10, 0), ('2020-04-30', 6, 1, 10, 0), ('2020-05-01', 6, 1, 10, 0), 

('2020-05-04', 6, 1, 10, 0), ('2020-05-05', 6, 1, 10, 0), ('2020-05-06', 6, 1, 10, 0), ('2020-05-07', 6, 1, 10, 0),

('2020-05-08', 6, 1, 10, 0), ('2020-05-11', 6, 1, 10, 0), ('2020-05-12', 6, 1, 10, 0), ('2020-05-13', 6, 1, 10, 0),

('2020-05-14', 6, 1, 10, 0), ('2020-05-15', 6, 1, 10, 0), ('2020-05-18', 6, 1, 10, 0), ('2020-05-19', 6, 1, 10, 0),

('2020-05-20', 6, 1, 10, 0);


INSERT INTO schedule (date, timeslot, class_option, max_occupancy, reserved_spaces)
VALUES ('2020-04-11', 6, 1, 8, 0), ('2020-04-11', 7, 2, 15, 0), ('2020-04-11', 8, 3, 10, 0),
('2020-04-11', 9, 4, 8, 0), ('2020-04-11', 10, 5, 5, 0), ('2020-04-11', 11, 5, 5, 0), ('2020-04-11', 12, 3, 10, 0),
('2020-04-11', 16, 5, 5, 0),

('2020-04-12', 6, 1, 8, 0), ('2020-04-12', 7, 2, 15, 0), ('2020-04-12', 8, 3, 10, 0),
('2020-04-12', 9, 4, 8, 0), ('2020-04-12', 10, 5, 5, 0), ('2020-04-12', 11, 5, 5, 0), ('2020-04-12', 12, 3, 10, 0),
('2020-04-12', 16, 5, 5, 0),

('2020-04-18', 6, 1, 8, 0), ('2020-04-18', 7, 2, 15, 0), ('2020-04-18', 8, 3, 10, 0),
('2020-04-18', 9, 4, 8, 0), ('2020-04-18', 10, 5, 5, 0), ('2020-04-18', 11, 5, 5, 0), ('2020-04-18', 12, 3, 10, 0),
('2020-04-18', 16, 5, 5, 0),

('2020-04-19', 6, 1, 8, 0), ('2020-04-19', 7, 2, 15, 0), ('2020-04-19', 8, 3, 10, 0),
('2020-04-19', 9, 4, 8, 0), ('2020-04-19', 10, 5, 5, 0), ('2020-04-19', 11, 5, 5, 0), ('2020-04-19', 12, 3, 10, 0),
('2020-04-19', 16, 5, 5, 0),

('2020-04-25', 6, 1, 8, 0), ('2020-04-25', 7, 2, 15, 0), ('2020-04-25', 8, 3, 10, 0),
('2020-04-25', 9, 4, 8, 0), ('2020-04-25', 10, 5, 5, 0), ('2020-04-25', 11, 5, 5, 0), ('2020-04-25', 12, 3, 10, 0),
('2020-04-25', 16, 5, 5, 0),

('2020-04-26', 6, 1, 8, 0), ('2020-04-26', 7, 2, 15, 0), ('2020-04-26', 8, 3, 10, 0),
('2020-04-26', 9, 4, 8, 0), ('2020-04-26', 10, 5, 5, 0), ('2020-04-26', 11, 5, 5, 0), ('2020-04-26', 12, 3, 10, 0),
('2020-04-26', 16, 5, 5, 0),

('2020-05-02', 6, 1, 8, 0), ('2020-05-02', 7, 2, 15, 0), ('2020-05-02', 8, 3, 10, 0),
('2020-05-02', 9, 4, 8, 0), ('2020-05-02', 10, 5, 5, 0), ('2020-05-02', 11, 5, 5, 0), ('2020-05-02', 12, 3, 10, 0),
('2020-05-02', 16, 5, 5, 0),

('2020-05-03', 6, 1, 8, 0), ('2020-05-03', 7, 2, 15, 0), ('2020-05-03', 8, 3, 10, 0),
('2020-05-03', 9, 4, 8, 0), ('2020-05-03', 10, 5, 5, 0), ('2020-05-03', 11, 5, 5, 0), ('2020-05-03', 12, 3, 10, 0),
('2020-05-03', 16, 5, 5, 0),

('2020-05-09', 6, 1, 8, 0), ('2020-05-09', 7, 2, 15, 0), ('2020-05-09', 8, 3, 10, 0),
('2020-05-09', 9, 4, 8, 0), ('2020-05-09', 10, 5, 5, 0), ('2020-05-09', 11, 5, 5, 0), ('2020-05-09', 12, 3, 10, 0),
('2020-05-09', 16, 5, 5, 0),

('2020-05-10', 6, 1, 8, 0), ('2020-05-10', 7, 2, 15, 0), ('2020-05-10', 8, 3, 10, 0),
('2020-05-10', 9, 4, 8, 0), ('2020-05-10', 10, 5, 5, 0), ('2020-05-10', 11, 5, 5, 0), ('2020-05-10', 12, 3, 10, 0),
('2020-05-10', 16, 5, 5, 0),

('2020-05-16', 6, 1, 8, 0), ('2020-05-16', 7, 2, 15, 0), ('2020-05-16', 8, 3, 10, 0),
('2020-05-16', 9, 4, 8, 0), ('2020-05-16', 10, 5, 5, 0), ('2020-05-16', 11, 5, 5, 0), ('2020-05-16', 12, 3, 10, 0),
('2020-05-16', 16, 5, 5, 0),

('2020-05-17', 6, 1, 8, 0), ('2020-05-17', 7, 2, 15, 0), ('2020-05-17', 8, 3, 10, 0),
('2020-05-17', 9, 4, 8, 0), ('2020-05-17', 10, 5, 5, 0), ('2020-05-17', 11, 5, 5, 0), ('2020-05-17', 12, 3, 10, 0),
('2020-05-17', 16, 5, 5, 0);


