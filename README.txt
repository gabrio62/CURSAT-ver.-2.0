# CURSAT-ver.-2.0
A program to calculate saturation curves by boostrap

This software is useful to address questions such as:
"how many sampling events are necessary to maximize the chance to sample all species that occur at a certain location?" or "how many
sampling events are necessary to collect a representative sample of the species that occur at a certain location?"

Let's consider the following case: we know that 12 species occur at a certain location. We sampled that location 10 times and each time
we found a certain number of species, according to the scheme here below. In the 12x10 matrix, species are a-k and sampling events are
1-10.
Presence and absence of each species in each sampling event is represented by 1 and 0, respectively.


   1 2 3 4 5 6 7 8 9 10

a  1 0 1 1 0 0 0 1 1 0
b  1 1 0 0 0 0 1 1 0 0
c  0 0 0 1 0 1 1 0 1 1
d  0 0 0 0 1 0 1 0 1 0
e  0 0 1 1 0 0 0 1 0 0
f  1 1 0 0 1 0 0 1 0 1
g  0 0 1 1 1 0 0 0 1 0
h  1 1 0 1 0 0 1 1 0 1
i  1 0 0 0 1 1 0 1 0 1
j  0 0 1 1 0 0 1 0 1 0
k  0 0 1 1 0 1 0 1 0 1
k  1 1 1 0 0 0 1 1 0 0 


CURSAT ver. 2.0 requires that you prepare an input file in this way:

1 0 1 1 0 0 0 1 1 0
1 1 0 0 0 0 1 1 0 0
0 0 0 1 0 1 1 0 1 1
0 0 0 0 1 0 1 0 1 0
0 0 1 1 0 0 0 1 0 0
1 1 0 0 1 0 0 1 0 1
0 0 1 1 1 0 0 0 1 0
1 1 0 1 0 0 1 1 0 1
1 0 0 0 1 1 0 1 0 1
0 0 1 1 0 0 1 0 1 0
0 0 1 1 0 1 0 1 0 1
1 1 1 0 0 0 1 1 0 0

and save it as a text file.

Once you run it it will ask you how many columns (sampling events) you wish to consider (in this case 10).
Then, it will ask you to indicate the number of rows (species, in this case 12).
You will indicate how many bootstrap replicates you wish to create.
Last things you need to input are the names of the input and output files.
By default, bootstrap replicates are saved in "boot.out" and they will look like this:

"CURSAT ver 1.0              Date:         10-14-2017      Hour:       11:50:57
Input file:   test 10 sampling events x 12 species.txt
Output file:  test 10 sampling events x 12 species.out
Number of columns:           10 
Number of rows:              12 
Number of repetitions:       100 

 0  0  1  1  0  1  0  1  0  0 
 1  0  0  1  0  0  1  0  0  0 
 1  1  1  0  1  1  1  1  0  0 
 1  0  0  0  0  0  1  1  1  1 
 0  0  1  1  0  1  0  0  0  0 
 0  0  0  1  0  0  0  0  1  1 
 0  0  1  0  0  1  0  1  1  1 
 1  0  1  1  0  1  1  0  0  0 
 0  1  0  1  1  0  0  0  1  1 
 1  0  1  0  0  1  1  1  0  0 
 0  1  1  1  1  1  0  0  0  0 
 1  0  0  1  0  0  1  0  0  0 

 1  0  0  0  0  0  1  0  0  1 
 0  0  0  0  1  0  1  0  1  0 
 0  1  0  1  0  0  0  0  0  0 
 0  0  1  0  0  1  0  1  0  0 
 1  0  0  0  0  0  0  0  0  1 
 0  1  1  1  1  1  1  1  1  0 
 1  0  1  0  0  1  0  1  0  1 
 0  1  0  1  1  0  1  0  1  0 
 0  1  1  1  0  1  1  1  0  0 
 1  0  0  0  0  0  0  0  0  1 
 1  1  0  1  0  0  0  0  0  1 
 1  0  0  0  1  0  1  0  1  1 

 1  0  0  1  0  0  1  0  0  1 
 1  0  0  0  1  1  1  0  0  1 
 0  0  0  1  1  1  0  0  1  0 
 0  1  1  0  1  1  0  1  0  0 
 1  0  0  1  0  0  0  0  0  0 
 1  1  1  0  0  0  1  1  1  1 
 0  1  1  1  0  0  0  1  0  0 
 1  0  0  1  1  1  1  0  1  1 
 1  1  1  0  0  0  1  1  1  1 
 0  0  0  1  1  1  0  0  0  0 
 1  0  0  1  0  0  0  0  1  0 
 1  0  0  0  1  1  1  0  0  1 ......"
 
 The output file will look like this:
 
 1  6 
 2  8 
 3  11 
 4  12 
 5  12 
 6  12 
 7  12 
 8  12 
 9  12 
 10  12 
 1  6 
 2  10 
 3  11 
 4  11 
 5  12 
 6  12 
 7  12 
 8  12 
 9  12 
 10  12 
 1  8 
 2  10 
 3  10 
 4  12 
 5  12 
 6  12 
 7  12 
 8  12 
 9  12 
 10  12 
 1  5 
 2  10 
 3  10 
 4  10 
 5  10 
 6  10 
 7  11 
 8  11 
 9  11 
 10  12 ....
 
 You can import it in Excel  or other statistical package and create nice box-plot graphs like the one here attached, done using Statistica ver. 8 (StatSoft, Inc).
 
 The code is in the file CURSAT 2.0.BAS, also attached. It is written in basic qb64, freely downloadable at: http://www.qb64.net/.  Qb64 will compile the program in .EXE, that can run in Windows. For your convenience, I also attached a compiled version of the  program (CURSAT 2.0.EXE)








































