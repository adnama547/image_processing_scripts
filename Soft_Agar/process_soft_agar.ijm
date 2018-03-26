/*
 * follow JOVE protocol for growing and staining colonies
 * take photos with dissecting scope
 * use photoshop to align two halves of photo
 * (this works good enough although not perfect..)
 * (you could also think about using 24 well plates)
 * open aligned tiffs in fiji and run this script:
 */

run("16-bit");
run("Subtract Background...", "rolling=5 light");
run("Enhance Contrast...", "saturated=0.3");

/* then perform following by hand:
 *  makeOval(X1, Y1, X2, Y2); (outline well)
 *  run("Make Inverse"); (invert selection)
 *  run("Clear", "slice"); (delete outside of well)
 *  deselect selection by clicking in center of well
 *  run("Find Maxima...", "noise=15 output=[Point Selection] light");
 */

 /* 
  *  roiManager("Add");
  *  make a blank image big enough for all data points
  *  click show all
  *  set measurements to just one thing
  *  click more>multimeasure
  *  save as csv
  *  analyze data in python using 20170224 Soft Agar Data Visualization.ipynb
  */
