# model for ftfp

param m;
param n;
param f {1..m};
param d {1..m, 1..n};
param r {1..n};

var x {1..m, 1..n} >= 0;
var y {1..m} >= 0;

minimize Cost: sum {i in 1..m} f[i] * y[i] + sum {i in 1..m, j in 1..n} d[i,j] * x[i,j];
subject to fac {i in 1..m, j in 1..n}: y[i] >= x[i,j];
subject to demand {j in 1..n}: sum {i in 1..m} x[i,j] >= r[j];
