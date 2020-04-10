DROP TABLE schedule;
DROP TABLE category_workout;
DROP TABLE workout_exercise;
DROP TABLE exercise;
DROP TABLE premade_workout;
DROP TABLE category;

Create table category (
category_id serial,
name VARCHAR,

constraint pk_exercise_category primary key (category_id)
);

insert into category(name)
values ('Strength'),('Cardio'),('Flexibility'),('Crossfit');

CREATE TABLE schedule (
class_id SERIAL,
class_name VARCHAR,
date DATE,
timeslot INT,
max_occupancy INT,
reserved_spaces INT,
CONSTRAINT pk_schedule PRIMARY KEY (class_id)
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
  
INSERT INTO category_workout (category_id, workout_id)
VALUES (1,1), (1,2), (1,3), (2,4), (2,5), (2,6), (3,7), (3,8), (3,9), (4,10), (4,11), (4,12);          

INSERT INTO schedule (date, timeslot, class_name, max_occupancy, reserved_spaces)
VALUES ('2020-04-08', 6, 'Yoga', 10, 0), ('2020-04-09', 6, 'Yoga', 10, 0), ('2020-04-10', 6, 'Yoga', 10, 0),
 
('2020-04-13', 6, 'Yoga', 10, 0), ('2020-04-13', 6, 'Yoga', 10, 0), ('2020-04-14', 6, 'Yoga', 10, 0), ('2020-04-15', 6, 'Yoga', 10, 0), 

('2020-04-16', 6, 'Yoga', 10, 0), ('2020-04-17', 6, 'Yoga', 10, 0), ('2020-04-20', 6, 'Yoga', 10, 0), ('2020-04-21', 6, 'Yoga', 10, 0),

('2020-04-22', 6, 'Yoga', 10, 0), ('2020-04-23', 6, 'Yoga', 10, 0), ('2020-04-24', 6, 'Yoga', 10, 0), ('2020-04-27', 6, 'Yoga', 10, 0),
 
('2020-04-28', 6, 'Yoga', 10, 0), ('2020-04-29', 6, 'Yoga', 10, 0), ('2020-04-30', 6, 'Yoga', 10, 0), ('2020-05-01', 6, 'Yoga', 10, 0), 

('2020-05-04', 6, 'Yoga', 10, 0), ('2020-05-05', 6, 'Yoga', 10, 0), ('2020-05-06', 6, 'Yoga', 10, 0), ('2020-05-07', 6, 'Yoga', 10, 0),

('2020-05-08', 6, 'Yoga', 10, 0), ('2020-05-11', 6, 'Yoga', 10, 0), ('2020-05-12', 6, 'Yoga', 10, 0), ('2020-05-13', 6, 'Yoga', 10, 0),

('2020-05-14', 6, 'Yoga', 10, 0), ('2020-05-15', 6, 'Yoga', 10, 0), ('2020-05-18', 6, 'Yoga', 10, 0), ('2020-05-19', 6, 'Yoga', 10, 0),

('2020-05-20', 6, 'Yoga', 10, 0);


INSERT INTO schedule (date, timeslot, class_name, max_occupancy, reserved_spaces)
VALUES ('2020-04-11', 6, 'Yoga', 8, 0), ('2020-04-11', 7, 'Water Aerobics', 15, 0), ('2020-04-11', 8, 'Spinning', 10, 0),
('2020-04-11', 9, 'Pilates', 8, 0), ('2020-04-11', 10, 'Kick Boxing', 5, 0), ('2020-04-11', 11, 'Kick Boxing', 5, 0), ('2020-04-11', 12, 'Spinning', 10, 0),
('2020-04-11', 16, 'Kick Boxing', 5, 0),

('2020-04-12', 6, 'Yoga', 8, 0), ('2020-04-12', 7, 'Water Aerobics', 15, 0), ('2020-04-12', 8, 'Spinning', 10, 0),
('2020-04-12', 9, 'Pilates', 8, 0), ('2020-04-12', 10, 'Kick Boxing', 5, 0), ('2020-04-12', 11, 'Kick Boxing', 5, 0), ('2020-04-12', 12, 'Spinning', 10, 0),
('2020-04-12', 16, 'Kick Boxing', 5, 0),

('2020-04-18', 6, 'Yoga', 8, 0), ('2020-04-18', 7, 'Water Aerobics', 15, 0), ('2020-04-18', 8, 'Spinning', 10, 0),
('2020-04-18', 9, 'Pilates', 8, 0), ('2020-04-18', 10, 'Kick Boxing', 5, 0), ('2020-04-18', 11, 'Kick Boxing', 5, 0), ('2020-04-18', 12, 'Spinning', 10, 0),
('2020-04-18', 16, 'Kick Boxing', 5, 0),

('2020-04-19', 6, 'Yoga', 8, 0), ('2020-04-19', 7, 'Water Aerobics', 15, 0), ('2020-04-19', 8, 'Spinning', 10, 0),
('2020-04-19', 9, 'Pilates', 8, 0), ('2020-04-19', 10, 'Kick Boxing', 5, 0), ('2020-04-19', 11, 'Kick Boxing', 5, 0), ('2020-04-19', 12, 'Spinning', 10, 0),
('2020-04-19', 16, 'Kick Boxing', 5, 0),

('2020-04-25', 6, 'Yoga', 8, 0), ('2020-04-25', 7, 'Water Aerobics', 15, 0), ('2020-04-25', 8, 'Spinning', 10, 0),
('2020-04-25', 9, 'Pilates', 8, 0), ('2020-04-25', 10, 'Kick Boxing', 5, 0), ('2020-04-25', 11, 'Kick Boxing', 5, 0), ('2020-04-25', 12, 'Spinning', 10, 0),
('2020-04-25', 16, 'Kick Boxing', 5, 0),

('2020-04-26', 6, 'Yoga', 8, 0), ('2020-04-26', 7, 'Water Aerobics', 15, 0), ('2020-04-26', 8, 'Spinning', 10, 0),
('2020-04-26', 9, 'Pilates', 8, 0), ('2020-04-26', 10, 'Kick Boxing', 5, 0), ('2020-04-26', 11, 'Kick Boxing', 5, 0), ('2020-04-26', 12, 'Spinning', 10, 0),
('2020-04-26', 16, 'Kick Boxing', 5, 0),

('2020-05-02', 6, 'Yoga', 8, 0), ('2020-05-02', 7, 'Water Aerobics', 15, 0), ('2020-05-02', 8, 'Spinning', 10, 0),
('2020-05-02', 9, 'Pilates', 8, 0), ('2020-05-02', 10, 'Kick Boxing', 5, 0), ('2020-05-02', 11, 'Kick Boxing', 5, 0), ('2020-05-02', 12, 'Spinning', 10, 0),
('2020-05-02', 16, 'Kick Boxing', 5, 0),

('2020-05-03', 6, 'Yoga', 8, 0), ('2020-05-03', 7, 'Water Aerobics', 15, 0), ('2020-05-03', 8, 'Spinning', 10, 0),
('2020-05-03', 9, 'Pilates', 8, 0), ('2020-05-03', 10, 'Kick Boxing', 5, 0), ('2020-05-03', 11, 'Kick Boxing', 5, 0), ('2020-05-03', 12, 'Spinning', 10, 0),
('2020-05-03', 16, 'Kick Boxing', 5, 0),

('2020-05-09', 6, 'Yoga', 8, 0), ('2020-05-09', 7, 'Water Aerobics', 15, 0), ('2020-05-09', 8, 'Spinning', 10, 0),
('2020-05-09', 9, 'Pilates', 8, 0), ('2020-05-09', 10, 'Kick Boxing', 5, 0), ('2020-05-09', 11, 'Kick Boxing', 5, 0), ('2020-05-09', 12, 'Spinning', 10, 0),
('2020-05-09', 16, 'Kick Boxing', 5, 0),

('2020-05-10', 6, 'Yoga', 8, 0), ('2020-05-10', 7, 'Water Aerobics', 15, 0), ('2020-05-10', 8, 'Spinning', 10, 0),
('2020-05-10', 9, 'Pilates', 8, 0), ('2020-05-10', 10, 'Kick Boxing', 5, 0), ('2020-05-10', 11, 'Kick Boxing', 5, 0), ('2020-05-10', 12, 'Spinning', 10, 0),
('2020-05-10', 16, 'Kick Boxing', 5, 0),

('2020-05-16', 6, 'Yoga', 8, 0), ('2020-05-16', 7, 'Water Aerobics', 15, 0), ('2020-05-16', 8, 'Spinning', 10, 0),
('2020-05-16', 9, 'Pilates', 8, 0), ('2020-05-16', 10, 'Kick Boxing', 5, 0), ('2020-05-16', 11, 'Kick Boxing', 5, 0), ('2020-05-16', 12, 'Spinning', 10, 0),
('2020-05-16', 16, 'Kick Boxing', 5, 0),

('2020-05-17', 6, 'Yoga', 8, 0), ('2020-05-17', 7, 'Water Aerobics', 15, 0), ('2020-05-17', 8, 'Spinning', 10, 0),
('2020-05-17', 9, 'Pilates', 8, 0), ('2020-05-17', 10, 'Kick Boxing', 5, 0), ('2020-05-17', 11, 'Kick Boxing', 5, 0), ('2020-05-17', 12, 'Spinning', 10, 0),
('2020-05-17', 16, 'Kick Boxing', 5, 0);

