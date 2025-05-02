Lab 11: Root Finding and Newton's Method
========================================

Solving equations is an important practical problem. Much of high school algebra is aimed at developing techniques for accomplishing this task. However, solving equations is hard.  Although there are some useful results like the quadratic formula and analogous formulas for solving cubic and quartic equations, it is a famous fact that no corresponding quintic formula can exist. Thus if we want to solve real problems, we will need efficient algorithms for approximating solutions to equations. 

This lab is by no means a thorough introduction to root-finding. Instead, it discusses two very simple ideas and explores their limitations. It is also designed to reinforce the ideas discussed in the text related to continuous and differentiable functions. 

Root-Finding by the IVT
-----------------------


If you were trying to find a solution to 
	
.. math::
	f(x):=x^5+2x^3-x-1=0,

and if you only had access to a scientific calculator, you might proceed as follows: 

Clearly :math:`f(0)<0` and :math:`f(1)>0`.  

Because :math:`f` is continuous, by the Intermediate Value Theorem (IVT), there exists some solution in the interval :math:`(0,1)=(a_0,b_0)`. Consider :math:`x_1=0.5` (the midpoint of :math:`[0,1]`). We find that :math:`f(0.5)=-1.21875`. Set :math:`a_1=0.5` and :math:`b_1=1`.  Then :math:`f(a_1) < 0` and :math:`f(b_1)>0`, so again by the IVT, there is some solution in :math:`[a_1,b_1]`.  

Repeat the process; at the :math:`n`-th step, the input to the process is the interval :math:`[a_{n-1}, b_{n-1}]` and :math:`f` is known to have opposite signs at the endpoints.  Let :math:`x_n` be the midpoint of the interval. Find :math:`f(x_n)`. If :math:`f(x_n)=0`, return :math:`x_n` as a root. If :math:`f(x_n) \neq 0`, either set :math:`a_n=a_{n-1}` and :math:`b_n=x_n` if :math:`f(a_{n-1})` and :math:`f(x_n)` have opposite sign or set :math:`a_n=x_n` and :math:`b_n=b_{n-1}` if :math:`f(x_n)` and :math:`f(b_{n-1})` have opposite sign.  

Unless the process terminates because an exact solution has been found, the process produces two sequences :math:`{a_n}` and :math:`{b_n}` that both converge to a solution of the equation, and we can stop the process when :math:`n` is large enough that :math:`b_n-a_n` is less than the degree of accuracy we desire in our approximation of the solution. 

Task 1
------

Write a function, ``ivt_ex(tol, maxiter)``, that solves ``-1 - x + 2 * x ** 3 + x ** 5 = 0`` in the domain ``(0, 1)`` within an error of ``tol`` (defaulting to ``1e-8``) using a maximum of ``maxiter`` iterations (defaulting to ``100``). Return both the root and whether your code met the error condition within ``maxiter`` iterations. The error condition is met when you find a value of ``x`` where ``|-1 - x + 2 * x ** 3 + x ** 5| < tol``.
    
Task 2a
-------

Write a function ``make_poly(coef_list)`` that takes a list of coefficients in increasing degree-order as an input and returns a function for the polynomial defined by those coefficients.

Task 2b
-------

