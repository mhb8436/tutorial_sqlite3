
-- DROP TABLE customer;

CREATE TABLE customer (
 cust_id INT PRIMARY KEY,
 company_name VARCHAR(30),
 contact_name VARCHAR(20),
 contact_position VARCHAR(20),
 address VARCHAR(50),
 city VARCHAR(20),
 region VARCHAR(20),
 phone VARCHAR(20),
 mileage INT
);

-- DROP TABLE department;

CREATE TABLE department (
 dept_id INT PRIMARY KEY,
 dept_no VARCHAR(2) UNIQUE,
 dept_name VARCHAR(20)
);

-- DROP TABLE mileage_grade;

CREATE TABLE mileage_grade (
 mileage_id INT PRIMARY KEY,
 grade VARCHAR(10) UNIQUE,
 min_mileage INT,
 max_mileage INT
);

-- DROP TABLE product;

CREATE TABLE product (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(50),
 product_unit VARCHAR(30),
 unit_price INT,
 stock INT
);

-- DROP TABLE employee;

CREATE TABLE employee (
 emp_id INT PRIMARY KEY,
 emp_no VARCHAR(10) UNIQUE,
 name VARCHAR(20),
 eng_name VARCHAR(20),
 position VARCHAR(10),
 gender VARCHAR(2),
 birth_date DATE,
 hire_date DATE,
 address VARCHAR(50),
 city VARCHAR(20),
 region VARCHAR(20),
 home_phone VARCHAR(20),
 manager_no INT,
 dept_id INT, 
 FOREIGN KEY (dept_id) REFERENCES department(dept_id),
 FOREIGN KEY (manager_no) REFERENCES employee(emp_id)
);

-- DROP TABLE orders;

CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 order_no VARCHAR(50),
 cust_id INT,
 emp_id INT,
 order_date DATE,
 required_date DATE,
 shipped_date DATE,
 UNIQUE (order_no), 
 FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
 FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

-- DROP TABLE order_details;

