#1.Assign the following variables for our space shuttle


engine_indicator_light = "red blinking"
space_suits_on         = True
shuttle_cabin_ready    = True
crew_status            = shuttle_cabin_ready and shuttle_cabin_ready
computer_status_code   = 200
shuttle_speed          = 15000

#2.Examine the code below. What will be printed to the console?
if engine_indicator_light == "green": 
   print("engines have started")
elif engine_indicator_light == "green blinking": 
   print("engines are preparing to start")
else:
   print("engines are off")
   
Answer:engines are off   