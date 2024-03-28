
#Defining formulas
# Throughput (matmul per second) = No. of 4x4 matmul / (one second * One Systolic Cycle)
# Throughput (Systolic per second) = No. Of PE mac x Vector size / One second 
# Latency = Time Taken to compute one Element ops x Total number of elements in the mat (Row A x Col A x Row B) 
# Throughput/W = Throughput/Power 
