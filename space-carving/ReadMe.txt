1. Description
  1) Code “CG_asg3_DL” using recurrence as main idea to implement.
     For one point calculated, if all 8 cameras reflect the point of pixel cube to a white point on pic, then we keep it.
  2) Code “CG_asg3_DL_With_MeshNBwdist” using Mesh method.
      Comparing to code “CG_asg3_DL”, code “CG_asg3_DL_With_MeshNBwdist” fix one camera. For one camera, if the point of the pixel cube is reflected on the pic and the distance to surface suit the range, then we count this point as available and store it in matrix X. After one recurrence for the 1st camera, replace pixel cube with the matrix X. Based on this design, number of points will reduce each time.
  3) REVOLUTION: 0.05

2. Time Consuming:
  CG_asg3_DL: 160-170s
  CG_asg3_DL_With_MeshNBwdist: 5-6s(for each second )

3. Tips
  1) Code “CG_asg3_DL_With_MeshNBwdist” neglects some points inside human. 
  2)Code “CG_asg3_DL_With_MeshNBwdist” plots the 0th second and the 174th on the same figure.
 
4. Acknowledgement
  Thanks for the help from professor and snacks from friends.