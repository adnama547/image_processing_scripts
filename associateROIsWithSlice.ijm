count=roiManager("count");
print(count)

for (i=0; i<count; i++) {
	print(i);
    roiManager("Select", i);
    Stack.setPosition(0, i+1, 0);
    roiManager("Update"); 
   }

