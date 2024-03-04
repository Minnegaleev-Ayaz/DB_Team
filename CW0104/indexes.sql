create index index_flight_no on flights (flight_no);

create index index_scheduled_departure on flights (scheduled_departure);

create index index_scheduled_arrival on flights (scheduled_arrival);

create index index_amount on ticket_flights(amount);

create index index_passenger_name on tickets(passenger_name);

create index index_flight_id on boarding_passes(flight_id);
