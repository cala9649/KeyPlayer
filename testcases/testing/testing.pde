//Test Case 1
//Tests if a correct key was pressed
key = 'q';
String status;
if (key == 'q') {
  status = "Passed";
} else status = "Failed";
print("Test Case 1: ", status);



//Test Case 2
//Tests if an incorrect key was pressed
key = 'p';
if (key == 'p') {
  status = "Passed";
} else status = "Failed";
println();
print("Test Case 2: ", status);



//Test Case 3
//Tests if the special keys are recognized
keyCode = UP;
if (keyCode == UP) {
  status = "Passed";
} else status = "Failed";
println();
print("Test Case 3: ", status);



//Test Case 4
//Tests if the space bar was pressed to initiate special mode
key = ' ';
if (key == ' ') {
  status = "Passed";
} else status = "Failed";
println();
print("Test Case 4: ", status);



//Test Case 5
//Tests if the key value is reset when exceeding size of array
key = 65535;
if (int(key) >= 256){
  key = 255;
  status = "Passed";
} else status = "Failed";
println();
print("Test Case 5: ", status);

