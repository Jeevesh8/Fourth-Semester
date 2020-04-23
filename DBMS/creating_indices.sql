/*
Most Common Queries :-
1.) Getting all trips from and to a particular location(index needed)
2.) Getting all Drivers with a particular model of vehicle(Index Needed)
3.) Getting trips for dates.
4.) Checking which driver accepted your request? And
    Getting Status of Requests(Indexes already there)
*/

--Drop Index
Drop Index dest_idx, source_idx, search_idx, date_idx on Trip;

--Single Index
Create Index dest_idx on Trip(destination);
Create Index source_idx on Trip(source);

--Composite or Compound Index
Create Index search_idx on Trip(destination, source); 

--Assuming we need query using only arrival_date 
--and (arrival date, departure_date) to be faster.
Create Index date_idx on Trip(arrival_date, depature_date);