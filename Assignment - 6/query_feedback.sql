CREATE DATABASE feedback_db;
USE feedback_db;

CREATE TABLE feedback(
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(50),
 email VARCHAR(50),
 message TEXT
);
