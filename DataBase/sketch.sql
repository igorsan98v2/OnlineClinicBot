CREATE TABLE doctors(
id INT PRIMARY KEY AUTOINCREMENT,
first_name TEXT NOT NULL,
patronymic  TEXT NOT NULL,
second_name TEXT NOT NULL,
work_time_start DATETIME2,
work_time_end DATETIME2,
special TEXT NOT NULL 
);
CREATE TABLE patients(
card_id INT PRIMARY KEY,
full_name TEXT NOT NULL,--слитно т.к в дальшейм нужно только  целеком 
);
CREATE TABLE rooms(
room_id INT PRIMARY KEY CHECK (floor_num>0),
floor_num INT CHECK (floor_num>0),
work_time_start DATETIME2,
work_time_end DATETIME2,
special TEXT NOT NULL
);
CREATE TABLE appointments(
apointment_start_time DATETIME2 PRIMARY KEY,
apointment_time INT CHECK (apointment_time>0),--в минутах 
doc_id INT  FOREIGN KEY(doc_id) REFERENCES doctors(id),
card_id INT FOREIGN KEY(card_id) REFERENCES patients(card_id),
room_id INT FOREIGN KEY(room_id) REFERENCES rooms(room_id),
special TEXT
);

--создание таблицы с именем books
 
CREATE TABLE books 
(
id_books INTEGER PRIMARY KEY AUTOINCREMENT,
auth_name TEXT NOT NULL,
title TEXT NOT NULL,
count_page INTEGER NOT NULL,
price REAL NOT NULL
);
 
-- Запрос на добавление данных в таблицу
 
