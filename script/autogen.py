import subprocess
import openpyxl
import pandas as pd
#Defining formulas
# Throughput (matmul per second) = No. of 4x4 matmul / (one second * One Systolic Cycle)
# Throughput (Systolic per second) = No. Of PE mac x Vector size / One second 
# Latency = Time Taken to compute one Element ops x Total number of elements in the mat (Row A x Col A x Row B) 
# Throughput/W = Throughput/Power 
vector = [2, 4, 6, 8, 10]
count = 0


workbook = openpyxl.Workbook()
# Select the default sheet (usually named 'Sheet')
sheet = workbook.active

sheet.append(["Design", "Tile 1", "Tile 2", "Tile 3", "Tile 4"])
def execute_vivado():
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

data = []

for v1 in vector:
  for v2 in vector:
    for v3 in vector:
      for v4 in vector:
        #Write up a parameters.h file with addressing parameters are V1, V2, V3, V4, V1_dsp, V2_dsp, V3_dsp, V4_dsp
        #running a tcl script and reading the utilization, power and timing report
        design = ["design " + str(count) , str(v1), str(v2), str(v3), str(v4)]
        sheet.append(design)
        count = count + 1

# Save the workbook to a file
workbook.save("my_excel_file.xlsx")
# Print a success message
print("Excel file created successfully!") 
        
def write_parameters(v1, v2, v3, v4):
    f = open("parameters.v", "a")
    f.write("")
    
print(count)


