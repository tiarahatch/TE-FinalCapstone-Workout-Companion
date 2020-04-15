DROP TABLE schedule;
DROP TABLE category_workout;
DROP TABLE workout_exercise;
DROP TABLE exercise;
DROP TABLE premade_workout;
DROP TABLE category;
DROP TABLE class_options;

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
description VARCHAR,
yt_link VARCHAR,
CONSTRAINT pk_exercise PRIMARY KEY (exercise_id)
);


INSERT INTO exercise (name, reps, sets, description, yt_link)
VALUES 
('Bicep Curls', 10, 3, 'Stand holding a dumbbell in each hand with your arms hanging by your sides. Ensure your elbows are close to your torso and your palms facing forward. Keeping your upper arms stationary, exhale as you curl the weights up to shoulder level while contracting your biceps', 'Nkl8WnH6tDU'), 
('Pull Ups', 3, 3, 'Grab the pullup bar with your palms down shoulder-width grip, hang to the pullup-bar with straight arms and your legs off the floor. Pull yourself up by pulling your elbows down to the floor, go all the way up until your chin passes the bar. Lower yourself until your arms are straight', 'nJrDnZp2LOo'), 
('Dips', 10, 2, 'Grab the parallel bars and jump up, straighten your arms. Lower your body by bending your arms while leaning forward, dip down until your shoulders are below your elbows. Lift your body up by straightening your arms, lock your elbows at the top', 'dX_nSOOJIsE'),
('Squats', 5, 4, 'Stand with your head facing forward and your chest held up and out. Place your feet shoulder-width apart or slightly wider. Extend your hands straight out in front of you to help keep your balance. Sit back and down like youre sitting into an imaginary chair. Keep your head facing forward as your upper body bends forward a bit. Rather than allowing your back to round, let your lower back arch slightly as you descend. Keep your body tight, and push through your heels to bring yourself back to the starting position', 'aclHkVaku9U'),
 ('Lunges', 10, 4, 'Keep your upper body straight, with your shoulders back and relaxed and chin up (pick a point to stare at in front of you so you dont keep looking down). Always engage your core. Step forward with one leg, lowering your hips until both knees are bent at about a 90-degree angle. Keep the weight in your heels as you push back up to the starting position', 'QOVaHwm-Q6U'), 
 ('Box Step Ups', 8, 3, 'Hold dumbbells in your hands or a barbell across your shoulders. Step up with the right foot, pressing through the heel to straighten your right leg. Bring the left foot to meet your right foot on top of the step. Bend your right knee and step down with the left foot. Bring the right foot down to meet the left foot on the ground', '5qjqDHOUh-A'), 
 ('Dead Lifts', 3, 2, 'Stand with your mid-foot under the barbell. Bend over and grab the bar with a shoulder-width grip, and bend your knees until your shins touch the bar. Lift your chest up and straighten your lower back. Take a big breath, hold it, and stand up with the weight', 'IiGk8g3e41w'), 
 ('Dumbbell Rows', 5, 3, 'Grip the barbell with a grip that’s similar in width to your deadlift, or slightly wider. Once you’ve established your grip, lift the bar off the ground and bend over maintaining a strong set back and hip hinge', 'HE5IBnWYEq4'),
