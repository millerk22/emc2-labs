Lab 9: Solving Systems of Linear Equations
==========================================


In this lab you use Numpy matrix objects and write a program that will reduce an *integer* matrix to echelon form. You can import Numpy using the following command:

>>> import numpy as np

Matrix objects in Numpy are stored like arrays of arrays where each inner array represents a row of the matrix. Remember these arrays are zero-indexed! 

>>> M=np.matrix([[1,2,3],[4,5,6]])
>>> M[1]
matrix([[ 4, 5, 6]])
>>> M[1,0]
4
>>> M[1]=3*M[1]
>>> M
matrix([[ 1,  2,  3],
[ 12, 15, 18]])


The dimensions of the matrix can be accessed using the ``shape`` property. Note, this is not a method so do not use parentheses!

>>> M.shape
(2,3)

You can learn more about the Numpy matrix object by reading
`<https://docs.scipy.org/doc/numpy-1.13.0/reference/generated/numpy.matrix.html>`_

Task 1
------


Write a function ``row_swap(A,i,j)`` that takes as input a matrix object ``A`` (of any shape) and two indices ``i`` and ``j`` of a row and a column respectively. 
If ``A[i,j] != 0``, your function should return the matrix ``A`` unaltered. 
Otherwise your function should step through the entries ``A[k, j]`` of the ``j``-th column with ``k > i``. 
If it finds an entry ``A[k,j] != 0``, your function should swap the ``i``-th and ``k``-th rows. 
You may need to use the ``.copy()`` method to create a copy of the row while you make the swap. 
If there is no such entry ``A[k,j] != 0``, return the original matrix ``A`` unaltered.


>>> A=np.matrix([[1,2],[3,4]])
>>> row_swap(A,0,0)
matrix([[ 1,  2],
        [ 3,  4]])
>>> B=np.matrix([[0,2],[3,4],[5,6]])
>>> row_swap(B,0,0)
matrix([[ 3,  4],
        [ 0,  2],
        [ 5,  6]])
>>> C=np.matrix([[1,2,3],[0,0,6],[0,8,9]])
>>> row_swap(C,1,1)
matrix([[1, 2, 3],
        [0, 8, 9],
        [0, 0, 6]])


Task 2
------



Write a function ``row_add(A,i,j)`` that takes as input a matrix object ``A`` and two indices ``i`` and ``j`` of a row and a column respectively. 
If ``A[i,j] != 0``, your function should iterate through the rows ``A[k]`` of ``A`` with index ``k>i``. 
At each step, if ``A[k,j] != 0``, replace the row ``A[k]`` with the row ``A[i, j]*A[k] - A[k, j]*A[i]``. 
Otherwise, return the original matrix ``A`` unaltered. 
Do not divide! 
If the input is an integer matrix your function should always return an integer matrix.


>>> A=np.matrix([[1,2],[3,4]])
>>> row_add(A,0,0)
matrix([[ 1,  2],
        [ 0,  -2]])
>>> B=np.matrix([[3,4],[0,2],[5,6]])
>>> row_add(B,0,0)
matrix([[ 3,  4],
        [ 0,  2],
        [ 0, -2]])
>>> C=np.matrix([[1,2,3],[0,5,6],[0,8,9]])
>>> row_add(C,1,1)
matrix([[1, 2, 3],
        [0, 5, 6],
        [0, 0, -3]])



Task 3
------


 
 
Write a function ``ref(A)`` that takes as input a matrix object ``A`` (of any shape) and reduces the matrix to echelon form. 
If the input matrix is an integer matrix, your function should return an integer matrix. 
Your function should only have one ``for`` loop (outside of any function calls) which should iterate through the index ``j`` of the columns of ``A``. 
Create a variable ``i`` for the row index which should be initialized to ``0`` and should be incremented as you identify the leading term in a given row. 
For instance, your function will begin with ``i=j=0``. 
Your function should call ``row_swap(A,i,j)`` which will attempt to place a non-zero entry at ``A[0,0].`` 
If ``row_swap`` fails to find such an entry, then ``j`` should increment, but ``i`` should not since you have not yet found a leading term in the ``i``-th row. 
Otherwise, you have found a leading term. 
Your function should now call ``row_add(A,i,j)`` to reduce the rows below the ``i``-th row. 
Then *both* ``i`` and ``j`` should increment. 
The process should terminate once either ``i>m`` or ``j>n``, where ``m`` and ``n`` are the dimensions of ``A``.

>>> A=np.matrix([[1,2],[3,4]])
>>> ref(A)
matrix([[ 1,  2],
        [ 0,  -2]])
>>> B=np.matrix([[0,2],[3,4],[5,6]])
>>> ref(B)
matrix([[ 3,  4],
        [ 0,  2],
        [ 0,  0]])
>>> C=np.matrix([[1,2,3],[0,0,6],[0,8,9]])
>>> ref(C)
matrix([[1, 2, 3],
        [0, 8, 9],
        [0, 0, 6]])


Challenge
---------

Write a function ``rref`` that takes as input a matrix ``A`` where the entries are decimal numbers, and returns ``A`` in reduced echelon form. 
Since the entries are now decimal numbers instead of integers, your ``row_swap`` function may have some trouble recognizing ``0``. 
You may modify to recognize any number ``z`` with ``|z|<10^-5`` as zero.

