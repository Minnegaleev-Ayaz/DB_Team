begin;

\set random_number random(0,150000)
\set range_of_aircraft random(5000,20000)


select seat_no,fare_conditions,amount
from boarding_passes inner join ticket_flights
    on boarding_passes.ticket_no = ticket_flights.ticket_no
    and boarding_passes.flight_id = ticket_flights.flight_id
where amount < :random_number;

select passenger_id,passenger_name,total_amount from tickets
join bookings.bookings b on b.book_ref = tickets.book_ref
where passenger_name ilike '%elena zakharova'
;

select arrival_airport,departure_airport,status from flights
where departure_airport = 'LED';

select f.flight_no,f.scheduled_departure,f.scheduled_arrival,count(f.flight_id)
from flights f
join ticket_flights on f.flight_id = ticket_flights.flight_id
group by f.flight_no, f.scheduled_departure, f.scheduled_arrival
having count(f.flight_id) > :random_number
order by f.flight_no,f.scheduled_departure,f.scheduled_arrival,count(f.flight_id) desc
limit 5;

select * from boarding_passes
order by flight_id;

update seats
set fare_conditions = 'Economy'
where  seat_no in ('2A','2C','2D','2F','3A','3C','3D','3F','4A','4C','4D','4F','5A','5C','5D'
)
;

update airports_data
set timezone = 'Europe/Moscow'
where airport_code = 'IJK';

insert into aircrafts_data
    (aircraft_code, model, range)
values (:random_number::varchar(3),'{"en": "Mokriy Superjet-228", "ru": "Мокрый Суперджет-228"}',:range_of_aircraft);

delete from aircrafts_data
where aircraft_code = '1';
end;