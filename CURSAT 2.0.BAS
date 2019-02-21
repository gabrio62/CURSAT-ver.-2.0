tio1 CLEAR 30000
5 CLS: PRINT "CURSAT  ver 2.0  -  A program to calculate rarefaction curves": PRINT
6 PRINT "Gabriele Gentile, Department of Biology, University TOR VERGATA"
7 PRINT "Viale della Ricerca Scientifica, 1 - 00133, Rome, Italy"
8 PRINT "E-mail: gabriele.gentile@uniroma2.it"
9 PRINT: PRINT: PRINT
10 INPUT "How many columns"; NC
15 INPUT "How many rows"; ns
20 INPUT "How many repetitions"; nr
30 DIM D(ns - 1, NC - 1), nd(ns - 1, NC - 1), B(ns - 1, NC - 1)
31 w = 0: boot$ = "boot.out"
32 INPUT "Input filename"; inpu$
33 INPUT "Output filename"; file$
34 OPEN file$ FOR OUTPUT AS #1
35 OPEN boot$ FOR OUTPUT AS #2
36 PRINT #2, "CURSAT ver 2.0  ", "Date: ", DATE$, "  Hour: ", TIME$
37 PRINT #2, "Input file:  ", inpu$
38 PRINT #2, "Output file: ", file$
39 PRINT #2, "Number of columns: ", NC
40 PRINT #2, "Number of rows: ", ns
42 PRINT #2, "Number of repetitions: ", nr
44 FOR f = 1 TO nr
    45 LOCATE 18, 1
    46 PRINT "Bootstrapping......  "; f
    47 REDIM D(ns - 1, NC - 1), nd(ns - 1, NC - 1), B(ns - 1, NC - 1)
    48 REM input data
    49 OPEN inpu$ FOR INPUT AS #3
    50 FOR I = 0 TO ns - 1
        55 FOR j = 0 TO NC - 1
            60 INPUT #3, D(I, j)
    65 NEXT j, I
    66 CLOSE #3
    68 REM begin bootstrap
    69 FOR j = 0 TO NC - 1
        72 RANDOMIZE TIMER
        73 Q = INT(RND * NC)
        75 FOR I = 0 TO ns - 1
            76 nd(I, j) = D(I, Q)
    78 NEXT I, j
    80 FOR I = 0 TO ns - 1
        85 PRINT #2,
        90 FOR j = 0 TO NC - 1
            100 PRINT #2, nd(I, j);
    110 NEXT j, I
    115 REM writing matrix of sums by rows
    120 FOR I = 0 TO ns - 1
        125 FOR j = 0 TO NC - 1
            130 w = w + nd(I, j)
            135 IF w = 1 OR w > 1 THEN B(I, j) = 1
        140 NEXT j
        145 w = 0
    150 NEXT I
    155 REM writing matrix of sums by columns
    160 C = 0
    165 FOR j = 0 TO NC - 1
        170 FOR I = 0 TO ns - 1
            175 C = C + B(I, j)
            180 IF I = ns - 1 THEN PRINT #1, j + 1; C
            185 IF I = ns - 1 THEN C = 0
    200 NEXT I, j
    205 PRINT #2,
206 NEXT f
210 CLOSE #1: CLOSE #2
215 PRINT "Completed. Results written in "; file$
220 PRINT "Bootstrap data written in "; boot$
225 END


