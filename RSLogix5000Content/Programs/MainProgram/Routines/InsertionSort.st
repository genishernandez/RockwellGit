/* This is a sample insertion sort done in structured text
pass this routine the array size to sort (Array_Size) and it will sort
the array numbers (numbers[x]) 

Use caution when executing sort routines on your contorl system.  
1000 dints take around 400 ms of processing time (5555 controller) to sort with this routine.
Make sure your process is not at some time critical point when sorting large amounts of data*/

For I := 1 to Array_Size - 1 Do //outer loop
	Temp := numbers[I];
	for J := I to 1 by -1 Do  //inner looop
		if (numbers [J - 1] > Temp) then  //check for sort condition
			numbers[J] := numbers [J-1]; //switch positions in array if condition is met
		else
			exit;
		end_if;
	end_for;
	numbers[J] :=Temp;  //return temp to numbers[j]
end_for;
