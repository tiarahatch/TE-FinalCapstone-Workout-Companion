DROP TABLE schedule;
DROP TABLE workout_exercise;
DROP TABLE exercise;
DROP TABLE premade_workout;

CREATE TABLE schedule (
class_id SERIAL,
class_name VARCHAR,
date DATE,
timeslot INT,
max_occupancy INT,
reserved_spaces INT,
CONSTRAINT pk_schedule PRIMARY KEY (class_id)
);


CREATE TABLE premade_workout (
workout_id SERIAL,
name VARCHAR,
workout_time INT,
CONSTRAINT pk_workout PRIMARY KEY (workout_id)
);


CREATE TABLE exercise (
exercise_id SERIAL,
name VARCHAR,
reps INT,
sets INT, 
CONSTRAINT pk_exercise PRIMARY KEY (exercise_id)
);


CREATE TABLE workout_exercise (
workout_id INT,
exercise_id INT,
CONSTRAINT fk_workout FOREIGN KEY (workout_id) REFERENCES premade_workout (workout_id),
CONSTRAINT fk_exercise FOREIGN KEY (exercise_id) REFERENCES exercise (exercise_id)
);


INSERT INTO exercise (name, reps, sets)
VALUES ('Body Weight Squats', 10, 3), ('Elevated Push-ups', 10, 3), ('Backward Lunges', 10, 3), ('Plank', 10, 3), ('Side Lunges', 10, 3),
('Jumping Jacks', 30, 4), ('Burpees', 10, 3), ('Situps', 25, 4), ('Mountain Climbers', 15, 6), ('Bench-press', 10, 3), ('Lat Pull-downs', 10, 3),
('Leg Press', 10, 3), ('Bicep Curls', 10, 3), ('Incline Bench', 10, 3), ('Pushups', 10, 3), ('Leg Curls', 10, 3), ('Rows', 10, 3), ('Flys', 10, 3),
('Pullups', 4, 3), ('Shoulder Press', 10, 3);   


INSERT INTO premade_workout (name, workout_time)
VALUES ('HIIT', 30), ('Cardio', 45), ('Strength', 60), ('Crossfit', 45);

INSERT INTO workout_exercise (workout_id, exercise_id)
VALUES (1, 4), (1, 6), (1, 9), (1, 1), (1, 7), (2, 7), (2, 6), (2, 8), (2, 10), (2, 15), (3, 14), 
(3, 2), (3, 12), (3, 16), (3, 20), (4, 7), (4, 19), (4, 18), (4, 14), (4, 17);


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

SELECT * FROM schedule

drop table full_workout;
drop table exercise_category;
drop table workout_target;
Create table exercise_category (
category_id serial,
category_name VARCHAR,

constraint pk_exercise_category primary key (category_id)
);

insert into exercise_category(category_name)
values ('Cardio'),('Strength'),('Flexibility'),('Crossfit');


//(this is our premade workout
create table workout_target (
target_id serial,
name varchar,

constraint pk_workout_target primary key (target_id)
);

insert into workout_target (name)
values('UpperBody'),('LowerBody'),('HIIT'),('Crossfit');

create table full_workout (
target_id int,
exercise_id int
);

insert into full_workout (target_id, exercise_id)
values (1,2),(1,4),(1,8),(1,10),(1,11),(1,13),
(1,14),(1,15),(1,18),(1,19),(1,20),(2,1),(2,3),
(2,5),(2,6),(2,7),(2,9),(2,12),(2,16),(2,17),
(3,1),(3,2),(3,6),(3,7),(3,8),(3,9),(3,17),
(4,1),(4,2),(4,3),(4,5),(4,10),(4,11),(4,12),(4,13),(4,19);


select * from full_workout;