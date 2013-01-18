set PROD;  # products 

param rate {PROD} > 0;  # tons produced per hour
param avail >= 0;       # hours available in the week

param profit {PROD};    # profit per ton
param market {PROD};    # limit on tons sold in week

var Make {p in PROD} >= 0, <= market[p];  # tons produced

maximize Total_profit: sum {p in PROD} profit[p] * Make[p];

subject to Time: sum {p in PROD} (1/rate[p]) * Make[p] <= avail;

