DROP DATABASE IF EXISTS Topic;
CREATE DATABASE Topic;
use Topic;
CREATE TABLE Topic (
    TopicID int NOT NULL AUTO_INCREMENT,
    TopicName varchar(255) NOT NULL,
    TopicDescription varchar(255) NOT NULL,
    PRIMARY KEY (TopicID)
);
CREATE TABLE Button (
    ButtonID int NOT NULL AUTO_INCREMENT,
    TopicID int NOT NULL,
    ButtonName varchar(255) NOT NULL,
    ButtonLabel varchar(255) NOT NULL,
    ButtonURL varchar(255) NOT NULL,
    PRIMARY KEY (ButtonID)
);
