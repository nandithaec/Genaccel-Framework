
#Defining formulas
# Throughput (matmul per second) = No. of 4x4 matmul / (one second * One Systolic Cycle)
# Throughput (Systolic per second) = No. Of PE mac x Vector size / One second 
# Latency = Time Taken to compute one Element ops x Total number of elements in the mat (Row A x Col A x Row B) 
# Throughput/W = Throughput/Power 
vector = [2, 4, 6, 8, 10]
count = 0




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

