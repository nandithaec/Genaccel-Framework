import subprocess
import os
import shutil
# Define the terminal command

#Making the directory
directory_path = "/home/iiitb/Desktop/Test_Case/design_" + "1"

# Create the directory
os.makedirs(directory_path, exist_ok=True)


command = """
cd /tools/Xilinx/Vivado/2023.2/bin/"""
#./vivado -source /home/iiitb/Desktop/script.tcl -mode tcl
#"""

# Run the command
try:
    # Execute the command and capture the output
    output = subprocess.check_output(command, shell=True, universal_newlines=True)
    
    # Print the output
    print(output)
    
except subprocess.CalledProcessError as e:
    # If there's an error, print the error message
    print("Error executing command:", e)


# Specify the paths of the source file and the new destination
source_file = "/home/iiitb/Desktop/Test_Case/power_rpt.rpt"
new_destination = "/home/iiitb/Desktop/Test_Case/design_" + "1" + "/power_rpt.rpt"

# Move the file and rename it
shutil.move(source_file, new_destination)


# Specify the paths of the source file and the new destination
source_file = "/home/iiitb/Desktop/Test_Case/timing_rpt.rpt"
new_destination = "/home/iiitb/Desktop/Test_Case/design_" + "1" + "/timing_rpt.rpt"

# Move the file and rename it
shutil.move(source_file, new_destination)

# Specify the paths of the source file and the new destination
source_file = "/home/iiitb/Desktop/Test_Case/utilization_rpt.rpt"
new_destination = "/home/iiitb/Desktop/Test_Case/design_" + "1" + "/utilization_rpt.rpt"

# Move the file and rename it
shutil.move(source_file, new_destination)
