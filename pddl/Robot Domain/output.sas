begin_variables
25
var0 2 -1
var1 2 -1
var2 2 -1
var3 2 -1
var4 2 -1
var5 2 -1
var6 2 -1
var7 2 -1
var8 2 -1
var9 2 -1
var10 2 -1
var11 2 -1
var12 2 -1
var13 2 -1
var14 2 -1
var15 2 -1
var16 2 -1
var17 2 -1
var18 2 -1
var19 2 -1
var20 2 -1
var21 -1 -1
var22 -1 -1
var23 -1 -1
var24 -1 -1
end_variables
begin_oplinits
0
end_oplinits
begin_objects
8
robot robot1
robot robot2
machine machine1
machine machine2
machine machine3
location l1
location l2
location l3
end_objects
begin_pddl_translation
21
at 2 machine1 l1 0 0
at 2 machine2 l2 1 0
at 2 machine3 l3 2 0
at 2 robot1 l1 3 0
at 2 robot1 l2 4 0
at 2 robot1 l3 5 0
at 2 robot2 l1 6 0
at 2 robot2 l2 7 0
at 2 robot2 l3 8 0
busy 1 robot1 9 0
busy 1 robot2 10 0
gripper-free 1 robot1 11 0
gripper-free 1 robot2 12 0
loading-tray-free 1 machine1 13 0
loading-tray-free 1 machine2 14 0
loading-tray-free 1 machine3 15 0
occupied 1 l1 16 0
occupied 1 l2 17 0
occupied 1 l3 18 0
output-available 1 machine1 19 0
output-available 1 machine2 20 0
6
drive-time 2 l1 l2 22
drive-time 2 l1 l3 23
drive-time 2 l2 l1 22
drive-time 2 l2 l3 24
drive-time 2 l3 l1 23
drive-time 2 l3 l2 24
end_pddl_translation
begin_constant_facts
0
6
drive-time 2 l1 l2 406.300000
drive-time 2 l1 l3 73.100000
drive-time 2 l2 l1 406.300000
drive-time 2 l2 l3 356.800000
drive-time 2 l3 l1 73.100000
drive-time 2 l3 l2 356.800000
end_constant_facts
begin_modules
0
0
0
0
0
0
0
end_modules
begin_state
0
0
0
1
1
0
0
1
1
1
1
0
0
0
0
0
0
1
0
0
0
1.0
406.3
73.1
356.8
end_state
begin_goal
2
3 0
8 0
end_goal
22
begin_operator
load-machine robot1 machine1 l1
0
= 21
4
0 0
3 0
11 1
13 0
1
3 0
0
1
0 0 0 9 1 0
3
0 0 1 9 0 9 0 1
0 0 0 11 -1 0
0 0 1 13 0 13 -1 1
end_operator
begin_operator
load-machine robot1 machine2 l2
0
= 21
4
1 0
11 1
4 0
14 0
1
4 0
0
1
0 0 0 9 1 0
3
0 0 1 9 0 9 0 1
0 0 0 11 -1 0
0 0 1 14 0 14 -1 1
end_operator
begin_operator
load-machine robot1 machine3 l3
0
= 21
4
2 0
11 1
5 0
15 0
1
5 0
0
1
0 0 0 9 1 0
3
0 0 1 9 0 9 0 1
0 0 0 11 -1 0
0 0 1 15 0 15 -1 1
end_operator
begin_operator
load-machine robot2 machine1 l1
0
= 21
4
0 0
12 1
13 0
6 0
1
6 0
0
1
0 0 0 10 1 0
3
0 0 1 10 0 10 0 1
0 0 0 12 -1 0
0 0 1 13 0 13 -1 1
end_operator
begin_operator
load-machine robot2 machine2 l2
0
= 21
4
1 0
12 1
14 0
7 0
1
7 0
0
1
0 0 0 10 1 0
3
0 0 1 10 0 10 0 1
0 0 0 12 -1 0
0 0 1 14 0 14 -1 1
end_operator
begin_operator
load-machine robot2 machine3 l3
0
= 21
4
8 0
2 0
12 1
15 0
1
8 0
0
1
0 0 0 10 1 0
3
0 0 1 10 0 10 0 1
0 0 0 12 -1 0
0 0 1 15 0 15 -1 1
end_operator
begin_operator
move robot1 l1 l2
0
= 22
1
3 0
0
0
2
0 0 0 16 -1 1
0 0 0 9 1 0
3
0 0 0 17 1 0
0 0 0 4 -1 0
0 0 1 9 0 9 0 1
end_operator
begin_operator
move robot1 l1 l3
0
= 23
1
3 0
0
0
2
0 0 0 16 -1 1
0 0 0 9 1 0
3
0 0 1 9 0 9 0 1
0 0 0 18 1 0
0 0 0 5 -1 0
end_operator
begin_operator
move robot1 l2 l1
0
= 22
1
4 0
0
0
2
0 0 0 9 1 0
0 0 0 17 -1 1
3
0 0 0 16 1 0
0 0 1 9 0 9 0 1
0 0 0 3 -1 0
end_operator
begin_operator
move robot1 l2 l3
0
= 24
1
4 0
0
0
2
0 0 0 9 1 0
0 0 0 17 -1 1
3
0 0 1 9 0 9 0 1
0 0 0 18 1 0
0 0 0 5 -1 0
end_operator
begin_operator
move robot1 l3 l1
0
= 23
1
5 0
0
0
2
0 0 0 9 1 0
0 0 0 18 -1 1
3
0 0 0 16 1 0
0 0 1 9 0 9 0 1
0 0 0 3 -1 0
end_operator
begin_operator
move robot1 l3 l2
0
= 24
1
5 0
0
0
2
0 0 0 9 1 0
0 0 0 18 -1 1
3
0 0 0 17 1 0
0 0 0 4 -1 0
0 0 1 9 0 9 0 1
end_operator
begin_operator
move robot2 l1 l2
0
= 22
1
6 0
0
0
2
0 0 0 16 -1 1
0 0 0 10 1 0
3
0 0 0 17 1 0
0 0 1 10 0 10 0 1
0 0 0 7 -1 0
end_operator
begin_operator
move robot2 l1 l3
0
= 23
1
6 0
0
0
2
0 0 0 16 -1 1
0 0 0 10 1 0
3
0 0 0 8 -1 0
0 0 0 18 1 0
0 0 1 10 0 10 0 1
end_operator
begin_operator
move robot2 l2 l1
0
= 22
1
7 0
0
0
2
0 0 0 17 -1 1
0 0 0 10 1 0
3
0 0 0 16 1 0
0 0 1 10 0 10 0 1
0 0 0 6 -1 0
end_operator
begin_operator
move robot2 l2 l3
0
= 24
1
7 0
0
0
2
0 0 0 17 -1 1
0 0 0 10 1 0
3
0 0 0 8 -1 0
0 0 0 18 1 0
0 0 1 10 0 10 0 1
end_operator
begin_operator
move robot2 l3 l1
0
= 23
1
8 0
0
0
2
0 0 0 10 1 0
0 0 0 18 -1 1
3
0 0 0 16 1 0
0 0 1 10 0 10 0 1
0 0 0 6 -1 0
end_operator
begin_operator
move robot2 l3 l2
0
= 24
1
8 0
0
0
2
0 0 0 10 1 0
0 0 0 18 -1 1
3
0 0 0 17 1 0
0 0 1 10 0 10 0 1
0 0 0 7 -1 0
end_operator
begin_operator
unload-machine robot1 machine1 l1
0
= 21
4
0 0
3 0
11 0
19 0
1
3 0
0
1
0 0 0 9 1 0
3
0 0 1 19 0 19 -1 1
0 0 1 9 0 9 0 1
0 0 1 11 0 11 -1 1
end_operator
begin_operator
unload-machine robot1 machine2 l2
0
= 21
4
1 0
11 0
4 0
20 0
1
4 0
0
1
0 0 0 9 1 0
3
0 0 1 9 0 9 0 1
0 0 1 11 0 11 -1 1
0 0 1 20 0 20 -1 1
end_operator
begin_operator
unload-machine robot2 machine1 l1
0
= 21
4
0 0
19 0
12 0
6 0
1
6 0
0
1
0 0 0 10 1 0
3
0 0 1 10 0 10 0 1
0 0 1 19 0 19 -1 1
0 0 1 12 0 12 -1 1
end_operator
begin_operator
unload-machine robot2 machine2 l2
0
= 21
4
1 0
12 0
20 0
7 0
1
7 0
0
1
0 0 0 10 1 0
3
0 0 1 20 0 20 -1 1
0 0 1 10 0 10 0 1
0 0 1 12 0 12 -1 1
end_operator
0
0
0
