#1. Write conditional expressions to satisfy the safety rules.
    #1.crew_status
   
engine_indicator_light = "red blinking"
space_suits_on         = True
shuttle_cabin_ready    = True
crew_status            = space_suits_on and shuttle_cabin_ready
computer_status_code   = 200
shuttle_speed          = 15000
if crew_status:
   print("Crew Ready")
else: 
   print("Crew Not Ready")   
   
Answer:Crew Ready   
   
   
   
 #1.computer_status_code
   

engine_indicator_light = "red blinking"
space_suits_on         = True
shuttle_cabin_ready    = True
crew_status            = space_suits_on and shuttle_cabin_ready
computer_status_code   = 200
shuttle_speed          = 15000
if computer_status_code == 200:
   print("Please stand by. Computer is rebooting.")
elif computer_status_code == 400:
   print("Success! Computer online.") 
else:
   print("ALERT: Computer offline!")
   
Answer:Please stand by. Computer is rebooting.   
   
  #1.shuttle_speed

engine_indicator_light = "red blinking"
space_suits_on         = True
shuttle_cabin_ready    = True
crew_status            = space_suits_on and shuttle_cabin_ready
computer_status_code   = 200
shuttle_speed          = 15000
if shuttle_speed > 17500:
   print("ALERT: Escape velocity reached!")
elif shuttle_speed < 8000:
   print("ALERT: Cannot maintain orbit!")
else:
   print("Stable speed.")
      
Answer:Stable speed.


#2.PREDICT

#Do these code blocks produce the same result? Answer Yes or No.
 Answer:Yes
	  