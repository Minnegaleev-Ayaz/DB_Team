SELECT FlightNumber, DepartureAirport, ArrivalAirport, ArrivalTime
FROM Flights
WHERE ArrivalTime > NOW()
ORDER BY ArrivalTime;

SELECT A.AirlineName, COUNT(F.FlightID) AS FlightCount
FROM Airlines A
LEFT JOIN Flights F ON A.AirlineID = F.AirlineID
GROUP BY A.AirlineName
ORDER BY FlightCount DESC
LIMIT 5;