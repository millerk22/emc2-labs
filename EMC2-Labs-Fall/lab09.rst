Lab 9: Solving Systems of Linear Equations
==========================================


In this lab you will learn how to construct 2 functions which implement iterative algorithms for solving systems of linear equations. 
You will also learn how to solve these systems according to a tolerance level. 
You will need to import Numpy using the following command:

>>> import numpy as np

We often deal with systems of equations of the form :math:`Ax=b`. 
As you know when given equations like this we solve for :math:`x`.
Using methods such as Gaussian elimination can give us the exact the solution for :math:`x`.
While you can easily do this for matrices that are 2x2, 3x3, etc, it becomes more and more difficult as the dimensions increase.
This same logic follows for using computers. 
While it may be easy for them to put small matrices in reduced row echelon form.
As these matrices approach millions of rows and columns, it becomes computationally costly, and impossible in some cases.

Hence, in these scenarios we use iterative methods to solve for :math:`x`.
Iterative methods involve using intial values to generate a sequence of improving approximate solutions. 
Each of these approximatations is called an iterate.
Take some arbitrary vector :math:`x^i`. 
When we plug this vector into an iterative method, we obtain a better estimate for :math:`x` called :math:`x^{i+1}`.
The reason we use these iterative methods is because they are often straight forward equations that can be calculated easily. 
You will see 2 of types of iterative methods used for solving systems of linear equations. 

.. note::
    When we use the notation :math:`x^i`, we are refering to the ith iterate, not a power. 

Jacobi's method
---------------

The first method we will learn about is Jacobi's method. We let :math:`Ax=b` be a system of :math:`n` linear equations. 
So we let

.. math::

    A = \begin{bmatrix}
    a_{11} & a_{12} & \cdots & a_{1n} \\
    a_{21} & a_{22} & \cdots & a_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    a_{n1} & a_{n2} & \cdots & a_{nn}
    \end{bmatrix}, \quad
    \mathbf{x} = \begin{bmatrix}
    x_1 \\
    x_2 \\
    \vdots \\
    x_n
    \end{bmatrix}, \quad
    \mathbf{b} = \begin{bmatrix}
    b_1 \\
    b_2 \\
    \vdots \\
    b_n
    \end{bmatrix}

We split the matrix into 3 distinct parts 

.. math::

    A = D + L + U \quad \text{where} \quad
    D = \begin{bmatrix}
    a_{11} & 0 & \cdots & 0 \\
    0 & a_{22} & \cdots & 0 \\
    \vdots & \vdots & \ddots & \vdots \\
    0 & 0 & \cdots & a_{nn}
    \end{bmatrix}, \quad
    L + U = \begin{bmatrix}
    0 & a_{12} & \cdots & a_{1n} \\
    a_{21} & 0 & \cdots & a_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    a_{n1} & a_{n2} & \cdots & 0
    \end{bmatrix}

Then the formula used to get the next value of :math:`x` is 

.. math::

    x^{k+1} = D^{-1} ( \mathbf{b} - (L + U)x^{k} )

If we generalize this formula to a 2x2 matrix we get the formula

.. math::

    x^{k+1} =
    \left[
    \begin{array}{c}
    \frac{1}{a_{11}} (b_1 - a_{12} x_2^k) \\
    \frac{1}{a_{22}} (b_2 - a_{21} x_1^k)
    \end{array}
    \right]

.. Consider adding An example problem

Task 1
------

Write a function ``jacobi_iteration(x, A, b)`` which takes in an initial guess ``x`` (2d array), matrix ``A`` (2d), and array ``b`` (2d array), 
and returns :math:`x^{k+1}` using Jacobi's method. Remember all inputs and outputs should be ``np.array``\s.

Task 2
------

Write a function ``jacobi_method(x, A, b, n)`` which takes in an initial guess ``x`` (2d array), matrix ``A`` (2d), and array ``b`` (2d array), 
which performs the Jacobi method ``n`` times returning :math:`x^{n+1}`. All inputs and outputs should be ``np.array``\s.


Gauss-Seidel method
-------------------

.. Add comparison between Gauss-Seidel and Jacobi

The next method is the Gauss-Seidel method which works on the same :math:`Ax=b`.

