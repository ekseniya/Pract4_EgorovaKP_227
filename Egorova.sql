-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';
-- public.admission_patients определение

-- Drop table

-- DROP TABLE admission_patients;

CREATE TABLE admission_patients (
	id int4 NOT NULL,
	date_visit date NOT NULL,
	id_specialization int4 NOT NULL,
	id_patient int4 NOT NULL,
	cost_admission money NOT NULL,
	CONSTRAINT admission_patients_pk PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE admission_patients OWNER TO postgres;
GRANT ALL ON TABLE admission_patients TO postgres;


-- public.specialization определение

-- Drop table

-- DROP TABLE specialization;

CREATE TABLE specialization (
	id_specialization int4 NOT NULL,
	name_specialization varchar NOT NULL,
	CONSTRAINT specialization_pk PRIMARY KEY (id_specialization)
);

-- Permissions

ALTER TABLE specialization OWNER TO postgres;
GRANT ALL ON TABLE specialization TO postgres;


-- public.doctors определение

-- Drop table

-- DROP TABLE doctors;

CREATE TABLE doctors (
	id_doc int4 NOT NULL,
	name_doc varchar NOT NULL,
	surname_doc varchar NOT NULL,
	patronymic_doc varchar NULL,
	id_specialization int4 NOT NULL,
	CONSTRAINT doctors_pk PRIMARY KEY (id_doc),
	CONSTRAINT doctors_admission_patients_fk FOREIGN KEY (id_doc) REFERENCES admission_patients(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT doctors_specialization_fk FOREIGN KEY (id_specialization) REFERENCES specialization(id_specialization) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE doctors OWNER TO postgres;
GRANT ALL ON TABLE doctors TO postgres;


-- public.patient определение

-- Drop table

-- DROP TABLE patient;

CREATE TABLE patient (
	id_patient int4 NOT NULL,
	name_patient varchar NOT NULL,
	surname_patient varchar NOT NULL,
	patronymic_patient varchar NULL,
	birthday date NOT NULL,
	address varchar NOT NULL,
	CONSTRAINT patient_pk PRIMARY KEY (id_patient),
	CONSTRAINT patient_admission_patients_fk FOREIGN KEY (id_patient) REFERENCES admission_patients(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE patient OWNER TO postgres;
GRANT ALL ON TABLE patient TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;
INSERT INTO public.doctors (id_doc,name_doc,surname_doc,patronymic_doc,id_specialization) VALUES
	 (1,' Александр ','Волков ',' Максимович',1),
	 (2,' Максим ','Власов ','Михайлович',7),
	 (3,' Злата ','Кузнецова ',' Михайловна',8),
	 (4,' Александр ','Малышев ',' Александрович',10),
	 (5,' Андрей','Семенов ',' Тимофеевич',2),
	 (6,'Елизавета ','Полякова ',' Максимовна',5),
	 (7,'Георгий ','Волков ',' Макарович',9),
	 (8,'Ульяна ','Громова','Николаевна',3),
	 (9,'Мария ','Крылова ','Руслановна',4),
	 (10,'Тимофей ','Маркин ',' Лукич ',6);
INSERT INTO public.patient (id_patient,name_patient,surname_patient,patronymic_patient,birthday,address) VALUES
	 (1,'Валерия','Воробьева','Артемовна','2000-05-02','Чехова, 45'),
	 (2,' Руслан ','Ефремов ','Платонович','2000-04-19','Домодедовская, 77'),
	 (3,'Мария ','Александрова','Тимофеевна','1999-06-07','Чехова, 01'),
	 (4,'Наталья ','Соболева','Филипповна','2001-05-27','Ломоносова, 71'),
	 (5,'Александр ','Большаков ',' Васильевич','1989-09-15','Гагарина, 45'),
	 (6,' Екатерина ','Смирнова ','Максимовна','2002-11-01','года, 64'),
	 (7,'Алексей ','Ковалев ','Петрович','1993-04-13','Чехова, 59'),
	 (8,'Лев','Тарасов',' Матвеевич','1960-11-21','Чехова, 14'),
	 (9,'Алина','Миронова ','Алексеевна','2003-05-12','Бухарестская, 97'),
	 (10,'Михаил ','Михаил ','Михайлович','2010-08-18',' года, 01');
INSERT INTO public.admission_patients (id,date_visit,id_specialization,id_patient,cost_admission) VALUES
	 (1,'2024-10-12',1,1,2 300,00 ?),
	 (2,'2024-10-13',2,2,1 200,00 ?),
	 (3,'2024-10-14',3,3,4 000,00 ?),
	 (4,'2024-10-15',4,4,3 500,00 ?),
	 (5,'2024-10-16',5,5,3 100,00 ?),
	 (6,'2024-10-17',6,6,5 400,00 ?),
	 (7,'2024-10-20',7,7,1 000,00 ?),
	 (8,'2024-10-21',8,8,5 000,00 ?),
	 (9,'2024-10-22',9,9,2 000,00 ?),
	 (10,'2024-10-23',10,10,2 800,00 ?);
INSERT INTO public.specialization (id_specialization,name_specialization) VALUES
	 (1,'терапевт'),
	 (2,'кардиолог'),
	 (3,'офтальмолог'),
	 (4,'кардиолог'),
	 (5,'терапевт'),
	 (6,'офтальмолог'),
	 (7,'хирург'),
	 (8,'хирург'),
	 (9,'терапевт'),
	 (10,'терапевт');


