DROP TABLE schedule;
DROP TABLE workout_exercise;
DROP TABLE exercise;
DROP TABLE premade_workout;

CREATE TABLE schedule (
class_id SERIAL,
class_name VARCHAR,
day_of_week INT,
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

INSERT INTO schedule (day_of_week, timeslot, class_name, max_occupancy, reserved_spaces)
VALUES (1, 6, 'Yoga', 8, 0), (3, 7, 'Water Aerobics', 15, 0), (4, 8, 'Spinning', 10, 0), 
(2, 7, 'Pilates', 8, 0), (5, 10, 'Kick Boxing', 5, 0), (6, 12, 'Kick Boxing', 5, 0), (7, 14, 'Spinning', 10, 0);

