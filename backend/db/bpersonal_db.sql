DROP DATABASE IF EXISTS bpersonal_db;

CREATE DATABASE bpersonal_db;

\c bpersonal_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS hashtags;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR,
    password VARCHAR,
    full_name VARCHAR,
    email_address VARCHAR,
    profile_pic_url varchar,
    bio VARCHAR
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    owner_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_image_url VARCHAR,
    body VARCHAR,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments
(
    id SERIAL PRIMARY KEY,
    author_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,
    content VARCHAR,
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE likes
(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,
    CONSTRAINT UC_like UNIQUE (liker_id,post_id)
);

CREATE TABLE hashtags
(
    id SERIAL PRIMARY KEY,
    owner_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,
    body VARCHAR
);


INSERT INTO users
    (username, password, full_name, email_address, profile_pic_url, bio)
VALUES
    ('kwong', 'imag123', 'Kevin Wong', 'kevinwong@pursuit.org', 'uploads/saltflats.JPG', 'I''m kevin and this is my short bio. Kev K Dawg in the building'),
    ('bbrown', 'secret', 'Brandon Brown', 'brandonbrown@pursuit.org', 'uploads/IMG_9504.jpg', 'This is brandons bio'),
    ('cannedBread', 'gang123', 'Marvin Thompson', 'marvinthompson@pursuit.org', '/uploads/83265522_3243496319013151_2072753519152070656_o.jpg', 'This is canned breads bio'),
    ('Prodigos', 'wil1234', 'Wilghen Santos', 'faustosantos@pursuit.org', 'uploads/wilSantos.jpg', 'Welcome !!!!' );

INSERT INTO posts
    (owner_id, post_image_url, body)
VALUES
    (1, '/uploads/graduation.jpg', 'Blood, sweat, and tears. Graduation'),
    (2, '/uploads/IMG_4660.jpg', 'Links and drinks'),
    (3, '/uploads/83265522_3243496319013151_2072753519152070656_o.jpg', 'Posted up on the stage'),
    (2, '/uploads/wavesvideo.gif', 'Get ya scuba gear because you just might drown'),
    (1, '/uploads/canyons.JPG', 'Adventure in the canyons'),
    (2, 'uploads/KOBE.gif', 'RIP to one of the greats'),
    (3, '/uploads/62490637_2734115156617939_6992105001522823168_o.jpg', 'Posted up on this stool'),
    (1, '/uploads/cabin.JPG', 'Cingular, raising the bar.'),
    (1, '/uploads/yuki.jpg', 'This is my doge'),
    (1, '/uploads/yuki_beach.JPG', 'This is my doge on the beach'),
    (4, '/uploads/Physical_Graffiti.jpg', '96 St. Marks Place. Led Zeppelin. If you know you know'),
    (4, '/uploads/summer_Days.jpg', 'summer days series in the park'),
    (4, '/uploads/bullit.jpg', 'call Bullit'),
    (1, '/uploads/snowboarding.gif', 'We shredding out hereeeeee');
    


INSERT INTO comments
    (author_id, post_id, content)
VALUES
    (1, 1, 'Damn bro had to comment on my own picture..sad face'),
    (3, 2, 'Hey, nice post');

INSERT INTO likes
    (liker_id, post_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (3, 6),
    (1, 7),
    (3, 2);

INSERT INTO hashtags
    (owner_id, post_id, body)
VALUES
    (1, 1, 'graduation'),
    (1, 1, 'ye'),
    (1, 1, 'album'),
    (1, 3, 'adventures'),
    (1, 3, 'desert'),
    (1, 3, 'canyons'),
    (1, 5, 'cabin'),
    (1, 5, 'mountains'),
    (1, 6, 'shibainu'),
    (1, 6, 'memedog'),
    (1, 6, 'doge'),
    (1, 7, 'shibainu'),
    (1, 7, 'memedog'),
    (1, 7, 'doge'),
    (3, 2, 'posted'),
    (3, 2, 'up'),
    (3, 2, 'on'),
    (3, 2, 'the'),
    (3, 2, 'block'),
    (3, 4, 'still'),
    (3, 4, 'posted'),
    (3, 4, 'on'),
    (3, 4, 'the'),
    (3, 4, 'block'),
    (1, 14, 'Shreddin'),
    (1, 14, 'Snowboardin');





