0: instruction <= 16'h0000; //
1: instruction <= 16'h0110; // pc -> gpr0
2: instruction <= 16'h0111; // pc -> gpr1

3: instruction <= 16'h0000; //
4: instruction <= 16'h0000; //
5: instruction <= 16'h0000; //
6: instruction <= 16'h0000; //
7: instruction <= 16'h0000; //
8: instruction <= 16'h0112; // pc -> gpr2
9: instruction <= 16'h1262; // gpr2 -> add0
10: instruction <= 16'h1263; // gpr2 -> add1
11: instruction <= 16'h6212; // add -> gpr2

12: instruction <= 16'h1030; // gpr0 -> display
13: instruction <= 16'h1062; // gpr0 -> add0
14: instruction <= 16'h1130; // gpr1 -> display
15: instruction <= 16'h1163; // gpr1 -> add1
16: instruction <= 16'h6230; // add -> display

17: instruction <= 16'h3062; // display -> add0
18: instruction <= 16'h6230; // add -> display

19: instruction <= 16'h3063; // display -> add1
20: instruction <= 16'h6230; // add -> display

21: instruction <= 16'h1201; // gpr2 -> pc
