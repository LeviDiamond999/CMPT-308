CREATE TABLE patients (
  patient_id INT PRIMARY KEY CHECK (patient_id > 1),
  symptom1 VARCHAR(100),
  symptom2 VARCHAR(100)
);

CREATE TABLE doctors (
  doctor_id INT PRIMARY KEY,
  college VARCHAR(100)
);

CREATE TABLE appointments (
  appointment_date_time VARCHAR(100),
  patient_id INT,
  doctor_id INT,
  diagnosis VARCHAR(100),
  PRIMARY KEY (patient_id, doctor_id, appointment_date_time),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO patients (patient_id, symptom1, symptom2) VALUES
(2, 'Fever', 'Cough'),
(3, 'Headache', 'Nausea'),
(4, 'Back Pain', NULL),       
(5, 'Sore Throat', NULL),    
(6, 'Fatigue', NULL),         
(7, 'Dizziness', 'Blurry Vision'),
(8, 'Chest Pain', 'Shortness of Breath'),
(9, 'Joint Pain', 'Swelling');

INSERT INTO doctors (doctor_id, college) VALUES
(101, 'Harvard Medical School'),
(102, 'Johns Hopkins University'),
(103, 'Stanford Medicine'),
(104, 'Mayo Clinic College'),
(105, 'Yale School of Medicine'),
(106, 'UCSF School of Medicine'),
(107, 'Columbia Vagelos College'),
(108, 'UPenn Perelman School');

INSERT INTO appointments (appointment_date_time, patient_id, doctor_id, diagnosis) VALUES
('2024-05-01 09:00', 2, 101, 'Common Cold'),
('2024-05-01 10:00', 3, 101, 'Migraine'),
('2024-05-02 11:00', 4, 102, 'Muscle Strain'),
('2024-05-02 14:00', 5, 102, 'Strep Throat'),
('2024-05-03 08:30', 6, 103, 'Chronic Fatigue'),
('2024-05-03 15:00', 7, 103, 'Vertigo'),
('2024-05-04 09:15', 8, 104, 'Angina'),
('2024-05-04 10:30', 9, 104, 'Arthritis'),
('2024-05-05 13:00', 2, 105, 'Follow-up'),
('2024-05-05 16:00', 3, 106, 'Stress'),
('2024-05-06 11:00', 4, 107, NULL), 
('2024-05-06 12:00', 5, 108, NULL), 
('2024-05-07 09:00', 6, 101, 'Anemia'),
('2024-05-07 14:00', 7, 102, 'Ear Infection'),
('2024-05-08 10:00', 8, 103, NULL); 

Select * From patients

Select * From doctors

Select * From appointments

select p.*, a.*
from appointments a
inner join patients p
on a.patient_id = p.patient_id

SELECT a.appointment_date_time, p.symptom1, d.college, a.diagnosis
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id

select p.*, a.*
from appointments a
inner join patients p
on a.patient_id = p.patient_id
where p.symptom1 like 'Fever'

SELECT a.appointment_date_time, p.symptom1, d.college
FROM appointments a
JOIN patients p 
ON a.patient_id = p.patient_id
JOIN doctors d 
ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date_time DESC;

select p.*, a.*
from appointments a
inner join patients p
on a.patient_id = p.patient_id
where p.symptom2 is NULL

INSERT INTO appointments (appointment_date_time, patient_id, doctor_id, diagnosis) VALUES 
('2024-06-01 10:00', 2, 999, 'Routine Checkup');

INSERT INTO patients (patient_id, symptom1, symptom2) VALUES 
(1, 'Dry Cough', 'Mild Fever');

