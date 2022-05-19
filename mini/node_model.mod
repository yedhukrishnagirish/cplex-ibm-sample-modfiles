
/*********************************************
 * OPL 22.1.0.0 Model
 * Author: yedhukrishna
 * Creation Date: May 16, 2022 at 1:23:03 PM
 *********************************************/


 
{string} LOCATIONS = ...;
{string} AREAS = ...;

int A=...;
int N=...;

float connection_cost[1..A][1..N] = ...;
int opening_cost[1..N] = ...;
int capacity[1..N] = ...;


dvar boolean u_ij[1..A][1..N];
dvar boolean r_j[1..N];

minimize
  sum( i in 1..A ) 
    sum( j in 1..N)
      (connection_cost[i][j] * u_ij[i][j]) + sum(j in 1..N)(opening_cost[j] * r_j[j]);
   
subject to {
  forall( i in 1..A ) 
      sum( j in 1..N ) 
        (u_ij[i][j]) == 1;

  forall(j in 1..N)
    sum(i in 1..A )
      (u_ij[i][j]) <= capacity[j] * r_j[j];
}
 
 