CREATE TABLE order_details (
 order_detail_id INT PRIMARY KEY,
 order_id INT,
 product_id INT,
 unit_price INT,
 quantity INT,
 discount FLOAT,
 UNIQUE (order_id, product_id), 
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO department (dept_id,dept_no,dept_name) VALUES
  (1,'01','영업부'),
  (2,'02','인사부'),
  (3,'03','개발부'),
  (4,'04','재무부'),
  (5,'05','마케팅부'),
  (6,'A5','전산부');

INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (21,'2020090401','김철수','Kim Chulsoo','과장','남 ','1980-01-15','2010-03-01','서울시 강남구 테헤란로 123','서울','서울특별시','02-123-4567',NULL,1);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (25,'2002090405','최경민','Choi Kyungmin','부장','남 ','1975-09-10','2008-07-15','서울시 송파구 올림픽로 111','서울','서울특별시','02-321-7654',NULL,2);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (28,'2009090408','김영미','Kim Youngmi','부장','여 ','1981-05-09','2007-11-01','대구시 달서구 달구벌대로 234','대구','대구광역시','053-789-0123',NULL,3);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (33,'2013090413','오세진','Oh Sejin','과장','여 ','1984-08-30','2010-06-14','부산시 중구 중앙대로 101','부산','부산광역시','051-555-4444',NULL,4);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (37,'2000090417','고승민','Ko Seungmin','부장','남 ','1982-05-25','2008-03-02','수원시 영통구 영통로 123','수원','경기도','031-999-8888',NULL,5);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (23,'2024090403','박민수','Park Minsu','사원','남 ','1990-11-30','2015-09-01','부산시 해운대구 우동 789','부산','부산광역시','051-123-4567',21,1);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (22,'2012090402','이영희','Lee Younghee','대리','여 ','1985-06-20','2012-04-10','서울시 서초구 강남대로 456','서울','서울특별시','02-987-6543',21,1);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (24,'2023090404','정수진','Jung Sujin','사원','여 ','1992-03-05','2017-01-05','대전시 유성구 엑스포로 321','대전','대전광역시','042-987-6543',21,1);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (26,'2019090406','이하나','Lee Hana','대리','여 ','1988-02-25','2013-08-12','경기도 성남시 분당구 불정로 222','성남','경기도','031-123-6789',25,2);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (27,'2023090407','홍길동','Hong Gildong','사원','남 ','1995-04-18','2018-03-20','인천시 남동구 논현로 101','인천','인천광역시','032-456-7890',25,2);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (29,'2018090409','장철민','Jang Chulmin','과장','남 ','1983-12-15','2009-05-22','광주시 북구 무등로 456','광주','광주광역시','062-345-6789',28,3);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (30,'2023090410','윤희진','Yoon Heejin','사원','여 ','1991-10-30','2016-10-01','울산시 남구 삼산로 789','울산','울산광역시','052-567-8901',28,3);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (31,'2024090411','송민호','Song Minho','사원','남 ','1994-07-07','2019-05-01','전주시 완산구 전주천동로 111','전주','전라북도','063-890-1234',28,3);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (32,'2019090412','신지훈','Shin Jihoon','대리','남 ','1987-11-19','2014-01-12','서울시 은평구 통일로 300','서울','서울특별시','02-111-2222',28,3);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (34,'2022090414','조민아','Jo Mina','대리','여 ','1990-03-21','2015-11-01','울산시 북구 명촌로 101','울산','울산광역시','052-444-3333',33,4);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (35,'2020390415','김상훈','Kim Sanghoon','사원','남 ','1993-01-11','2018-02-01','광주시 서구 치평동 303','광주','광주광역시','062-333-2222',33,4);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (36,'2023090416','한수지','Han Suji','사원','여 ','1996-04-16','2020-08-05','제주시 애월읍 하귀 15','제주','제주특별자치도','064-222-1111',33,4);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (38,'2021090418','문주영','Moon Jooyoung','과장','여 ','1986-12-08','2011-10-21','서울시 마포구 월드컵로 202','서울','서울특별시','02-333-4444',37,5);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (39,'2020290419','양동근','Yang Donggeun','대리','남 ','1989-09-09','2015-03-15','성남시 수정구 수정로 85','성남','경기도','031-555-6666',37,5);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (40,'2020390420','백은경','Baek Eunkyung','사원','여 ','1992-02-03','2017-12-12','안양시 동안구 평촌로 77','안양','경기도','031-777-8888',37,5);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (41,'2024100401','이민지','Lee MinJi','사원','여 ','2003-01-15','2024-10-01','서울시 강남구 테헤란로 111','서울','서울특별시','02-123-4567',NULL,NULL);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (42,'2024100402','다니엘','Daniel','사원','여 ','2003-06-20','2024-10-10','서울시 서초구 강남대로 222','서울','서울특별시','02-987-6543',NULL,NULL);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (43,'2024100403','이혜린','Lee Hyelin','사원','여 ','2003-11-30','2024-10-01','부산시 해운대구 우동 333','부산','부산광역시','051-123-4567',NULL,NULL);
INSERT INTO employee (emp_id,emp_no,"name",eng_name,"position",gender,birth_date,hire_date,address,city,region,home_phone,manager_no,dept_id) VALUES (44,'2024100404','박해인','Park hein','사원','여 ','2003-03-05','2024-10-05','대전시 유성구 엑스포로 444','대전','대전광역시','042-987-6543',NULL,NULL);



INSERT INTO customer (cust_id,company_name,contact_name,contact_position,address,city,region,phone,mileage) VALUES
  (18,'ZAB상사','홍지민','부장','울산시 북구 산하로 789','울산','울산광역시','052-543-2109',75),
  (1,'ABC상사','김상민','대표','서울시 강남구 도산대로 123','서울','서울특별시','02-111-2222',110),
  (2,'DEF상사','박지수','이사','서울시 서초구 서초대로 456','서울','서울특별시','02-333-4444',220),
  (3,'GHI상사','이준호','부장','서울시 중구 세종대로 789','서울','서울특별시','02-555-6666',330),
  (5,'MNO상사','정세영','대리','대구시 수성구 동대구로 222','대구','대구광역시','053-999-0000',55),
  (6,'PQR상사','강석준','사원','광주시 광산구 송정로 123','광주','광주광역시','062-333-7777',66),
  (7,'STU상사','한지수','과장','대전시 동구 한밭로 345','대전','대전광역시','042-555-3333',132),
  (8,'VWX상사','서영희','이사','울산시 남구 번영로 456','울산','울산광역시','052-777-9999',198),
  (9,'YZA상사','남성우','부장','인천시 연수구 컨벤시아대로 789','인천','인천광역시','032-888-1111',264),
  (10,'BCD상사','윤주희','대리','경기도 수원시 영통구 월드컵로 101','수원','경기도','031-444-5555',88);
INSERT INTO customer (cust_id,company_name,contact_name,contact_position,address,city,region,phone,mileage) VALUES
  (11,'EFG상사','조윤아','사원','경기도 성남시 분당구 판교로 202','성남','경기도','031-222-3333',99),
  (12,'HIJ상사','김다희','부장','경기도 고양시 일산동구 정발산로 123','고양','경기도','031-111-4444',143),
  (14,'NOP상사','백승호','대리','서울시 강동구 천호대로 789','서울','서울특별시','02-654-3210',220),
  (15,'QRS상사','문채원','사원','대구시 북구 칠곡중앙대로 101','대구','대구광역시','053-987-6543',55),
  (16,'TUV상사','서현우','대표','광주시 남구 백운로 123','광주','광주광역시','062-876-5432',110),
  (17,'WXY상사','이민호','이사','대전시 서구 둔산대로 456','대전','대전광역시','042-765-4321',165),
  (19,'CDE상사','장세진','과장','서울시 용산구 한강대로 101','서울','서울특별시','02-123-9876',138),
  (20,'FGH상사','최유나','대리','서울시 관악구 남부순환로 456','서울','서울특별시','02-765-4321',94),
  (21,'IJK상사','전성민','사원','서울시 서대문구 신촌로 789','서울','서울특별시','02-543-2109',77),
  (22,'LMN상사','김나영','부장','부산시 서구 감천로 101','부산','부산광역시','051-345-6789',154);
INSERT INTO customer (cust_id,company_name,contact_name,contact_position,address,city,region,phone,mileage) VALUES
  (23,'OPQ상사','백진영','과장','부산시 북구 만덕대로 202','부산','부산광역시','051-234-5678',176),
  (24,'RST상사','정민호','대리','서울시 마포구 성산로 303','서울','서울특별시','02-678-5432',209),
  (25,'UVW상사','손현지','사원','서울시 송파구 백제고분로 101','서울','서울특별시','02-456-7890',66),
  (26,'XYZ상사','박성우','대표','대구시 중구 동성로 456','대구','대구광역시','053-345-6789',143),
  (27,'ABC2상사','윤재훈','이사','인천시 서구 청라대로 789','인천','인천광역시','032-234-5678',231),
  (28,'DEF2상사','최영민','부장','서울시 은평구 통일로 101','서울','서울특별시','02-123-9876',110),
  (29,'GHI2상사','문수빈','과장','서울시 노원구 동일로 202','서울','서울특별시','02-345-6789',165),
  (30,'JKL2상사','유혜진','대리','대구시 달서구 와룡로 303','대구','대구광역시','053-234-9876',55),
  (31,'MNO2상사','김현아','사원','대전시 유성구 전민로 404','대전','대전광역시','042-567-8901',83),
  (32,'PQR2상사','오민주','부장','울산시 중구 번영로 505','울산','울산광역시','052-345-6789',132);
INSERT INTO customer (cust_id,company_name,contact_name,contact_position,address,city,region,phone,mileage) VALUES
  (33,'STU2상사','이수민','과장','울산시 동구 전하로 606','울산','울산광역시','052-234-5678',110),
  (34,'VWX2상사','조윤상','대리','서울시 동작구 상도로 707','서울','서울특별시','02-987-6543',94),
  (35,'YZA2상사','남승민','사원','서울시 종로구 율곡로 808','서울','서울특별시','02-876-5432',105),
  (36,'BCD2상사','김승호','대표','서울시 강북구 도봉로 909','서울','서울특별시','02-765-4321',220),
  (37,'EFG2상사','최은영','이사','부산시 동구 초량로 1010','부산','부산광역시','051-654-3210',198),
  (38,'HIJ2상사','황지수','부장','부산시 금정구 금정로 1111','부산','부산광역시','051-543-2109',121),
  (39,'KLM2상사','서정민','과장','서울시 구로구 경인로 1212','서울','서울특별시','02-432-1098',187),
  (40,'NOP2상사','이혜린','대리','대구시 남구 앞산로 1313','대구','대구광역시','053-321-0987',88),
  (41,'QRS2상사','박선영','사원','부산시 사하구 장림로 1414','부산','부산광역시','051-210-9876',66),
  (42,'TUV2상사','윤지혜','대표','서울시 금천구 벚꽃로 1515','서울','서울특별시','02-098-7654',121);
INSERT INTO customer (cust_id,company_name,contact_name,contact_position,address,city,region,phone,mileage) VALUES
  (43,'WXY2상사','정성훈','이사','서울시 성동구 성수로 1616','서울','서울특별시','02-876-5432',231),
  (44,'ZAB2상사','최민수','부장','대전시 대덕구 대덕로 1717','대전','대전광역시','042-765-4321',55),
  (45,'CDE2상사','김소연','과장','인천시 미추홀구 용현로 1818','인천','인천광역시','032-654-3210',99),
  (46,'FGH2상사','박정우','대리','울산시 북구 호계로 1919','울산','울산광역시','052-543-2109',165),
  (47,'IJK2상사','홍길순','사원','전주시 덕진구 덕진로 2020','전주','전라북도','063-234-5678',110),
  (48,'LMN2상사','이정아','부장','청주시 상당구 상당로 2121','청주','충청북도','043-345-6789',176),
  (49,'OPQ2상사','김선우','과장','원주시 무실로 2222','원주','강원도','033-123-4567',198),
  (50,'RST2상사','정지훈','대리','창원시 의창구 원이대로 2323','창원','경상남도','055-234-5678',209),
  (4,'JKL상사','최혜정','과장','부산시 해운대구 마린시티 101','부산',NULL,'051-777-8888',165),
  (13,'KLM상사','황준영','과장','부산시 해운대구 해운대로 456','부산','','051-123-9876',121);

INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (1,'커피','박스',50000,100);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (2,'차','박스',40000,80);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (3,'설탕','kg',2000,150);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (4,'밀가루','kg',1000,200);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (5,'우유','리터',2500,60);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (6,'과일 주스','병',3000,70);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (7,'샴푸','병',7000,50);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (8,'비누','개',1000,120);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (9,'칫솔','개',1500,90);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (10,'치약','개',2000,110);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (91,'연어소스','병',5500,30);
INSERT INTO product (product_id,product_name,product_unit,unit_price,stock) VALUES (92,'불닭볶음면',NULL,9000,50);


INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (1,'ba1f6450136ca6b13caa6d078c20d4641725154198',22,38,'2024-01-27','2024-02-07','2024-02-09');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (2,'8a1ea7ed86ebfbc0c5b5fd37e11271fb1725154198',42,34,'2024-01-21','2024-01-24','2024-01-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (3,'63f47cc499831e1a4eb77f990a0995471725154198',30,31,'2024-05-08','2024-05-12','2024-05-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (4,'037c11a46dd58e84cd2198cec251cd601725154198',25,24,'2023-11-13','2023-11-21','2023-11-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (5,'428540de1f7f5e0bb5492b128024e8511725154198',29,40,'2024-01-06','2024-01-12','2024-01-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (6,'71609e911ef8ea329472f512538884341725154198',13,21,'2024-08-17','2024-08-27','2024-08-28');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (7,'e72c35c404047418081341976571c8621725154198',28,30,'2024-03-15','2024-03-16','2024-03-17');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (8,'3963c2b9bd13cd62730076e828dad6011725154198',29,36,'2024-05-25','2024-05-31','2024-06-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (9,'7078bbb28d7f5d29e044bf53a0e0d3311725154198',40,23,'2024-05-17','2024-05-18','2024-05-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (10,'fd3fbde3539e19afb30ef5d4e6493e9d1725154198',9,35,'2024-08-25','2024-09-01','2024-09-03');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (11,'398c0cf9c8981807ad1e231d2b0ccdab1725154198',7,23,'2023-10-07','2023-10-14','2023-10-17');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (12,'76736bfc4a7d8b940fdab7d1f1e06a711725154198',31,30,'2024-07-05','2024-07-07','2024-07-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (13,'8cef4db2a95b997d86ae7e226e4607aa1725154198',6,26,'2024-07-22','2024-07-27','2024-07-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (14,'1c34ae39d35db3a759c8e2849ad603e61725154198',3,30,'2024-03-24','2024-03-27','2024-04-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (15,'a66f08cb71054143d61409fc6d959ca71725154198',16,26,'2024-03-09','2024-03-20','2024-03-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (16,'48519684e70ad8464b5e446bec592da41725154198',32,23,'2024-04-27','2024-04-28','2024-04-28');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (17,'30f1e71edcc8f91ea7a66818182b8fb31725154198',27,21,'2024-06-24','2024-06-27','2024-07-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (18,'edc0be3608e36066dcc5e000115197d11725154198',41,26,'2024-07-28','2024-07-30','2024-08-03');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (19,'e2477d8e6b751a62a6a38cb29c495d671725154198',1,36,'2024-04-10','2024-04-12','2024-04-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (20,'95c99d3aebf11a6cf5a365deb5c3846d1725154198',35,34,'2023-12-24','2023-12-26','2023-12-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (21,'7aa0d6c7bc9bfd145c7ba285f5183ec41725154198',20,21,'2023-11-23','2023-11-30','2023-12-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (22,'3717b542a815e9be497e9da4ce470baf1725154198',12,21,'2023-10-15','2023-10-21','2023-10-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (23,'4fc335716ab45fc8b1ac819177a81f9a1725154198',45,37,'2024-04-26','2024-04-27','2024-04-29');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (24,'2ca8f00fe9e3cb2d6bbf66bfb45d7f941725154198',20,36,'2024-04-02','2024-04-10','2024-04-11');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (25,'0410391896ac9a8072387a01e432c2931725154198',4,34,'2024-03-13','2024-03-21','2024-03-22');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (26,'f61c8842d713e700cd8705807d5bb4c71725154198',33,21,'2023-11-13','2023-11-20','2023-11-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (27,'380011ce2264219b09aee936ad76cd171725154198',1,29,'2023-09-29','2023-10-06','2023-10-07');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (28,'9735b1138de66bd70f3ba980d2337b141725154198',39,34,'2024-07-07','2024-07-10','2024-07-13');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (29,'1817ddb1beb21efd488d2b23529b7f721725154198',43,24,'2023-12-15','2023-12-21','2023-12-26');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (30,'7e873d3255d002e3fae93bba20836f2b1725154198',6,36,'2024-03-01','2024-03-08','2024-03-09');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (31,'a0ed2f1ec58e8522418679665d083e721725154198',24,25,'2023-10-23','2023-11-03','2023-11-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (32,'a9dd87553a556d560d35b62e887d2ea01725154198',12,26,'2024-05-22','2024-05-24','2024-05-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (33,'900c0d381d3663336324f9798102a9a71725154198',48,33,'2024-02-02','2024-02-04','2024-02-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (34,'9b008c75adc591909448a36e8d736cf01725154198',38,24,'2024-04-01','2024-04-04','2024-04-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (35,'fc86776f2a70856e3ee07b90b6228e921725154198',3,27,'2024-03-29','2024-04-07','2024-04-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (36,'9b444c907140eee44c2e72058fb7fd151725154198',15,34,'2023-09-02','2023-09-07','2023-09-11');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (37,'dcec2adcb0ae4b2abcf56481058677e31725154198',36,36,'2023-11-22','2023-11-25','2023-11-28');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (38,'472e5061bfd04f7ba83b73d7ddadd3b41725154198',34,22,'2023-11-07','2023-11-15','2023-11-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (39,'747de89c3bb26026748287fa1e0ba91a1725154198',24,33,'2024-01-22','2024-02-01','2024-02-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (40,'f7722c11d43a840426413e7dd49095901725154198',31,40,'2023-12-29','2024-01-07','2024-01-09');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (41,'7ac444a1c059e4f4b456ca6324073dde1725154198',22,23,'2024-07-10','2024-07-14','2024-07-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (42,'ea6bebb02901244208ebe2b9545e8f721725154198',9,23,'2024-04-03','2024-04-12','2024-04-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (43,'13b22bdec70cc0de3911d899610f69a91725154198',25,40,'2024-02-22','2024-03-01','2024-03-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (44,'344010f018b8818d05625d0f8d7a45ef1725154198',31,33,'2024-02-10','2024-02-18','2024-02-22');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (45,'a8159318ecff34aada3d836f1ee9ed481725154198',39,39,'2024-05-13','2024-05-20','2024-05-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (46,'b743c9fdb904753fc84a2dacc6e0897a1725154198',26,35,'2024-05-23','2024-05-29','2024-06-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (47,'231a102d472e5c33d320c472741e90581725154198',38,31,'2024-02-08','2024-02-18','2024-02-19');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (48,'a1a4d9072d8173073bcf5faeec4555731725154198',45,35,'2024-07-15','2024-07-19','2024-07-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (49,'b50ec9de45e63b1a69300829098f2c461725154198',48,33,'2024-07-28','2024-07-30','2024-08-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (50,'cb785e06d0ca9cd696619dd9ea5b72771725154198',42,38,'2024-07-15','2024-07-22','2024-07-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (51,'e8dbaf92f9c61e6375fe47157f2493671725154198',2,27,'2023-09-19','2023-09-30','2023-10-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (52,'48d890a07026b0b3f8d0678212a2ba3f1725154198',48,34,'2023-10-11','2023-10-14','2023-10-17');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (53,'4a920c505b31132c875f9243700d71221725154198',35,32,'2024-07-30','2024-08-01','2024-08-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (54,'1fe8623b669344030558db79c6a5bae51725154198',33,26,'2024-07-02','2024-07-11','2024-07-12');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (55,'f4c24df77a62b640ed5cb9e88a327cb31725154198',25,36,'2023-10-26','2023-10-28','2023-11-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (56,'3ca7804045d8129d4d5a827d66093e341725154198',21,29,'2024-04-30','2024-05-09','2024-05-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (57,'d62f90fc61a73dc83112965572999f5c1725154198',35,27,'2023-09-29','2023-10-09','2023-10-11');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (58,'0d0110f153263a0f1db78aa1be5c1cbb1725154198',2,28,'2024-01-05','2024-01-08','2024-01-12');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (59,'e03a1ea0f569ad7ee9ea884cdda267b51725154198',22,24,'2023-12-01','2023-12-09','2023-12-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (60,'58302a257bee6290d8fc6e7662160cab1725154198',37,31,'2024-03-19','2024-03-29','2024-04-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (61,'53e1ab5ff7f2df22fb471710e727c6471725154198',40,21,'2024-05-10','2024-05-18','2024-05-21');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (62,'212594010df2c04aafb7126e91b4855a1725154198',17,32,'2023-11-03','2023-11-12','2023-11-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (63,'f230ea5f057bc49c10f4576922a8d1e01725154198',12,23,'2023-11-03','2023-11-07','2023-11-07');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (64,'72eafc9ad4164d5ab0f9e798c248bd481725154198',45,23,'2023-09-19','2023-09-29','2023-09-29');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (65,'7c488ee90f0adefbe2c2abc87f4381e41725154198',15,38,'2024-03-11','2024-03-21','2024-03-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (66,'492a4065757da32760d27995de8a05b61725154198',49,34,'2024-04-06','2024-04-09','2024-04-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (67,'3017cf8bfffbf50208bb290b31cc8ab91725154198',39,26,'2023-09-11','2023-09-20','2023-09-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (68,'b596edf3b365270955d18a839ad533a01725154198',5,22,'2023-09-14','2023-09-19','2023-09-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (69,'5c48f56f345fad642242170755f9e3bf1725154198',3,29,'2024-05-16','2024-05-21','2024-05-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (70,'a47e6f74950db48ed2dfd885a23872981725154198',32,37,'2024-04-25','2024-05-01','2024-05-04');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (71,'91a4f80391a30d494c291bcdd20db6e01725154198',11,36,'2024-01-30','2024-02-06','2024-02-09');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (72,'f853eb8baff97b9bcc7c23d7dac02d441725154198',10,39,'2023-12-14','2023-12-20','2023-12-21');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (73,'345f5d40f6e1a4ad47b3169d4560ebea1725154198',3,32,'2023-11-28','2023-12-09','2023-12-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (74,'5ffb21787ebf31d563e2b1a57cfff7481725154198',30,40,'2024-05-08','2024-05-15','2024-05-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (75,'638f357c6a9c875f8c362399e612d12e1725154198',14,21,'2024-01-04','2024-01-09','2024-01-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (76,'f25dd6ae258a0d0ebdd369f88de5c4721725154198',12,36,'2024-07-06','2024-07-14','2024-07-18');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (77,'cd260222c4eb25c5f96dad59dd8a4bd31725154198',3,21,'2024-04-27','2024-05-01','2024-05-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (78,'fca32baa75419012714126dbd8e3c84d1725154198',33,32,'2024-05-26','2024-06-01','2024-06-03');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (79,'8d8fa13b8aa85496b746763b126f9b921725154198',7,28,'2024-03-07','2024-03-11','2024-03-15');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (80,'ead9782a351ed34f9006bc915ffd3b531725154198',7,24,'2024-05-19','2024-05-28','2024-06-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (81,'ee06a830a66055de0fcbceafa7f8fd6b1725154198',45,36,'2024-01-07','2024-01-14','2024-01-17');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (82,'a521a06686455aab3cf7ce39ec1947621725154198',27,29,'2023-12-13','2023-12-21','2023-12-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (83,'ce8a5c44ebe9ba6ecb4d333f30cb81a71725154198',30,27,'2024-05-08','2024-05-17','2024-05-17');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (84,'be4384db6791a1e78d468cdb10c6a69a1725154198',8,26,'2024-05-19','2024-05-25','2024-05-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (85,'ce05c798e197f252d74a5a0f943651901725154198',1,34,'2024-08-05','2024-08-14','2024-08-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (86,'d4ac870a2b716614d84e627b49648a181725154198',2,28,'2023-09-30','2023-10-09','2023-10-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (87,'4c2c2a129be620289cdd006eac808cc11725154198',6,24,'2024-04-16','2024-04-24','2024-04-29');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (88,'ce4efa71c5fda8a2276ba6dad88ed5101725154198',34,35,'2024-06-04','2024-06-15','2024-06-19');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (89,'ad652f937b44808c2e9c07d65f6b18a21725154198',48,28,'2024-03-01','2024-03-03','2024-03-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (90,'12d713582d4962831ef2e1519a869e521725154198',5,25,'2024-06-18','2024-06-23','2024-06-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (91,'1d28146d6fd3a13914463ba313664dca1725154198',15,37,'2024-06-28','2024-07-06','2024-07-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (92,'289546016a18826bb132a0594e0fb9991725154198',16,24,'2024-01-30','2024-02-09','2024-02-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (93,'8a68bdb6c7d9ac3b1e32c60a20a5a4091725154198',22,27,'2023-10-19','2023-10-21','2023-10-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (94,'bdb2ba4f10e30adf1f1ce4153b7df6f31725154198',28,25,'2024-02-23','2024-02-25','2024-02-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (95,'d605869ecaa18fe44275609202247b361725154198',22,28,'2024-02-05','2024-02-07','2024-02-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (96,'8991645be09864b514627ab657ee52201725154198',11,31,'2024-08-14','2024-08-18','2024-08-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (97,'01c4bd5bf7e51fad358f1fecd0b15a741725154198',39,36,'2023-09-03','2023-09-04','2023-09-09');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (98,'2f072eaddaf95d803f8ed76a4a1fa2771725154198',24,34,'2024-07-14','2024-07-22','2024-07-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (99,'9cc70854d1f74b924487d183de990e861725154198',20,29,'2023-09-28','2023-10-07','2023-10-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (100,'5d3ac5ee4b8fa0c24b942ce44c63d53a1725154198',11,38,'2024-08-25','2024-09-02','2024-09-06');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (101,'10b7beb1b635178273101bcff5c84fe01725154198',26,37,'2024-02-23','2024-02-26','2024-03-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (102,'62af0722173ead1211a3f132876f0c4d1725154198',45,31,'2024-08-21','2024-08-25','2024-08-28');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (103,'c2e71a7745bbedbd32e6222fe6b883e51725154198',43,22,'2023-11-19','2023-11-20','2023-11-22');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (104,'9078ea59203fbbe7715a26d0ebf812831725154198',4,36,'2024-08-21','2024-08-23','2024-08-26');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (105,'226ab9ff7eae27f95c3e3cf37ff38baa1725154198',21,34,'2023-11-26','2023-12-05','2023-12-07');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (106,'35346cc3f010c607c109d5828da19e5c1725154198',9,21,'2024-02-10','2024-02-21','2024-02-21');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (107,'a5eca6cabad09f0d61df50179d96eb1d1725154198',28,39,'2023-12-13','2023-12-17','2023-12-21');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (108,'694718965139e22e595fc4abbf271ad01725154198',32,28,'2024-08-30','2024-09-02','2024-09-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (109,'1d1e09362fb49580e140c237ec8097541725154198',33,28,'2024-08-09','2024-08-13','2024-08-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (110,'84115505bf5ba1b86389ec7880356ece1725154198',22,33,'2024-04-08','2024-04-14','2024-04-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (111,'7d081188579dd0d3d99832d2a59718011725154198',8,23,'2024-02-24','2024-03-06','2024-03-07');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (112,'35ec4aab14466d03140565581c2b555d1725154198',31,22,'2024-01-23','2024-01-24','2024-01-26');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (113,'7a07328d51cef194cbfd0ae7e573207b1725154198',3,32,'2024-01-09','2024-01-14','2024-01-19');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (114,'545edcaf587887dbe6df6a46a02b341e1725154198',2,24,'2023-12-20','2023-12-23','2023-12-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (115,'667da254a8b38137c8d457afec60f0141725154198',39,23,'2024-01-10','2024-01-18','2024-01-19');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (116,'86187e059607e54df9d772cc6baa19fb1725154198',27,38,'2024-08-08','2024-08-16','2024-08-21');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (117,'ee9986889a6d803674f5e540a6aa2f381725154198',35,25,'2024-04-10','2024-04-12','2024-04-15');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (118,'772c3cce82eaa26394dd253691e0480a1725154198',49,32,'2023-10-11','2023-10-18','2023-10-21');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (119,'e28268e320fd98da3143faaf5d7f67371725154198',3,33,'2023-12-22','2023-12-30','2024-01-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (120,'1a6a38b1543d2456e6d33a958cefd64d1725154198',23,37,'2024-05-02','2024-05-11','2024-05-12');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (121,'83fd33e66e1f1a87b67081851e1a81fa1725154198',48,35,'2024-02-15','2024-02-16','2024-02-17');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (122,'438a8f00f313fbab5125c44a040e88a81725154198',2,21,'2024-05-11','2024-05-13','2024-05-17');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (123,'893f4658fc9a7535e87e42932469d52e1725154198',17,32,'2023-09-07','2023-09-15','2023-09-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (124,'3bef1355704523b59c805766508c56621725154198',39,32,'2024-03-16','2024-03-22','2024-03-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (125,'3416d88310638c52ad7e83b64fd8402e1725154198',50,37,'2024-05-22','2024-06-02','2024-06-03');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (126,'b7178130db08d89762b079d91735fba01725154198',6,27,'2024-04-25','2024-05-02','2024-05-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (127,'4f3ceed133e292c55a358207392674d61725154198',39,37,'2024-03-21','2024-03-24','2024-03-28');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (128,'6c5d237750e162a921817f472c0949f91725154198',41,38,'2024-02-24','2024-03-06','2024-03-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (129,'5e7378d704f257b15fc4a43873c3b7f61725154198',46,30,'2024-05-13','2024-05-24','2024-05-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (130,'bb7e80c66a7d0c7652af5714d58172d11725154198',13,22,'2024-03-15','2024-03-16','2024-03-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (131,'807459670601182db01b44d4df2a80dc1725154198',21,24,'2023-10-03','2023-10-07','2023-10-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (132,'4542282cc15a352ccba88b1541c292071725154198',25,24,'2024-05-18','2024-05-24','2024-05-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (133,'1050b30656a7d893b51918ebbc4a1f381725154198',2,25,'2023-12-21','2023-12-30','2024-01-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (134,'2d62bb182ce9e610e0626b115ecded241725154198',41,34,'2023-11-24','2023-11-26','2023-11-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (135,'52e3251993f7d0918b60512e243d6e7d1725154198',24,25,'2024-03-27','2024-04-02','2024-04-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (136,'65f83f6dc0db44d738f58bc5fb9863d71725154198',26,32,'2024-03-23','2024-03-27','2024-03-30');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (137,'9fe1bcec63711c0294c4952874747cab1725154198',32,30,'2024-07-31','2024-08-10','2024-08-11');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (138,'6ff4d312602a0867edde23d78f0312a91725154198',14,21,'2023-12-14','2023-12-20','2023-12-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (139,'37826859876dc22266138b186fb288e11725154198',37,27,'2024-03-12','2024-03-13','2024-03-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (140,'26ae0fe275790493b407a25af49c018c1725154198',43,26,'2024-01-12','2024-01-18','2024-01-22');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (141,'ec1d1c66b192e498737b3146b06182631725154198',26,28,'2023-12-21','2023-12-23','2023-12-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (142,'e44e047a8f4ef06bea205ea41aa0a7ee1725154198',4,23,'2024-03-01','2024-03-09','2024-03-11');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (143,'c31de2e35a4a527d4b8f0fe43e954b6f1725154198',37,37,'2024-08-26','2024-09-02','2024-09-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (144,'06c4f007c277b274e7ab334a7436b5571725154198',36,25,'2024-03-18','2024-03-25','2024-03-28');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (145,'68e5476a124d7bcd4a6e6c992e774de71725154198',45,30,'2024-08-04','2024-08-13','2024-08-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (146,'f5efc2732763e0231c9d674331cabef61725154198',26,35,'2024-01-28','2024-01-29','2024-02-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (147,'682d6e527ea7e746329a0871256abdf41725154198',7,24,'2023-09-10','2023-09-19','2023-09-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (148,'9e4b4534431bf18f4f0926905a0097921725154198',21,31,'2023-11-25','2023-12-02','2023-12-03');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (149,'f5845f4b2a99032555aaaf5ac254a12e1725154198',6,27,'2024-06-10','2024-06-18','2024-06-18');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (150,'7556729490543e23c3776b2c6992e1c31725154198',42,35,'2023-10-02','2023-10-11','2023-10-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (151,'d9b2734faf68c0339835312622f79de61725154198',10,38,'2024-06-10','2024-06-20','2024-06-23');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (152,'05e8f2c2f8d4021824312fbf236ce4ce1725154198',23,27,'2024-03-02','2024-03-11','2024-03-13');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (153,'a2111f7a8f4fb09e818e9a9a191f62771725154198',4,37,'2024-02-03','2024-02-05','2024-02-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (154,'3a9066610bafcb40d322788bea4e38371725154198',27,33,'2023-10-22','2023-10-28','2023-11-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (155,'be03e34da27e0246d1eff0ec0d55cc971725154198',16,26,'2024-06-18','2024-06-25','2024-06-29');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (156,'8116913d936aeaae7614f71c5c02cf7b1725154198',8,28,'2024-04-03','2024-04-13','2024-04-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (157,'aba59df7eaf5f4debc41307663e845cc1725154198',1,33,'2024-02-01','2024-02-08','2024-02-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (158,'27238674ae27722881ce7cfc5ae0d14c1725154198',22,30,'2024-04-06','2024-04-08','2024-04-12');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (159,'34e25c125cb7862837962942a39b5bde1725154198',33,39,'2024-04-22','2024-04-27','2024-05-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (160,'efe6e1b06ded890b76c24aae4479b75b1725154198',47,37,'2023-11-15','2023-11-18','2023-11-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (161,'70b7b1649106760b1a9afcd44f9c4af01725154198',14,29,'2023-11-03','2023-11-08','2023-11-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (162,'474e854947ada62079d8d9eeaa07ea101725154198',32,31,'2024-07-21','2024-07-26','2024-07-29');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (163,'4e293ba1d293ee3724fad404bd9ef32a1725154198',22,38,'2023-09-04','2023-09-14','2023-09-18');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (164,'bdb7378a89112433e5af25e99d91dd841725154198',19,21,'2024-01-21','2024-01-26','2024-01-31');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (165,'f46f87cfa77684a998914b5bf9fc5e001725154198',30,38,'2024-03-20','2024-03-27','2024-03-31');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (166,'043726830ade6c8f33a81a94043e64321725154198',5,26,'2024-08-31','2024-09-02','2024-09-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (167,'09173c2f3c877648e5f120c08202f2871725154198',46,22,'2024-02-23','2024-03-03','2024-03-05');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (168,'c8d23521a4c93a115f85335583191a671725154198',44,27,'2023-11-29','2023-12-06','2023-12-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (169,'d6d04a2f673bca76d6207afebc1d51471725154198',13,28,'2024-08-14','2024-08-24','2024-08-28');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (170,'8b0f1b2872011d223cc2ca334ec83be01725154198',37,40,'2024-02-29','2024-03-03','2024-03-03');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (171,'d2a5dba77379c1989e7a9a84af03ddcc1725154198',36,26,'2024-07-14','2024-07-16','2024-07-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (172,'aae32a00bda3dad43a53abd8f2dc74ff1725154198',14,34,'2023-11-22','2023-11-28','2023-12-02');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (173,'bda49db17804321cce1502d29cb6247c1725154198',32,31,'2023-12-21','2023-12-31','2024-01-01');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (174,'7bd6474de59795b76c02691b596bc4b01725154198',8,32,'2024-08-20','2024-08-22','2024-08-25');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (175,'c490583a43a150c9939eaa4eb4a249031725154198',5,22,'2024-01-13','2024-01-19','2024-01-20');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (176,'c3edd3e37e31ab0ae068fd010a59012e1725154198',41,21,'2024-04-10','2024-04-20','2024-04-22');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (177,'c71d6d39a3e1f5a4545d65826deb733a1725154198',35,26,'2024-02-07','2024-02-14','2024-02-14');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (178,'166e4be251af5ef5a316cf9402848b291725154198',32,23,'2023-11-26','2023-12-05','2023-12-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (179,'aad7bb4ed7b9443c9cc86f26eae4aadf1725154198',5,39,'2024-01-12','2024-01-18','2024-01-19');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (180,'898326d390a8d8083c7269626329fb031725154198',36,34,'2023-11-09','2023-11-14','2023-11-19');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (181,'27fdbeaa6c7a267865bc80f716da628b1725154198',22,23,'2024-05-01','2024-05-04','2024-05-04');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (182,'8e6751faf54fcdc7db3c3e47d0d35ccc1725154198',39,23,'2024-02-12','2024-02-14','2024-02-18');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (183,'92ec261f1dcad5ef253cfa36df1e7e9d1725154198',45,27,'2024-01-30','2024-02-09','2024-02-13');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (184,'235992eda3956bf0fe1246ba3744becb1725154198',42,30,'2023-12-08','2023-12-12','2023-12-13');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (185,'9916cfac44abb80cb74eb103b6bfe79b1725154198',38,38,'2024-08-03','2024-08-05','2024-08-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (186,'291d5b3bca60978b106a5b1e5afdaaba1725154198',27,22,'2023-11-13','2023-11-19','2023-11-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (187,'67bf85d7f86bf6ad92308d07c326e6c21725154198',3,29,'2023-11-13','2023-11-15','2023-11-16');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (188,'edd3ea00b7fe5bfeae758387a76d58b01725154198',1,31,'2024-02-21','2024-02-24','2024-02-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (189,'def8089d0878ab9ed7c432881164aaba1725154198',20,36,'2024-04-15','2024-04-19','2024-04-22');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (190,'680c0d069b1484efc308a23c706477fa1725154198',1,36,'2024-02-28','2024-03-08','2024-03-11');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (191,'714cffeb12d05fe8c704cb97a56a460c1725154198',24,35,'2024-01-25','2024-02-05','2024-02-08');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (192,'5825979c4f12c42a7f2b166db637ba921725154198',38,34,'2024-08-21','2024-08-27','2024-08-27');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (193,'cddb959a61a3582d903878c4277d0f071725154198',13,38,'2024-05-07','2024-05-12','2024-05-12');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (194,'a056fd6845df5671074e926cc52117b31725154198',41,31,'2024-03-14','2024-03-19','2024-03-24');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (195,'ddc5dac529bf60ee5e435ade9b8020271725154198',22,32,'2024-01-06','2024-01-16','2024-01-19');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (196,'51d08200f91200d5c44980e704271ee01725154198',20,26,'2023-12-31','2024-01-06','2024-01-10');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (197,'147dc62e73eebe8bc437593083a945d91725154198',44,22,'2024-02-25','2024-03-06','2024-03-07');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (198,'88833f6908da6c7be9db83e65fa460761725154198',37,22,'2023-10-23','2023-10-31','2023-11-03');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (199,'faac39aff3738193af2f88fc46fdbb361725154198',32,24,'2023-09-07','2023-09-09','2023-09-13');
INSERT INTO orders (order_id,order_no,cust_id,emp_id,order_date,required_date,shipped_date) VALUES (200,'e7d0fd4e5e142ee027230967c5340bf51725154198',8,35,'2023-11-09','2023-11-14','2023-11-14');

INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (1,1,1,50000,2,0.06591868112331127);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (2,2,3,2000,11,0.05023997930474664);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (3,3,5,2500,8,0.047543028665819526);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (4,4,2,40000,4,0.09474399833304617);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (5,5,7,7000,8,0.013811507876924624);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (6,6,3,2000,3,0.04198146778542551);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (7,7,4,1000,4,0.015415069810538286);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (8,8,4,1000,8,0.09530797070802564);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (9,9,1,50000,2,0.08253178299942904);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (10,10,10,2000,4,0.08153812871029303);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (11,11,5,2500,7,0.059263109544622244);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (12,12,9,1500,9,0.05395165521526266);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (13,13,9,1500,3,0.03343791235876523);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (14,14,1,50000,10,0.07574288783057243);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (15,15,1,50000,10,0.09903096919059351);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (16,16,5,2500,2,0.05919558675884887);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (17,17,8,1000,7,0.04823318958986107);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (18,18,6,3000,8,0.024485162753018843);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (19,19,8,1000,8,0.05885735267619907);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (20,20,4,1000,5,0.06512184150588994);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (21,21,4,1000,6,0.0695824127013438);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (22,22,9,1500,6,0.0006857377940072);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (23,23,9,1500,2,0.0995351621920264);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (24,24,7,7000,10,0.08989105842333274);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (25,25,1,50000,9,0.003571705180543461);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (26,26,5,2500,5,0.013561834298707965);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (27,27,2,40000,11,0.07373168192162893);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (28,28,4,1000,6,0.005403355010349032);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (29,29,7,7000,11,0.018761907807724756);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (30,30,8,1000,7,0.06329700044878805);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (31,31,10,2000,9,0.025096949180098707);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (32,32,10,2000,10,0.062204089374713334);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (33,33,5,2500,2,0.026683563640484922);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (34,34,6,3000,8,0.07579685083207509);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (35,35,3,2000,7,0.06967278854702386);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (36,36,9,1500,4,0.003989327051612435);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (37,37,1,50000,7,0.03809417487925515);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (38,38,10,2000,6,0.07115309229762161);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (39,39,9,1500,2,0.02467514082976834);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (40,40,3,2000,9,0.07069477721332405);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (41,41,3,2000,6,0.058166066574843);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (42,42,6,3000,5,0.0687546788696075);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (43,43,3,2000,9,0.0857574749430114);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (44,44,10,2000,3,0.06815586916820209);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (45,45,6,3000,3,0.011995848388953335);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (46,46,2,40000,6,0.0656763447435175);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (47,47,8,1000,11,0.09927322704048436);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (48,48,4,1000,4,0.09570554629740613);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (49,49,10,2000,4,0.07942412186862527);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (50,50,2,40000,1,0.0430411706380319);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (51,51,3,2000,11,0.03084036748484209);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (52,52,1,50000,7,0.07083026082781245);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (53,53,5,2500,3,0.06512673694552262);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (54,54,2,40000,6,0.05749524502606747);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (55,55,2,40000,3,0.09567135249160685);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (56,56,1,50000,1,0.07213355908954426);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (57,57,8,1000,10,0.03628655762101545);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (58,58,10,2000,6,0.06174888801840624);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (59,59,2,40000,10,0.08966687353312182);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (60,60,6,3000,7,0.038360553156558556);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (61,61,2,40000,6,0.025877353047989972);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (62,62,2,40000,6,0.0693303119233498);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (63,63,2,40000,4,0.04318197383845188);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (64,64,7,7000,6,0.012115481018727082);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (65,65,3,2000,1,0.02468908647032464);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (66,66,8,1000,8,0.03426399875583641);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (67,67,4,1000,2,0.011658257575169273);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (68,68,4,1000,10,0.0021584636838490215);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (69,69,1,50000,11,0.06969653073096964);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (70,70,4,1000,1,0.05632748121945852);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (71,71,7,7000,4,0.018976073548961383);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (72,72,3,2000,7,0.05779647385803273);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (73,73,3,2000,8,0.08022079530956745);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (74,74,4,1000,3,0.046856619934818156);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (75,75,6,3000,9,0.08041571150699839);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (76,76,7,7000,7,0.0028874371028841496);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (77,77,7,7000,8,0.09655600610055189);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (78,78,8,1000,2,0.09876087593765775);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (79,79,7,7000,2,0.052526805380998104);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (80,80,4,1000,1,0.0653552926179394);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (81,81,4,1000,7,0.038331035392663186);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (82,82,6,3000,1,0.09747648372020379);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (83,83,8,1000,11,0.08699029405592569);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (84,84,7,7000,10,0.060867747046778935);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (85,85,7,7000,10,0.0218488357608166);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (86,86,7,7000,3,0.08702683633916096);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (87,87,9,1500,4,0.00471744650026551);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (88,88,5,2500,2,0.0464573609552609);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (89,89,1,50000,4,0.05699358783126201);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (90,90,7,7000,1,0.06717580036379403);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (91,91,9,1500,6,0.05496561434380283);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (92,92,7,7000,3,0.05137051388031111);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (93,93,3,2000,9,0.08501852813097202);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (94,94,6,3000,8,0.04385108468753529);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (95,95,1,50000,5,0.08216053123885275);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (96,96,10,2000,4,0.01830770009770717);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (97,97,7,7000,9,0.018624979482196127);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (98,98,1,50000,3,0.08558119347655478);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (99,99,5,2500,11,0.09040013459087391);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (100,100,2,40000,11,0.04847251350729423);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (101,101,6,3000,7,0.005215762653118361);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (102,102,4,1000,2,0.05363089977873088);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (103,103,4,1000,5,0.07227504149440449);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (104,104,1,50000,10,0.038475586284069864);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (105,105,5,2500,10,0.05305382422555596);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (106,106,6,3000,9,0.07283658256645893);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (107,107,2,40000,9,0.05467596696025794);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (108,108,6,3000,7,0.026143652193575662);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (109,109,3,2000,1,0.038279571890636535);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (110,110,6,3000,9,0.0938341762367351);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (111,111,4,1000,5,0.009668528769915953);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (112,112,4,1000,8,0.025662811720032864);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (113,113,9,1500,3,0.0483380646333913);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (114,114,6,3000,6,0.06543888784195317);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (115,115,3,2000,9,0.08330103954305629);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (116,116,4,1000,2,0.030238982405659698);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (117,117,3,2000,2,0.01433986151720177);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (118,118,4,1000,8,0.08837724357485187);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (119,119,1,50000,3,0.009371042854152734);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (120,120,8,1000,4,0.09258742404960785);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (121,121,1,50000,8,0.0412269890290375);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (122,122,2,40000,10,0.05838843228104978);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (123,123,1,50000,7,0.09871150648408503);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (124,124,8,1000,6,0.06006713466495555);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (125,125,10,2000,8,0.06033814319642233);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (126,126,9,1500,4,0.027903320022605982);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (127,127,4,1000,7,0.027467742142695786);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (128,128,5,2500,7,0.04215481934219483);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (129,129,3,2000,10,0.00406489893706663);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (130,130,7,7000,7,0.02107591596604337);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (131,131,3,2000,6,0.09012127724823245);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (132,132,1,50000,3,0.023207040417650406);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (133,133,10,2000,2,0.036763355352103136);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (134,134,10,2000,1,0.0268834761182724);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (135,135,9,1500,5,0.03467706059961131);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (136,136,9,1500,3,0.0030880635952676982);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (137,137,4,1000,7,0.06993330192386367);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (138,138,4,1000,3,0.06932783768385278);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (139,139,2,40000,2,0.05846554002744142);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (140,140,9,1500,7,0.052244820920207505);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (141,141,9,1500,9,0.0428996468291345);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (142,142,3,2000,4,0.012461983067030502);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (143,143,9,1500,3,0.0134213063597457);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (144,144,4,1000,6,0.006189317752684787);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (145,145,8,1000,10,0.06282850482882765);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (146,146,2,40000,3,0.0010322387919877941);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (147,147,7,7000,7,0.04948515428831684);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (148,148,9,1500,5,0.09710271714048915);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (149,149,3,2000,2,0.06988299844500574);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (150,150,4,1000,10,0.06496792086474344);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (151,151,9,1500,7,0.013936566971645449);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (152,152,6,3000,5,0.027404241238624394);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (153,153,7,7000,10,0.024671482386197853);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (154,154,2,40000,5,0.02776664435014098);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (155,155,6,3000,8,0.02299878746035802);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (156,156,8,1000,10,0.03163193567450478);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (157,157,8,1000,1,0.005863557431943889);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (158,158,9,1500,4,0.05501492118736238);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (159,159,6,3000,10,0.029968796281102075);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (160,160,10,2000,7,0.04886124900714535);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (161,161,5,2500,6,0.05594689623750498);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (162,162,7,7000,2,0.05985007651740446);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (163,163,9,1500,2,0.031409670764816155);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (164,164,2,40000,6,0.03814128567878399);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (165,165,3,2000,7,0.022570559769677347);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (166,166,4,1000,7,0.04711092004595585);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (167,167,10,2000,10,0.07960295795532205);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (168,168,6,3000,9,0.014057497107372542);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (169,169,1,50000,4,0.011768139334647288);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (170,170,4,1000,10,0.02724101521511173);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (171,171,1,50000,3,0.0054938491841767245);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (172,172,7,7000,7,0.058533481818374616);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (173,173,5,2500,5,0.09757671540882457);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (174,174,2,40000,4,0.06469979520736402);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (175,175,8,1000,6,0.0017721006477216862);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (176,176,3,2000,1,0.0783634717643075);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (177,177,8,1000,7,0.02016528073359183);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (178,178,1,50000,7,0.04370318105530444);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (179,179,6,3000,2,0.0705168005722669);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (180,180,7,7000,6,0.025720988230465737);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (181,181,5,2500,4,0.051558931384907684);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (182,182,3,2000,6,0.036556763380477975);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (183,183,8,1000,9,0.003993239803347137);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (184,184,9,1500,9,0.08101805697526387);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (185,185,7,7000,5,0.014392785778700557);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (186,186,2,40000,5,0.046661015534824206);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (187,187,6,3000,8,0.040725298904987994);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (188,188,5,2500,5,0.013993278503635765);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (189,189,5,2500,8,0.004852247822991274);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (190,190,1,50000,7,0.06945941216814404);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (191,191,7,7000,8,0.021876921104919234);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (192,192,6,3000,10,0.08978595562192809);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (193,193,8,1000,8,0.09605388667768154);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (194,194,10,2000,4,0.07016673349502937);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (195,195,8,1000,9,0.06526139667167286);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (196,196,9,1500,5,0.07200738667272547);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (197,197,1,50000,11,0.08259386183294595);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (198,198,7,7000,10,0.01705624178469307);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (199,199,3,2000,9,0.07595734055950346);
INSERT INTO order_details (order_detail_id,order_id,product_id,unit_price,quantity,discount) VALUES (200,200,9,1500,7,0.09444933909804476);


INSERT INTO mileage_grade (mileage_id,grade,min_mileage,max_mileage) VALUES (1,'A',0,99);
INSERT INTO mileage_grade (mileage_id,grade,min_mileage,max_mileage) VALUES (2,'B',100,199);
INSERT INTO mileage_grade (mileage_id,grade,min_mileage,max_mileage) VALUES (3,'C',200,299);
INSERT INTO mileage_grade (mileage_id,grade,min_mileage,max_mileage) VALUES (4,'D',300,399);
INSERT INTO mileage_grade (mileage_id,grade,min_mileage,max_mileage) VALUES (5,'E',400,499);
INSERT INTO mileage_grade (mileage_id,grade,min_mileage,max_mileage) VALUES (6,'F',500,999);
INSERT INTO mileage_grade (mileage_id,grade,min_mileage,max_mileage) VALUES (7,'VIP',1000,9999);