('Seated Cable Rows', 10, 4, 'Pull the handle and weight back toward the lower abdomen while trying not to use the momentum of the row too much by moving the torso backward with the arms. Target the middle to upper back by keeping your back straight and squeezing your shoulder blades together as you row, chest out', 'xQNrFHEMhI4'), 
('Bicycle Crunches', 20, 2, 'Lie flat on the floor with your lower back pressed to the ground. Put your hands behind your head, then bring your knees in towards your chest and lift your shoulder blades off the ground. Straighten your right leg out to about a 45-degree angle to the ground while turning your upper body to the left, bringing your right elbow towards the left knee', 'Iwyvozckjak'), 
('Tuck Ups', 7, 4, 'Lie face-up on the floor with your legs and arms straight and lifted off the floor slightly. In one movement, lift your torso and legs as if youre trying to touch your toes. Lower your body back down', 'NBwz02SXl6Q'), 
('Mountain Climbers', 12, 3, 'Get into a plank position, making sure to distribute your weight evenly between your hands and your toes. Pull your right knee into your chest as far as you can. Then switch, pulling that knee out and bringing the other knee in. Keeping your hips down, run your knees in and out as far and as fast as you can', 'nmwgirgXLYM'), 
('Elliptical', 60, 3, 'Step onto the machine facing the console. Typically, nothing will happen until you start pedaling and turn on the machine. To turn on the monitor, start pedaling by pushing the pedals in a forward motion with your feet, and pushing and pulling on the handles evenly. Follow the instructions on the display to select one of the pre-set programs or you can simply choose manual and set your own workout', 'j38LNpTLwzY'),
 ('Treadmill', 60, 2, 'Step onto the machine facing the console. To turn on the monitor, press the start button. Follow the instructions on the display to select one of the pre-set programs or you can simply choose manual and set your own workout', 'BwuaiNWBodo'), 
 ('Stair Stepper', 60, 2, 'Step onto the machine facing the console. Typically, nothing will happen until you start pedaling and turn on the machine. To turn on the monitor, start by stepping down on one step. Follow the instructions on the display to select one of the pre-set programs or you can simply choose manual and set your own workout', 'y0zGTCPk3mA'),
('Air Squats', 15, 2, 'Keep your feet at shoulder width apart and pointed straight ahead. When squatting, your hips will move down and back. Your lumbar curve should be maintained, and your heels should stay flat on the floor the entire time. In air squats, your hips will descend lower than your knees', 'R0vJBTrzLac'), 
('High Knees', 10, 2, 'Stand with your feet hip-width apart. Lift up your left knee to your chest. Switch to lift your right knee to your chest. Continue the movement, alternating legs and moving at a sprinting or running pace', 'oDdkytliOqE'), 
('Jump Lunges', 9, 4, 'Starting standing with feet shoulder-width apart. Jump your left leg forward and your right leg back into a lunge, with both knees at 90 degrees. Jump up and switch your legs in midair so that you land in a lunge with your right leg in front. Continue jumping back and forth, pausing as little as possible', 'Mp-mfmTxhnk'),
 ('Navasana', 60, 2, 'Sit with your knees bent, feet on the floor. Place your hands behind your knees, lift the chest, engaging the back muscles as you inhale. Engage your inner thighs and draw your lower belly in and up. Tip back on the back of your sitting bones and lift your feet up to about knee height, toes spread out. Bring your arms parallel to the floor. To go further, straighten your legs. Stay for 2-5 breaths, work up to 10 breaths', 'eV15LEYeW0g'), 
 ('Vriksasana', 60, 2, 'Stand tall and straight with arms by the side of your body. Bend your right knee and place the right foot high up on your left thigh. Once you are well balanced, take a deep breath in, gracefully raise your arms over your head from the side, and bring your palms together in ‘Namaste’ mudra (hands-folded position). Ensure that your spine is straight. Keep taking in long deep breaths. With each exhalation, relax the body more and more', 'Dic293YNJI8'), 
 ('Tadasana', 60, 1, 'Lift up all of your toes and fan them out, then drop them back down to create a wide, solid base. Let your feet and calves root down into the floor. Engage your quadriceps (the muscles on the front of your thighs) and draw them upward, causing your kneecaps to rise. Rotate both thighs inward, creating a widening of the sit bones. Tone your belly, drawing it in slightly. Widen your collarbones and check that your shoulders are stacked over your pelvis. Shrug your shoulders up to your ears and then roll them back to release your shoulder blades down your back. Let your arms hang naturally with the elbows slightly bent and the palms facing forward', 'ET_cKo1Ta1s'), 
 ('Leg Circles', 15, 2, 'Engage your core. Pull your abdominal muscles in, anchoring the pelvis and shoulders. Draw one knee in towards the chest and then extend it straight toward the ceiling. Inhale and cross the extended leg up and over the body. It angles up toward the opposite shoulder and over the outstretched leg. Exhale and lower the leg down towards the center line in a circling motion', 'RZqtVL6K8DM'), 
 ('Single Leg Stretches', 12, 3, 'Start on your back with your knees bent and your shins parallel to the floor. This is​ the tabletop position for the legs. Pull your abs in as you exhale, taking your belly button down toward your spine as you curl your head and shoulders up to the tips of the shoulder blades. As you curl up, extend your left leg at a 45-degree angle. The right leg remains in tabletop position with the right hand grasping the right ankle and the left hand moving to the right knee. You will maintain your upper-body curve throughout the exercise. Be sure to keep your shoulders relaxed and your abdominals deeply scooped', 'Ad4lgW4ieAM'),
