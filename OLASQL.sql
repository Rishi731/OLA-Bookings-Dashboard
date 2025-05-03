Create Database OLA;
use ola;
select count(*) from bookings;

-- 1. Retrieve all successful bookings:
-- select count(*) from bookings where Booking_Status = "Success";
Create view Successful_Bookings As
select * from bookings where Booking_Status = "Success";

select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
Create view RideDistance_For_Each_Vehicle As
Select vehicle_type,AVG(Ride_Distance) Average_RideDistance from bookings group by vehicle_type;

select * from RideDistance_For_Each_Vehicle;

-- 3. Get the total number of cancelled rides by customers:
Create view cancelled_rides_by_customers As
Select count(*) from bookings where Booking_Status = "Canceled by Customer";

Select * from cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
Create view top_5_customers as
select Customer_ID, Count(Booking_ID) as Total_Rides from bookings group by Customer_ID order by Total_Rides desc limit 5;

Select * from top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view cancelled_by_drivers_P_C_Issues as
Select count(*) from bookings where Canceled_Rides_by_Driver = "Personal & Car related issue";

Select * from cancelled_by_drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view max_min_driver_ratings as
select max(Driver_Ratings) Max_Rating,min(Driver_Ratings) Min_Rating from bookings where Vehicle_Type = "Prime Sedan";

select * from max_min_driver_ratings;

-- 7. Retrieve all rides where payment was made using UPI:
Create view UPI_Payment as
Select * from bookings where Payment_Method = 'UPI';

select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:
Create view avg_cust_rating as
Select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating from bookings group by Vehicle_Type;

Select * from avg_cust_rating;

-- 9. Calculate the total booking value of rides completed successfully:
Create view total_successfull_ride_value as
Select sum(booking_value) total_succ_value from bookings where Booking_Status = 'Success';

Select * from total_successfull_ride_value;

-- 10. List all incomplete rides along with the reason:
Create view incomplete_rides_reason as
Select Booking_ID,Incomplete_Rides_Reason from bookings where InComplete_Rides = 'Yes';

Select * from incomplete_rides_reason;
Select count(*) from incomplete_rides_reason;