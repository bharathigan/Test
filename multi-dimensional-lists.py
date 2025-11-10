food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"

# a) Use split to convert the strings into four cabinet lists. Alphabetize the contents of each cabinet.

cabinet1 = "water bottles, meal packs, snacks, chocolate"
cabinet2 = "space suits, jet packs, tool belts, thermal detonators"
cabinet3 = "parrots, cats, moose, alien eggs"
cabinet4 = "blankets, pillows, eyepatches, alarm clocks"
cabinet1 = cabinet1.split(", ")
cabinet2 = cabinet2.split(", ")
cabinet3 = cabinet3.split(", ")
cabinet4 = cabinet4.split(", ")
cabinet1.sort()
cabinet2.sort()
cabinet3.sort()
cabinet4.sort()


# b) Initialize a cargo_hold list and add the cabinet lists to it. Print cargo_hold to verify its structure.
cargoHold = [cabinet1, cabinet2, cabinet3, cabinet4]
print(cargoHold)


# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.
cabinet_number = int(input("Select a cabinet (0–3): "))


# d) Use bracket notation and format to display the contents of the selected cabinet. If the user entered an invalid number, print an error message.
if  cabinet_number >-1:
    print(f"Cabinet {cabinet_number} contains: {cargoHold[cabinet_number]}")
else:
    print("Error: Invalid cabinet number!")


# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND a particular item. Use the in method to check if the cabinet contains the selected item, then print “Cabinet ____ DOES/DOES NOT contain ____.”
cabinet_number = int(input("Select a cabinet (0–3): "))
item_name = input("Enter an item to search: ").lower()
if  cabinet_number >-1:
    print(f"Cabinet {cabinet_number} contains: {cargoHold[cabinet_number]}")
    if item_name in cargoHold[cabinet_number]:
        print(f"Cabinet {cabinet_number} DOES contain {item_name}.")
    else:
        print(f"Cabinet {cabinet_number} DOES NOT contain {item_name}.")
else:
    print("Error: Invalid cabinet number!")