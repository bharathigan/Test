#1.Monitor the shuttle’s fuel status.

if fuel_level < 1000 or engine_temperature > 3500 or engine_indicator_light == "red blinking":
   print("ENGINE FAILURE IMMINENT!")
elif fuel_level <= 5000 or engine_temperature > 2500:
   print("Check fuel level. Engines running hot.")
elif fuel_level > 20000 and engine_temperature <= 2500:
   print("Full tank. Engines good.")
elif fuel_level > 10000 and engine_temperature <= 2500:
   print("Fuel level above 50%. Engines good.")
elif fuel_level > 5000 and engine_temperature <= 2500:
   print("Fuel level above 25%. Engines good.")
else:
   print("Fuel and engine status pending...")
   
   
#2.Final bit of fun!
    #1.Create the variable command_override, and set it to be true or false.
   
command_override       = True
fuel_level             = 25000
if command_override==False:
    if fuel_level > 20000 and engine_indicator_light == "green blinking":
       print("Launching shuttle, Override command engaged.")   
elif  command_override==True:
   print("Launching shuttle")   
   
Answer:Launching shuttle

    #2.Code the following if / else check:
command_override       = True
fuel_level             = 30000
if fuel_level>20000 and engine_indicator_light !='red blinking' or command_override ==True:
 print("Cleared to launch!")
else:
   print("Launch scrubbed!")
Answer:Cleared to launch!   