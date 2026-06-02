create database fresher_management;
use fresher_management;
CREATE TABLE Trainee (
    trainee_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('male', 'female', 'unknown') NOT NULL,
    et_iq TINYINT NOT NULL,
    CONSTRAINT chk_et_iq CHECK (et_iq >= 0 AND et_iq <= 20),
    et_gmath TINYINT NOT NULL,
    CONSTRAINT chk_et_gmath CHECK (et_gmath >= 0 AND et_gmath <= 20),
    et_english TINYINT NOT NULL,
    CONSTRAINT chk_et_english CHECK (et_english >= 0 AND et_english <= 50),
    training_class VARCHAR(20) NOT NULL,
    evaluation_notes TEXT
);

ALTER TABLE Trainee 
ADD COLUMN vti_account VARCHAR(50) NOT NULL UNIQUE;

INSERT INTO Trainee
(full_name, birth_date, gender, et_iq, et_gmath, et_english, training_class, evaluation_notes, vti_account)
VALUES
('Nguyen Van An', '2003-05-10', 'male', 18, 17, 45, 'Java01', 'Good', 'an01'),
('Tran Thi Binh', '2002-08-15', 'female', 19, 20, 48, 'Java01', 'Excellent', 'binh02'),
('Le Van Cuong', '2001-12-20', 'male', 15, 16, 40, 'Java02', 'Average', 'cuong03'),
('Pham Thi Dung', '2003-03-25', 'female', 20, 19, 50, 'Java02', 'Outstanding', 'dung04'),
('Hoang Minh Ha', '2002-11-08', 'male', 14, 15, 35, 'Java03', 'Need improvement', 'ha05'),
('Nguyen Khanh Linh', '2004-01-12', 'female', 17, 18, 42, 'Java03', 'Good', 'linh06'),
('Tran Quoc Nam', '2001-07-30', 'male', 16, 14, 38, 'Java04', 'Average', 'nam07'),
('Do Thi Phuong', '2003-09-18', 'female', 19, 17, 46, 'Java04', 'Very Good', 'phuong08'),
('Bui Van Son', '2002-06-05', 'male', 13, 12, 30, 'Java05', 'Weak English', 'son09'),
('Le Thu Trang', '2004-04-22', 'female', 20, 20, 49, 'Java05', 'Excellent', 'trang10');

-- C1
SELECT 
    *
FROM
    Trainee
WHERE
    et_iq = (SELECT 
            MAX(et_iq)
        FROM
            Trainee);
-- C2
SELECT 
    AVG(et_english) AS avg_english
FROM
    Trainee;
-- C3
SELECT 
    gender, COUNT(*) AS total
FROM
    Trainee
GROUP BY gender;
-- C4
SELECT 
    *
FROM
    Trainee
WHERE
    et_english > 40;
-- C5
SELECT 
    *
FROM
    Trainee
ORDER BY et_iq DESC;
-- C6
SELECT 
    *, (et_iq + et_gmath + et_english) AS total_score
FROM
    Trainee
ORDER BY total_score DESC
LIMIT 3;



