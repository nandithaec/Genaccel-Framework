import subprocess

# Define the terminal command
command = """
cd /tools/Xilinx/Vivado/2023.2/bin/
./vivado -source /home/iiitb/Desktop/script.tcl -mode tcl
"""

# Run the command
try:
    # Execute the command and capture the output
    output = subprocess.check_output(command, shell=True, universal_newlines=True)
    
    # Print the output
    print(output)
    
except subprocess.CalledProcessError as e:
    # If there's an error, print the error message
    print("Error executing command:", e)

