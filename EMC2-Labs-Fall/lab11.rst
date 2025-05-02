Lab 11: Inverting matrices
==========================


In this lab you will use Sympy Matrix objects to write a program that will invert a matrix. 
Note that Sympy Matrix objects behave a little differently than Numpy matrix objects.
You can import Sympy using the following command:

>>> import sympy as sp

Rows and entries of Sympy Matrix objects can be accessed in the following ways. 

>>> M=sp.Matrix([[1,2,3],[4,5,6]])
>>> M.row(1)
Matrix([[4, 5, 6]])
>>> M[1,0]
4
>>> M[4]
5

Notice that if you only use a single bracket index you get the entry as though the matrix were a single list, not the row!
The dimensions of the matrix can be accessed using the ``shape`` property in the same way you would for a Numpy matrix object. 
Remember, this is not a method so do not use parentheses.

>>> M.shape
(2,3)

You can learn more about the Sympy Matrix object by reading
`<https://docs.sympy.org/0.7.2/modules/matrices/matrices.html>`_
or the Acme introduction to Sympy in Chapter 10 of Python Essentials:
`<https://foundations-of-applied-mathematics.github.io/>`_.



Task 1
------



Write a function ``aug_id(A)`` that takes as input an ``m x n`` matrix object ``A`` and augments the matrix by the identity matrix. 
There is no built-in Sympy function to do this, so you will need to create a new matrix object of the appropriate size and edit its entries.


>>> A=sp.Matrix([[1,2],[3,4]])
>>> aug_id(A)
Matrix([
[ 1,  2, 1, 0],
[ 3,  4, 0, 1]])
>>> B=sp.Matrix([[0,2],[3,4],[5,6]])
>>> aug_id(B)
Matrix([
[ 0,  2, 1, 0, 0],
[ 3,  4, 0, 1, 0],
[ 5,  6, 0, 0, 1]])



Task 2
------


Write a function ``mat_inv(A)`` that takes as input an ``m x n`` matrix object ``A`` and returns a potential inverse.
Use the function from part one to augment the input matrix by the identity, then use the ``rref`` method (see below) to row reduce the augmented matrix. 
Your function should then extract the matrix consisting of the final ``n`` columns of the row-reduced matrix. 
If ``A`` is invertible, this will be the inverse. 
Your function should still return a matrix even if the input matrix was not invertible.

Sympy Matrix objects have a built-in method ``rref`` that returns the matrix in reduced echelon form.

>>> A=sp.Matrix([[1,2],[3,4]])
>>> aug_id(A).rref()
(Matrix([
 [1, 0,  -2,    1],
 [0, 1, 3/2, -1/2]]),
 (0, 1))

The first returned value is the reduced matrix; the second is a tuple containing the indices of the columns containing leading terms.


>>> A=sp.Matrix([[1,2],[3,4]])
>>> mat_inv(A)
Matrix([
[ -2,    1],
[3/2, -1/2]])
>>> B=sp.Matrix([[1,2,3],[4,5,6]])
>>> mat_inv(B)
Matrix([
[-5/3,  2/3],
[4/3,  -1/3]])




Challenge
---------

Write a function ``inv_true(A)`` which calculates the potential inverse as in part 2, and then verifies that the potential inverse is a true inverse for the input matrix.




