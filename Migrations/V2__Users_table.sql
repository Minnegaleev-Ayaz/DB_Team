ALTER TABLE Fan
DROP COLUMN lovely_team,
ADD COLUMN patronymic varchar(255),
ADD COLUMN birth_date date NOT NULL CHECK(birth_date < current_date),
ADD COLUMN profession varchar(50),
ADD COLUMN nationality varchar(50) NOT NULL,
ADD COLUMN phone_number varchar(40),
ADD COLUMN email varchar(50),
ALTER COLUMN first_name TYPE varchar(255),
ALTER COLUMN last_name TYPE varchar(255);