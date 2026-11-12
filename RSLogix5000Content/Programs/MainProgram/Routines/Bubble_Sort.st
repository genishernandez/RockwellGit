 /* This is a sample bubble sort done in structured text
pass this routine the array size to sort (SOE_StoreIndex) and it will sort
the array SOE_Fifo_ExtractData. 

Use caution when executing sort routines on your contorl system.  
1000 dints take around 500 ms of processing time (5555 controller) to sort with this routine.
Make sure your process is not at some time critical point when sorting large amounts of data

Note at this time this routine does not properly handle the CST rolloever to a negative number....when bit
32 of the CST turns on as the clock increments, there may some cases where sorting would be wrong because a 
negative CST is sorted against a positive CST when in reality the negative CST is a later time.  See the ladder version
of this sort for how to inspect bit .31 of CST*/ 


  
  //move the data into a UDT that we will sort
 COP(SOE_Fifo_ExtractData[0],SOE_Fifo_ExtractData_sorted[0],SOE_StoreIndex) ;



for Sort_I := 0 to (SOE_StoreIndex-2)  do;  // Bubble sort always goes from I= 0 to (max-1), but our index is actually one higher than the last element in the array so -2
	for Sort_J := 0 to (SOE_StoreIndex-2 - Sort_I) do;
		


			//check if uppper 32 bit's are different... if so, copy
			if ( SOE_Fifo_ExtractData_sorted[(Sort_J+1)].CSTTimeStamp[1] < SOE_Fifo_ExtractData_sorted[(Sort_J)].CSTTimeStamp[1] ) then
				    //copy to temp
					cop(SOE_Fifo_ExtractData_sorted[(Sort_J)], SOE_Fifo_ExtractData_temp, 1);

					//copy j+ 1 to j
					cop (SOE_Fifo_ExtractData_sorted[(Sort_J+1)], SOE_Fifo_ExtractData_sorted[(Sort_J)], 1);
	

					//copy  temp to j+1
					cop(SOE_Fifo_ExtractData_temp,SOE_Fifo_ExtractData_sorted[(Sort_J+1)], 1);

				//check if lower 32 bit's are different....if so, copy
				else if ( SOE_Fifo_ExtractData_sorted[(Sort_J+1)].CSTTimeStamp[0] < SOE_Fifo_ExtractData_sorted[(Sort_J)].CSTTimeStamp[0] ) then
				    	//copy to temp
						cop(SOE_Fifo_ExtractData_sorted[(Sort_J)], SOE_Fifo_ExtractData_temp, 1);
			
						
						//copy j+ 1 to j
						cop (SOE_Fifo_ExtractData_sorted[(Sort_J+1)], SOE_Fifo_ExtractData_sorted[(Sort_J)], 1);
	

						//copy  temp to j+1
						cop(SOE_Fifo_ExtractData_temp,SOE_Fifo_ExtractData_sorted[(Sort_J+1)], 1);

				end_if;
			end_if;
	
	end_for;
end_for;
