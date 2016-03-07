#Homework 5

#1. Create the vectors:
a <- c(1:20) #Concatenate numbers into vector 1-20 by 1. Returns 1 vector assigned to a
b <- c(20:1) #Concatenate numbers into vector 20-1 by 1. Returns 1 vector assigned to b
c <- c(a,b[2:20]) #Concatenate a (vector of 1-20) and b[2:20] (vector index 2 thru 20, which is 19-1) into one vector. Returns a vector
tmp <- c(4,6,3)  #Assigns vector (4,6,3) to variable tmp.  

?rep  #Seeking help for rep function before using

e <-rep(tmp,10) #replicate entire tmp vector 10 times. Returns 1 vector assigned to e
f <-c(rep(tmp,10),tmp[1]) #concatenate replicate tmp vector 10 times with an extra 4 (first term of vector tmp). Returns 1 vector assigned to f
g <-c(rep(tmp[1],10), rep(tmp[2],20), rep(tmp[3],30)) #concatenate tmp index position 1 replicated 10 times 
                                                      #     with tmp index position 2 replicated 20 times 
                                                      #     with tmp index position 3 replicated 30 times. Returns 1 vector assigned to g.

#2. Create a vector of the values of exp(x)*cos(x)) at x=3,3.1,3.2,...,5.9,6.
h <- exp(seq(3, 6, by=0.1))*cos(seq(3, 6, by=0.1))  #e^x * cos(x), where x is a sequence (vector) of numbers from 3 to 6 increaseing by 0.1. 
                                                    #Each index position is the output of the above equation using the corresponding indexed position of the sequence above.  
                                                    #Returns 1 vector assigned to h.
#3 Create the following vectors:
i <- 0.1^c((1:12)*3) * 0.2^seq(1, 34, by=3) #0.1 is raised to a vector of number sequence 3-36 by 3 and 0.2 is raise to a vector of number sequence 1-34.      
                                            #Returns 1 vector (assigned to i) where each index position is the output of the above equation using the corresponding indexed position of each sequence above.  
j <- 2^c(1:25) / c(1:25) #Numerator: 2 raised to vector (concatenated numbers 1-25 by 1). Denominator: concatenated numbers 1-25. 
                         #Returns 1 vector (assign to j) where each index position is the equation output using the corresponding index values of the two vectors described.

#4 Calculate the following:
k <- sum(c(10:100)^3 + 4*c(10:100)^2) #The same vector raised to two different exponents (where each indexed value is raised to corresponding exponent). Each indexed value of the 2nd vector is multiplied by 4. All terms of both resultant vectors are summed. Returns 1 scalar assigned to k.
l <- sum((2^c(1:25)/c(1:25)) + ((3^c(1:25))/(c(1:25)^2))) #Sum of expression where i is replaced with concatenated vector 1-25 by 1. Each indexed value is used to evaluate the expression to return a vector of outputs. The ouputs are summed and return a scalar assigned to l.

#5 Use the function paste to create the following character 
#    vectors of length 30:
m <- paste("label",c(1:30)) #Pastes objects that are converted to character vectors. Returns 1 vector (assigned to m) in which each indexed character is the string "label" (with a space in between by default) and the corresponding indexed value of vector 1-30 by 1. 
n <- paste("fn", c(1:30), sep="") #Returns 1 vector (assigned to n) in which each indexed character is the string "fn" (with no space as defined by separation parameter) and the corresponding index value of vector 1-30.

#6 Execute the following lines which create two vectors of
#    random integers which are chosen with replacement from
#    the integers 0, 1, . . . , 999. Both vectors have length 250.

set.seed(50) #Set seed for first term of random sample algorithm.
xVec <- sample(0:999, 250, replace=T) #xVec 250 term vector with values between 1-999, chosen with replacement.
yVec <- sample(0:999, 250, replace=T) #yVec 250 term vector with values between 1-999, chosen with replacement.

#Suppose x = (x1,x2,...,xn) denotes the vector xVec 
#    and y = (y1,y2,...,yn) denotes the vector yVec.

o <- yVec[2:length(yVec)] - xVec[1:length(xVec)-1] #Returns 1 vector (assigned to o) where each term is the difference between corresponding index values of subsets of xVec and yVec vectors. Next indexed term substraction where yVec index 2 to end is used and xVec index 1 to 1 before the end is used.
p <- sin(yVec[1:length(yVec)-1])/cos(xVec[2:length(xVec)]) #Returns 1 vector (assigned to p) where each term is the quotient between corresponding index values of subsets of xVec and yVec. Next indexed term division where yVec index 1 to 1 from the end is used and xVec index 2 to the end is used.
q <- xVec[1:{length(xVec)-2}] + 2*xVec[2:{length(xVec)-1}] - xVec[3:length(xVec)] #Returns 1 vector (assigned to q) that is the sum of corresponding indexed values for x2 to x_n-2 (vector from 2 to 2 before end of xVec), x1 to 2*x_n-1 (vector from 1 to 1 before end of xVec), x3 to x_n (3 to end of xVec).
                                                                                  #Note that for all index ranges where both terms are not at the beginning and end of the vector, braces are used to complete computation to return an integer value for use.  
r <- sum(exp(-1*xVec[{1+1}:length(xVec)])/(xVec[1:length(xVec)-1])+10) #Returns scalar (assigned to r) that sums the individual outputs based on the each indexed value. For xi+1, the vector is defined by 2 (1+1) and length of xVec (n = n-1+1). For xi, the vector is defined by 1 to length xVec -1   

#7 Using xVec and yVec from #6:
s <- yVec[yVec > 600] #Returns vector (assigned to s) with all instances of yVec that are greater than 600.
## Prof G: Not sure why you sorted this. Order the values but not the indecies.
t <- order(s, decreasing=TRUE) #Using s (above), order function orders values in decreasing (max to min) and then returns vector (assigned to t) of the index positions (per yVec). 
u <- xVec[t]  #Using vector of index positions corresponding to those numbers >600, u stores a vector of xVec values with those index positions.
v <- sqrt(abs(xVec-mean(xVec))) #v stores vector of square root of absolute value of expression: xi (corresponding indexed position of xVec) - mean of xVec (scalar)
w <- length( yVec[yVec >= {sort(yVec, decreasing = TRUE)}[1] -200] ) #Finds length of a the vector where yVec is greater than/equal to (accounts for within 200) the max (found by sorting all numbers in yVec in decreasing order and taking first indexed value) minus 200.
                                                                     #Note: Braces used to sort and find max yVec value.
x <- length( xVec[xVec %% 2 == 0]) #Returns length of vector (assigned to x) in which each indexed term has remainder of 0 when divided by 2. 
y <- xVec[order(yVec)]  #Returns vector (assigned to y) reorganizing all xVec instances in the order of increasing values of yVec.
z <- yVec[seq(1,250, by=3)] #Returns vector (assigned to z) that picks out values in the indexed positions defined by sequence between 1 and 250 by 3s.

#8 By using the function cumprod or otherwise, calculate:
aa <- 1 + sum(cumprod(seq(2,38,by=2))/cumprod(seq(3,39,by=2))) #The numerator is vector of cumulative product of even numbers between 2 and 38 (defined by sequence function).
                                                               #The denominator is vector of cumulative product of odd numbers between 3 and 39 (defined by sequence function)
                                                               #After 1, each term is the quotient of the corresponding indexed term of the numerator and denominator products, returning a vector of quotients 
                                                               #Returns a scalar (assigned to aa) that sums 1 and the each quotient.