For this method we split :math:`A` into 2 distinct parts

.. math::

    \mathbf{A} =
    \underbrace{
    \begin{bmatrix}
    a_{11} & 0      & \cdots & 0 \\
    a_{21} & a_{22} & \cdots & 0 \\
    \vdots & \vdots & \ddots & \vdots \\
    a_{n1} & a_{n2} & \cdots & a_{nn}
    \end{bmatrix}}_{\mathbf{L}} +
    \underbrace{
    \begin{bmatrix}
    0 & a_{12} & \cdots & a_{1n} \\
    0 & 0      & \cdots & a_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    0 & 0      & \cdots & 0
    \end{bmatrix}}_{\mathbf{U}}

Then the formula used to get the next value of :math:`x` is 

.. math::

    x^{k+1} = L^{-1} (b - Ux^k)

If we generalize this formula to a 2x2 matrix we get the formula

.. math:: 

    x^{k+1} = \left[ \begin{array}{cc}
    \frac{1}{a_{11}}(b_1 - a_{12}x_2^k) \\
    \frac{1}{a_{22}}(b_2 - a_{21}x_1^{k+1})
    \end{array} \right]

Notice how that the only difference between this method and Jacobi's method, is the :math:`x_1^{k+1}` used in the calculation of :math:`x_2^{k+1}`.
Unlike Jacobi's method, Gauss-Seidel uses updated values as soon as they are computed. 
This constitutes the biggest change between the 2 methods. 
The benifit of Jacobi's method is that it can run in parallel. For now all you need to know is that this means it can be quickly run on a GPU.
Gauss-Seidel's method often has a faster convergence and needs less iterations than Jacobi, and in some cases it even converges when the Jacobi cannot.

Task 3
------

Write a function ``gauss_seidel_iteration(x, A, b)`` which takes in an initial guess ``x`` (2d array), matrix ``A`` (2d), and array ``b`` (2d array), 
and returns :math:`x^{k+1}` using Gauss-Seidel's method. Remember that you muse compute the first value of :math:`x^{k+1}` first, in order to use it 
in computing the second value. All inputs and outputs should be ``np.array``\s.

Task 4
------

Write a function ``gauss_seidel_method(x, A, b, n)`` which takes in an initial guess ``x`` (2d array), matrix ``A`` (2d), and array ``b`` (2d array), 
which performs the Gauss-Seidel's method ``n`` times returning :math:`x^{n+1}`. All inputs and outputs should be ``np.array``\s.


Error and Convergence
---------------------

Like we stated previously iterative methods produce a sequence of numbers that are approaching the solution. 
We say that this sequence converging to the solution if the error between the true and approximate solution is decreasing. 
We define the error as the distance between the 2 vectors. 
You can calculate the distance bettwen 2 vectors by subtracting them from each other and taking the norm of this new vector.
In Numpy we can use the command ``np.linalg.norm``.

>>> u = np.array([5, 4])
>>> v = np.array([1, 1])
>>> u - v
np.array([3, 4])
>>> np.linalg.norm(u - v)
5

Task 5
------

Write a function called ``gauss_seidel_method(x, A, b, sol, tol)``. This function will take in 
an initial guess ``x`` (2d array), matrix ``A`` (2d), array ``b`` (2d array), solution ``sol`` (2d array), and a desired error level ``tol``.
You will need to modify ``gauss_seidel_method`` to perform iterations until the distance between the iterate and ``sol`` is less than or equal to the tolerance, and then returns the approximate solution.

Cases where convergence isn't reached
-------------------------------------

While these methods can be extremely effecitve, sometimes they will not converge. 
Fortunately, we are guaranteed convergence for matrices that are *strictly diagonally dominant*.
This applies to n x n matrices where the absolute value of the diagonal element of every row is greater than the sum of the absoulte values of all the other elements in the row, or

.. math::

    |a_{11}| > |a_{12}| + |a_{13}| + \cdots + |a_{1n}| \\
    |a_{22}| > |a_{21}| + |a_{23}| + \cdots + |a_{2n}| \\
    \vdots \\
    |a_{nn}| > |a_{n1}| + |a_{n2}| + \cdots + |a_{n(n-1)}|