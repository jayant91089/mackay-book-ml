## **Below are several example usages of code in this repository and the plots generated using them (under construction) ** ##


Metropolis-Hastings Method
--------------------------

The following example recreates the Metropolis-Hastings method with target and sampler distributions in eqns (29.33) and (29.34). The main idea here is to explore the downsides of the random-walk behavior of this method. 
the function used here is $\texttt{metropolis_hastings}(\cdot)$ (see montecarlo_sampling directory) invoked as:  
 
    n=10000;
    [m,xvec] = metropolis_hastings(@pdist_metro,@qdist_metro_pdf,@qdist_metro_rnd,0,[],n);

It accepts handles to functions that allow us to evaluate target density and sampler density, along with a handle to function that can draw random numbers from the sampler density as input, making it open to more general sampler and target densities. The (top) plot below shows the samples $x^{(t)}$ for $t=1,\dots,10000$, while the bottom plot shows the shape of the empirical distribution after $t=100,500,1000,3000,5000,10000$ respectively. The thin vertical blue line gives the estimate of the expected value of the target distribution after the associated number of iterations of Metropolis-Hastings method. 

![Image of Yaktocat](https://rawgit.com/jayant91089/mackay-book-ml/master/montecarlo_sampling/foo.png)
 
 Note that in above example, the lengthscale of the target density, $L=20$, while the stepsize (standard deviation of the sampler) is $\epsilon = 1$, meaning that to travel from one end of the target density (in $x$ space) to the other end takes about $\left(\frac{L}{\epsilon}\right)^2=400$ iterations, meaning that Metropolis-Hastings method is slooooowwwwwwww.
