Create table userr(
                      id serial primary key,
                      username varchar(25) unique ,
                      creation_date Date,
                      age date check (age> '1950-01-01' ),
                      friends_count Integer not null,
                      online boolean not null

);
Create table groups(
                       id serial primary key,
                       username varchar(25) unique,
                       creation_date date check(creation_date>'1950-01-01'),
                       subscribers_count Integer not null,
                       description varchar(1000) not null,
                       creator integer references userr(id)
);
Create table post(
                     id serial primary key,
                     post_creator integer references userr(id) not null,
                     shared_group integer references groups(id) not null,
                     creation_date date not null,
                     title varchar(50) unique,
                     description varchar(1000) not null,
                     likes_count integer not null
);
Insert into userr(username,creation_date, age,friends_count,online)
values ('ayaz','2012-06-12','2005-01-24',50,'t'),
       ('ilya','2012-06-12','2004-12-24',100,'f'),
       ('elena','2013-06-12','2003-02-05',150,'t'),
       ('kirill','2014-06-12','2005-04-30',2,'f'),
       ('sava','2012-07-12','2003-10-14',98,'t'),
       ('sonya','2012-11-12','1992-01-21',123,'f'),
       ('evelina','2011-09-12','2022-11-24',1,'f');
Insert into groups(username,creation_date,subscribers_count,description,creator)
values('Ovsyanka','2015-01-01',100000,'fdgxfhcvbkjalsjdbvgjayksuldihgayjsdkguhhkashdhjagsdhjasgd',1),
      ('GitEd','2018-01-10',1000,'aksdhjasjdkhsadkjhakjdhasjd',1),
      ('JavaTutor','2022-05-24',11231,'aksdhasjdhjakhdkjahdkj',1);

Insert into post(post_creator,shared_group,creation_date,title,description,likes_count)
values (1,2,'2022-02-02','Start','end',22),
       (2,3,'2023-01-01','Kr','ne yspel',123),
       (4,1,'2021-01-01','HAppy new year','!!!!!!',12),
       (5,2,'2020-02-05','Happy birthday','congrats',13);