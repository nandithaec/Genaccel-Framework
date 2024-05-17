# Vector Systolic Architecture
We introduce GenAccel, which is not yet another accelerator, but a framework that can generate custom vector accelerator designs in RTL. 
 This framework generates RTL for custom vector systolic accelerators (VSA) to accelerate convolution, on a target FPGA. The user provides an input configuration file with image-kernel dimensions, target FPGA and desired throughput. 

 
We include several architectural novelties in GenAccel such as: 
vector systolic architecture with reconfigurable processing elements (PE), variable vector lane widths, efficient FPGA hybrid resource usage and heterogeneous multi-frequency configurations. 

Although the design process for RTL-based accelerators is time-consuming as compared to their HLS counterparts, we choose RTL for our framework as it allows us to have more fine-grain control over the FPGA-specific optimizations.

We present several RTL accelerator designs for different vector lane widths such Vector 2 (V2), V4, V6 and so on
