PRAGMA foreign_keys = ON ;
DROP TABLE  users;
DROP TABLE  questions;
DROP TABLE  question_follows;
DROP TABLE  replies;
DROP TABLE  question_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL,
  fname VARCHAR(100) NOT NULL,
  lname VARCHAR(100)  NOT NULL
);

CREATE TABLE questions (

  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL, 
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL ,

  FOREIGN KEY (author_id) REFERENCES users(id)
  -- come back for foreign key

);



CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY NOT NULL, 
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,


  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
  -- come back later

);

CREATE TABLE replies (

  id INTEGER PRIMARY KEY NOT NULL,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_reply_id INTEGER,

 FOREIGN KEY (user_id) REFERENCES users(id)
 FOREIGN KEY (question_id) REFERENCES questions(id)
 FOREIGN KEY (parent_reply_id) REFERENCES reply(id)

);

CREATE TABLE question_likes (

  id  INTEGER PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  user_like BOOLEAN  NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
  
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('ALVIN' ,'Zhao'),
  ('Charles', 'Coombs');

INSERT INTO
   questions(title , body , author_id)
VALUES
    (
      'help !!',
      'I cant figure out SQL',
      1
    );

INSERT INTO 
    question_follows(user_id,question_id)
VALUES
    (1,1);


INSERT INTO 
    replies (body , question_id, user_id, parent_reply_id)
VALUES
    (
      'sql is so easy',
      1,
      2,
      NULL
    );

INSERT INTO 
    question_likes(user_id, question_id, user_like)
VALUES
    (
      1,
      1,
      'TRUE'
    );