('Criss-Crosses', 9, 2, 'Bend your knees and bring your shins up so that they are parallel to the floor. Place your hands behind your head, supporting the base of the skull. Keep the elbows wide. Use an exhale to pull your abs into a deep scoop, and leaving the pelvis in a neutral position (not tucked or tipped), curl the chin and shoulders off the mat up to the base of the shoulder blades. Ensure your shoulder blades are kept down. Your upper body is in a full curve, your abs are pulling your belly button down to your spine, and your legs are in tabletop position. Reach your left leg out long, and as you keep the elbows wide, rotate your torso toward the bent right knee so that your left armpit is reaching toward the knee', 'gzaCxDVQL90'),
 ('Calf Stretch', 60, 1, 'Stand near a wall with one foot in front of the other, front knee slightly bent. Keep your back knee straight, your heel on the ground, and lean toward the wall. Feel the stretch all along the calf of your back leg. Hold this stretch for 20-30 seconds', 'bv373Y1oeck'), 
 ('Lower Back Stretch', 60, 1, 'Bend the neck to one side as if to touch the ear to the shoulder until a stretch is felt in the side of the neck. Keep the shoulders down and back in a comfortable but healthy posture', 'Ggzb-IpH8ZY'),
  ('Hamstring Stretch', 60, 1, 'Lie back on the floor with the buttocks against a wall at a corner or by a door jamb. Keeping one leg on the floor, place the foot of the alternate leg against the wall and try to gently push the knee straight so the raised leg and the leg on the floor make a 90 degree angle. Hold the position for 10 to 20 seconds', 'yT4mIxlAklo'), 
  ('Push Ups', 10, 2, 'Get down on all fours, placing your hands slightly wider than your shoulders. Straighten your arms and legs. Lower your body until your chest nearly touches the floor. Pause, then push yourself back up', 'eFOSh8vpd6I'),
   ('Sit Ups', 10, 2, 'Lie down on your back. Bend your legs and place feet firmly on the ground to stabilize your lower body. Cross your hands to opposite shoulders or place them behind your ears, without pulling on your neck. Curl your upper body all the way up toward your knees. Exhale as you lift. Slowly, lower yourself down, returning to your starting point. Inhale as you lower', 'jDwoBqPH0jk'),
    ('Tuck Jumps', 9, 3, 'Start in standing position with feet hip-width apart. Bend knees slightly and extend arms out at shoulder height, elbows bent and wide, palms facing floor. Jump straight up, lifting knees to touch hands. Land softly with knees bent', 'r7oBejx1PHM'), 
    ('Jog', 60, 2, 'Keep your upper body relaxed while jogging and avoid heel-striking. Learn to run tall and hold your arms in a 90 degree position and keep them beside your body. Breathe regularly by syncing your breathing with your steps', 'k2L97eKS5qk');


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


