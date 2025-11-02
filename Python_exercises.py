#1. Declare and assign variables
# Answer:
shuttle_name         = "determination"
shuttle_speed_mph    = 17500
distance_to_mars_km  = 225000000
distance_to_moon_km  = 384400
miles_per_km         = 0.621
    
#2. Print out the type of each variable    
#Answer:     
            #<class 'str'>
            #<class 'int'>
            #<class 'int'>
            #<class 'int'>
            #<class 'float'>
print(type(shuttle_name))
print(type(shuttle_speed_mph))
print(type(distance_to_mars_km))
print(type(distance_to_moon_km))
print(type(miles_per_km))

#3. Calculate a space mission
#   We need to determine how many days it will take to reach Mars.

#   a .Create and assign a miles to Mars variable. You can get the miles to Mars by multiplying the distance to Mars in kilometers 
#     by the miles per kilometer.
    
      #Answer: 139725000.0
miles_to_mars = distance_to_mars_km * miles_per_km
      
#   b. Next, we need a variable to hold the hours it would take to get to Mars. To get the hours, you need to divide the miles to Mars by the 
#      shuttle’s speed.   
      
#     Answer: 7984.285714285715
hours_to_mars = miles_to_mars / shuttle_speed_mph

#   c. Finally, declare a variable and assign it the value of days to Mars. In order to get the days it will take to reach Mars, 
#      you need to divide the hours it will take to reach Mars by 24
      
#      Answer: 
days_to_mars  = hours_to_mars / 24
      
#4. Print out the results of your calculations  
    
#  Answer: determination will take 332.67857142857144 days to reach the Mars. 
  
print(shuttle_name + " will take " + str(days_to_mars) + " days to reach the Mars.")
  
#5. Now calculate a trip to the Moon  

#  Answer:determination will take 0.5683628571428571 days to reach the Moon.
  
miles_to_moon = distance_to_moon_km * miles_per_km
hours_to_moon = miles_to_moon/shuttle_speed_mph
days_to_moon = hours_to_moon/24
print(shuttle_name + " will take " + str(days_to_moon) + " days to reach the Moon.")
