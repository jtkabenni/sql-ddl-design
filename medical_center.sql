DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;
\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  specialty TEXT NOT NULL
);

INSERT INTO doctors
(first_name, last_name, specialty)
VALUES 
('Jennifer', 'Finch', 'Family medicine'),
('Alvin', 'Leathes', 'Neurology'),
('Berkie', 'Wycliff', 'Cardiology');

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO patients
(first_name, last_name)
VALUES 
('Sonja', 'Pauley'),
('Cory', 'Squibbes'),
('Waneta', 'Skeleton');

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease_name TEXT NOT NULL
);

INSERT INTO diseases
(disease_name)
VALUES
('Cancer'),
('Arthritis'),
('Bronchitis'),
('Alzheimers');


CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients,
  doctor_id INTEGER REFERENCES doctors,
  visit_date DATE NOT NULL,
  diagnoses_id INTEGER REFERENCES diseases
);

INSERT INTO visits 
(patient_id, doctor_id, visit_date, diagnoses_id)
VALUES
(1,1, '2020-04-12', null),
(2, 1, '2020-04-23', '2'),
(3, 2, '2020-07-01', '4'); 

