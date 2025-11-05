#Define three variables for the LaunchCode shuttle—one for the starting fuel level, another for the number of astronauts aboard, and the third for the altitude the shuttle reaches.

#1.Construct while loops to do the following:

    #1.Prompt the user to enter the starting fuel level. The loop should continue until the user enters a positive value greater than 5000 but less than 30000.           
           
fuel_level = 0
astronauts_aboard = 0
altitude = 0    
while fuel_level <= 5000 or fuel_level > 30000:
   fuel_level = int(input("Enter the starting fuel level: "))     

    #2.Use a second loop to query the user for the number of astronauts (up to a maximum of 7). Validate the entry by having the loop continue until the user enters an integer from 1 - 7.

while astronauts_aboard >=1 and astronauts_aboard <=7:
   astronauts_aboard = int(input("Enter number of astronauts aboard:")) 
   
   #3.Use a final loop to monitor the fuel status and the altitude of the shuttle. Each iteration, decrease the fuel level by 100 units for each astronaut aboard. Also, increase the altitude by 50 kilometers. (Hint: The loop should end when there is not enough fuel to boost the crew another 50 km, so the fuel level might not reach 0).
fuel_level = 1000
astronauts_aboard = 1
altitude = 0
while fuel_level-100*astronauts_aboard >= 0:
   altitude += 50
   print("fuel level:" + str(fuel_level))
   print("altitude:" + str(altitude))
   fuel_level -= 100*astronauts_aboard
   
   
#2.After the loops complete, print the result with the phrase, The shuttle gained an altitude of ___ km and has ___ kg of fuel left. Fill in the blanks with the altitude and fuel level values.   
fuel_level = 1000
astronauts_aboard = 1
altitude = 0
while fuel_level-100*astronauts_aboard >= 0:
   altitude += 50
   print("fuel level:" + str(fuel_level))
   print("altitude:" + str(altitude))
   fuel_level -= 100*astronauts_aboard
if altitude >= 2000:
   ending = 'Orbit achieved!'
else:
   ending = 'Failed to reach orbit.'   
print(ending)   
print("The shuttle gained an altitude of " + str(altitude) + " km and has "+ str(fuel_level) + " kg of fuel left.")     

Answer:fuel level:1000
altitude:50
fuel level:900
altitude:100
fuel level:800
altitude:150
fuel level:700
altitude:200
fuel level:600
altitude:250
fuel level:500
altitude:300
fuel level:400
altitude:350
fuel level:300
altitude:400
fuel level:200
altitude:450
fuel level:100
altitude:500
Failed to reach orbit.
The shuttle gained an altitude of 500 km and has 0 kg of fuel left.


   