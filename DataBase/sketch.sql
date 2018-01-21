CREATE TABLE doctors(
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name TEXT NOT NULL,
patronymic  TEXT NOT NULL,
second_name TEXT NOT NULL
);
CREATE TABLE patients(
card_id INTEGER PRIMARY KEY,
full_name TEXT NOT NULL,--слитно т.к в дальшейм нужно только  целеком 
adress TEXT NOT NULL 
);
CREATE TABLE rooms(
room_id INTEGER PRIMARY KEY CHECK (floor_num>0),
floor_num INTEGER CHECK (floor_num>0)
);
CREATE TABLE work_place(
work_time_start DATETIME2,
work_time_end DATETIME2,
special TEXT NOT NULL ,
room_id INTEGER,
doctor_id INTEGER,
FOREIGN KEY (doctor_id) REFERENCES doctors(id),
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
CREATE TABLE appointments(
apointment_start_time DATETIME2 PRIMARY KEY,
apointment_time INTEGER CHECK (apointment_time>0),--в минутах 
doc_id INTEGER, 
card_id INTEGER,
room_id INTEGER, 
special TEXT,
FOREIGN KEY (card_id) REFERENCES patients(card_id),
FOREIGN KEY (room_id,doc_id) REFERENCES work_place(room_id,doctor_id)
);

--создание таблицы с именем books
 

-- Запрос на добавление данных в таблицу
 
