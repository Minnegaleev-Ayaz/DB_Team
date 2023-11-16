create table Country(
                        id serial primary key,
                        title varchar(50),
                        population integer,
                        Unique(title)
);
create table League(
                       id serial primary key,
                       title varchar(50) not null,
                       number_of_team integer not null,
                       country integer references Country(id)
);
create table City(
                     id serial primary key,
                     title varchar(50),
                     population integer,
                     country integer references Country(id)
);
create table Stadium(
                        id serial primary key,
                        title varchar(50),
                        capacity integer not null,
                        adress varchar(50) not null,
                        city integer references City(id)
);
create table Team(
                     id serial primary key,
                     title varchar(50),
                     budget integer,
                     stadium integer references Stadium(id),
                     league integer references League(id),
                     country integer references Country(id)
);
create table Player(
                       id serial primary key,
                       age integer not null check(age>16 and age<50),
                       first_name varchar(50) not null,
                       last_name varchar(50) not null,
                       height integer check(height>140 and height<250),
                       weight integer check(weight>40 and weight<200),
                       place integer check(place>0 and place<11),
                       salary integer not null,
                       transfer_cost integer not null,
                       nation integer references Country(id),
                       team integer references Team(id)
);
create table Fan(
                    id serial primary key,
                    first_name varchar(100) not null,
                    last_name varchar(100) not null,
                    lovely_team integer references Team(id)
);
create table Coach(
                      id serial primary key,
                      age integer not null check(age>20 and age<90),
                      first_name varchar(50) not null,
                      last_name varchar(50) not null,
                      salary integer not null,
                      country integer references Country(id),
                      team integer references Team(id)
);