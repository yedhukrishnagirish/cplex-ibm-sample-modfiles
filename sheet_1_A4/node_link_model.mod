/*********************************************
 * OPL 22.1.0.0 Model
 * Author: yedhukrishna
 * Creation Date: May 16, 2022 at 11:32:10 AM
 *********************************************/

 
{string} LOCATIONS = ...;

int P = ...;
int N = ...;

float connection_cost[1..N][1..N] = ...;
int opening_cost[1..N] = ...;
int capacity[1..N] = ...;

dvar boolean u_ij[1..N][1..N];
dvar boolean r_j[1..N];

minimize
  sum( i in 1..N) 
  	sum(j in 1..N)
      (connection_cost[i][j] * u_ij[i][j]) + sum(j in 1..N)(opening_cost[j] * r_j[j]);
   
subject to {
  forall( j in 1..N ) 
     sum( i in 1..N) 
        (u_ij[i][j] - (P - 1)*r_j[i]) >= 1;
  
  forall( j in 1..N ) 
     sum( i in 1..N) 
        (u_ij[i][j] - (capacity[i]+ P- 2)*r_j[i]) <= 1;      

  
  forall( i in 1..N ) 
      sum( j in i..N ) 
        (u_ij[i][j]) == N+P*(P-1)/2;    
        
  forall(i in 1..N)
 	 sum(j in 1..N)
      (r_j[j]) == P; 
  
  
  forall(j in 1..N)
    sum(i in 1..N)
     (u_ij[i][i]) == P;                    

}