Write a function ``find_interval(f)`` which takes a function, ``f`` as input and returns a tuple, ``(a, b)``, representing an interval, ``[a, b]``, on which the polynomial changes sign (meaning that ``f(a)<0<f(b)`` or ``f(a)>0>f(b)``. Do not worry about checking for functions that do not change sign globally as we will guarantee that all inputs to this function will do so in a later exercise.

To help you think about how to find such an interval, try the following: fix an initial value for ``M`` (e.g. ``M=1``) and test the endpoints of the interval ``[-M,M]``. If :math:`f` changes sign, you're done. If not, replace ``M`` with ``2*M`` and repeat. 

Task 2c
-------

Every polynomial of odd degree has at least one real root. (Why?)
Adapt your code from Task 1, using your code from Tasks 2a and 2b, to write a function, ``ivt_poly(coef_list, tol, maxiter)``, that finds a root of the polynomial defined by ``coef_list`` within an error of ``tol`` (defaulting to ``1e-8``) using a maximum of ``maxiter`` iterations (defaulting to ``100``). Return both the root and whether your code met the error condition within maxiter iterations.


To test your code:

1. The real roots of :math:`1-2 x+3 x^2-4 x^3-5x^4+6x^5` are approximately :math:`-0.963448, 0.545323, 1.15814`
2. The real roots of :math:`-0.1 - x + 1000 x^2 + 10000 x^3 + 0.1 x^4 + x^5` are approximately :math:`-0.1, -0.01, 0.01`


.. Here are some hints and suggestions:

.. 1. An easy way to format your coefficient list is to let :math:`\texttt{coef_list} = [a_0, a_1, a_2, ..., a_n]` when the desired polynomial is
   
..    .. math::
.. 	f(x) = a_0 + a_1 x + a_2 x^2 + \dots + a_n x^n. 

..    For example, the list :math:`[-1,0,0,1]` corresponds to the polynomial :math:`-1+0x+0x^2+x^3` or equivalently :math:`x^3 - 1`. 
    
.. 2. You might consider writing an auxiliary function with parameters ``coef_list`` and some value :math:`x` that will compute :math:`f(x)` so that your main function can be as tidy as possible.
    
.. 3. Have your program return an error if the coefficient list has an odd number of entries and therefore does not correspond to an odd-degree polynomial. If you want your program to be as robust as possible, you may want to check that your user is not trying to input a list such as :math:`[1,1,1,0]`, which actually corresponds to an even-degree polynomial despite having an odd number of entries. (Note that the coefficient on :math:`x^3` is :math:`0`). However, this is not required.
    
.. 4. To help you think about how to find an initial interval :math:`[a_0,b_0]` on which the polynomial :math:`f` changes sign, try the following: fix an initial value for ``M`` (e.g. ``M=1``) and test the endpoints of the interval ``[-M,M]``. If :math:`f` changes sign, you're done. If not, replace ``M`` with ``2*M`` and repeat. 

.. Let :math:`f(x)=a_0+a_1x+... +a_nx^n` and suppose that :math:`a_n >0`.  Find an :math:`M>1` with the property that for all :math:`x>M`, :math:`f(x) \geq (a_n x^n)/2`.  Lots of values of :math:`M` are possible.  Rather than try to make :math:`M` as small as possible, try to make the expression for :math:`M` as simple as possible. 




Newton's Method
---------------

The idea of Newton's method is simple: Suppose :math:`f` is differentiable and suppose we want to solve :math:`f(x)=0`. Start with a "guess" :math:`x_0` for the solution. Form the tangent line approximation to the graph of :math:`y=f(x)` at :math:`(x_0,f(x_0))`.  Then our improved guess for the solution is the :math:`x`-intercept of the tangent line, which we call :math:`x_1`.  Repeat this process so that the input at step :math:`n` is the output :math:`x_{n-1}` from the previous step and the output is :math:`x_n`, the :math:`x`-intercept of the tangent line to the graph of :math:`y=f(x)` at :math:`(x_{n-1}, f(x_{n-1}))`. 


Task 3
------

Write a function, ``newton(f, df, x0, tol, maxiter)``, that a takes a differentiable function, ``f``, its derivative, ``df``, an initial guess, ``x0``, an error condition, ``tol`` (defaulting to ``1e-8``), and a maximum number of iterations, ``maxiter``, as inputs and uses Newton's method to approximate the solution to ``f(x) = 0`` within an error of ``tol`` using a maximum of ``maxiter`` iterations. Return both the solution and whether it met the error condition with ``maxiter`` iterations. You will need to do some algebra to write a recursive formula for :math:`x_{n + 1}` in terms of :math:`x_{n}`. 
    

There is a solution to :math:`\sin(x^2)+x^2-x-1=0` between :math:`-1` and :math:`0`.  Use Newton's method to find it. 
    
    
Task 4
------
    
When an equation has multiple solutions, which one Newton's method finds depends on the choice of :math:`x_0`. 
Consider :math:`x^3+0.1x^2-x-0.2=0`. Make a graph. (Revisit :doc:`lab02` if you need a refresher on how to do this.) How many solutions do you see? Find initial conditions that work to find each solution and obtain approximations to these solutions. Are there any initial conditions that will not work to find any solution?  


