CREATE DATABASE Fresher;

USE Fresher;

CREATE TABLE Trainee (
    TraineeID     INT             NOT NULL AUTO_INCREMENT,
    Full_Name     NVARCHAR(100)   NOT NULL,
    Birth_Date    DATE            NOT NULL,
    Gender        ENUM('male', 'female', 'unknown')  NOT NULL,
    ET_IQ         TINYINT UNSIGNED NOT NULL DEFAULT 0,
    ET_Gmath      TINYINT UNSIGNED NOT NULL DEFAULT 0,
    ET_English    TINYINT UNSIGNED NOT NULL DEFAULT 0,
    Training_Class VARCHAR(20)    NOT NULL,
    Evaluation_Notes TEXT         NULL,

    CONSTRAINT PK_Trainee         PRIMARY KEY (TraineeID),
    CONSTRAINT CHK_ET_IQ          CHECK (ET_IQ     BETWEEN 0 AND 20),
    CONSTRAINT CHK_ET_Gmath       CHECK (ET_Gmath  BETWEEN 0 AND 20),
    CONSTRAINT CHK_ET_English     CHECK (ET_English BETWEEN 0 AND 50)
);

ALTER TABLE Trainee
    ADD COLUMN VTI_Account VARCHAR(50) NOT NULL UNIQUE;
