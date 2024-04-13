import subprocess
import openpyxl
import pandas as pd
import os
import shutil
#Defining formulas
# Throughput (matmul per second) = No. of 4x4 matmul / (one second * One Systolic Cycle)
# Throughput (Systolic per second) = No. Of PE mac x Vector size / One second 
# Latency = Time Taken to compute one Element ops x Total number of elements in the mat (Row A x Col A x Row B) 
# Throughput/W = Throughput/Power 
vector = [2, 4, 6, 8]
count = 0


workbook = openpyxl.Workbook()
# Select the default sheet (usually named 'Sheet')
sheet = workbook.active

sheet.append(["Design", "Tile 1", "Tile 2", "Tile 3", "Tile 4"])
def execute_vivado(file):
    #Making the directory
    directory_path = "/home/iiitb/Desktop/Test_Case/design_" + str(file)

    # Create the directory
    os.makedirs(directory_path, exist_ok=True)


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


    # Specify the paths of the source file and the new destination
    source_file = "/home/iiitb/Desktop/Test_Case/power_rpt.rpt"
    new_destination = "/home/iiitb/Desktop/Test_Case/design_" + str(file) + "/power_rpt.rpt"

    # Move the file and rename it
    shutil.move(source_file, new_destination)


    # Specify the paths of the source file and the new destination
    source_file = "/home/iiitb/Desktop/Test_Case/timing_rpt.rpt"
    new_destination = "/home/iiitb/Desktop/Test_Case/design_" + str(file) + "/timing_rpt.rpt"

    # Move the file and rename it
    shutil.move(source_file, new_destination)

    # Specify the paths of the source file and the new destination
    source_file = "/home/iiitb/Desktop/Test_Case/utilization_rpt.rpt"
    new_destination = "/home/iiitb/Desktop/Test_Case/design_" + str(file) + "/utilization_rpt.rpt"

    # Move the file and rename it
    shutil.move(source_file, new_destination)

def rewrite_file(v1, v2, v3, v4):
   # Open the file in read mode
  with open('/home/iiitb/Jay/htiles_design_1/htiles_design_1.srcs/sources_1/new/parameters.v', 'r') as file:
      lines = file.readlines()

  # Make changes to the content
  new_lines = []
  var = ""
  for line in lines:
      # Modify the content as needed
      if('V1' in line):
        new_lines.append('parameter V1 = ' + str(v1) + '; \n')
      elif('V2' in line):
         new_lines.append('parameter V2 = ' + str(v2) + '; \n')
      elif('V3' in line):
         new_lines.append('parameter V3 = ' + str(v3) + '; \n')
      elif('V4' in line):
         new_lines.append('parameter V4 = ' + str(v4) + '; \n')
      else:
        new_lines.append(line)   

  # Open the file in write mode to overwrite the content
  with open('/home/iiitb/Jay/htiles_design_1/htiles_design_1.srcs/sources_1/new/parameters.v', 'w') as file:
      file.writelines(new_lines)

data = []

for v1 in vector:
  for v2 in vector:
    for v3 in vector:
      for v4 in vector:
        #Write up a parameters.h file with addressing parameters are V1, V2, V3, V4, V1_dsp, V2_dsp, V3_dsp, V4_dsp
        #running a tcl script and reading the utilization, power and timing report
        design = ["design " + str(count) , str(v1), str(v2), str(v3), str(v4)]
        sheet.append(design)
        print("righting the design name in the xcel shit")
        rewrite_file(v1, v2, v3, v4)
        print("parameter file lakhi didhi")
        execute_vivado(count)
        print("check kar la baka")
        count = count + 1
        print(v1, v2, v3, v4)

# Save the workbook to a file
workbook.save("/home/iiitb/Desktop/Test_Case/my_excel_file.xlsx")
# Print a success message
print("Excel file created successfully!") 
        
def write_parameters(v1, v2, v3, v4):
    f = open("parameters.v", "a")
    f.write("")
    
print(count)

