Lab 7: Matrix Row Reduction
===========================



In this lab you will write a functions to performs basic matrix operations related to row-reducing a matrix. We will represent a matrix as an array of arrays where each inner array represents a **row** of the matrix. So, for example, the matrix 

.. math::
   \begin{bmatrix}
       1 & 2 \\
       3 & 4 
   \end{bmatrix}


would be represented in the program as ``[[1,2],[3,4]]``. As in the previous lab, we will represent a column vector as a simple list of numbers. 
The functions you write for this lab should work for matrices of any size.
All inputs and outputs for this lab should be lists (or lists of lists), not NumPy arrays.




Task 1
------


Write a function ``row_swap(A, i, j)`` which takes as input a matrix ``A``, and two indexes ``i`` and ``j``. Your function should return the matrix obtained from ``A`` with rows ``i`` and ``j`` swapped.

>>> row_swap( [ [ 1, -1, 1 ], [ 0, 1, 3 ], [ 2, -2, 0] ], 0, 2)
[ [ 2, -2, 0], [ 0, 1, 3 ], [ 1, -1, 1 ] ]
>>> row_swap( [ [ 2, -1, 3 ], [ 1, 2, 3 ] ], 0, 1)
[ [ 1, 2, 3 ], [ 2, -1, 3 ] ]

   



Task 2
------



Write a function ``row_mult(A, i, c)`` which takes as input a matrix ``A``, one index ``i``, and a scalar ``c``. Your function should return the matrix obtained from ``A`` with row ``i`` multiplied by ``c``. 


>>> row_mult( [ [ 1, 1 ], [ 2, 3 ] ], 1, 3)
[ [ 1, 1 ], [ 6, 9 ] ]
>>> row_mult( [ [ 1, 1 ], [ 6, 9 ] ], 0, 0)
[ [ 0, 0 ], [ 6, 9 ] ]


Task 3
------

Write a function ``row_add(A, i, j, c)`` which takes as input a matrix ``A``, two indexes ``i`` and ``j``, and a scalar ``c``. Your function should return the matrix obtained from ``A`` with row ``i`` replaced with itself plus ``c`` times  row ``j``.

>>> row_add( [ [ 0, 1, 1 ], [ 1, -1, 3 ], [ 1, 3, 2] ], 2, 0, -3)
[ [ 0, 1, 1 ], [ 1, -1, 3 ], [ 1, 0, -1] ]
>>> row_add( [ [ 2, 1 ], [ 1, -2 ] ], 0, 1, 0)
[ [ 2, 1 ], [ 1, -2 ] ]



Challenge
---------

1. Write a function that determines whether or not a matrix is in echelon form. 

2. Write a function that row-reduces a matrix to echelon form. The hard part of this problem is determining when to swap rows. 


