import subprocess
#Defining formulas
# Throughput (matmul per second) = No. of 4x4 matmul / (one second * One Systolic Cycle)
# Throughput (Systolic per second) = No. Of PE mac x Vector size / One second 
# Latency = Time Taken to compute one Element ops x Total number of elements in the mat (Row A x Col A x Row B) 
# Throughput/W = Throughput/Power 
vector = [2, 4, 6, 8, 10]
count = 0

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



for v1 in vector:
  for v2 in vector:
    for v3 in vector:
      for v4 in vector:
        #Write up a parameters.h file with addressing parameters are V1, V2, V3, V4, V1_dsp, V2_dsp, V3_dsp, V4_dsp
        #running a tcl script and reading the utilization, power and timing report
        count = count + 1
        
        
def write_parameters(v1, v2, v3, v4):
    f = open("parameters.v", "a")
    f.write("")
    
print(count)


