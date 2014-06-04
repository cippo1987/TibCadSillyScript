#!/bin/bash  

for Nt in 1e15  5e15          # Nt is the variable name, after "in" are the values that have to be assigned to Nt
do                            # starts the cycle of the variable values
        for Et in 0.0 0.05    # Et is another variable, even in this case 2 different values are tried
        do 

cat > bulk2.tib  <<!          # This comand write the bulk2.tib file. It inclues everything between the two "!" 
Nt = $Nt                      # The dollar sign calls the value of the "Nt" variable
Et = $Et 
!
cat bulk1.tib bulk2.tib bulk3.tib > bulk.tib     # It is possible to write the whole .tib file in the previous comand, Otherwhise it is possible to split the file in different parts, modify one of those, and the put all the parts togheter with cat.
tibercad bulk.tib                                # Launches tibercad
mv  output_m output_${Et}_${Nt}                  # rename the output folder (output_m) with an unique name determinated by the parameters we chose. the "${VAR}" comand is used to assing the value to a variable to a file name
mkdir ${Nt}_mob66_m15                            # this comand create a nother folder to collect all the results with the same variable value
mv output_${Et}_${Nt}  ./${Nt}_mob66_m15/.  # moves the files in this folder.

done                          # closes the cycle
done
