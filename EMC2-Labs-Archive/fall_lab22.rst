Lab 22: Determinants
====================


In this lab you will write two functions to compute the determinant of a matrix. 
The first method is recursive using the cofactor expansion of the matrix. 
The second is much better and uses row reduction. 
For our purposes we will use the ``scipy.linalg`` LU factorization method for the determinant. 
You can read more about this method here:

`<https://docs.scipy.org/doc/scipy-0.14.0/reference/generated/scipy.linalg.lu.html>`_

The operations allowed in an LU factorization do not change the determinant of a matrix, so if ``LU=A`` is a factorization of ``A``, then ``det(A)=det(U)``. 
Since ``U`` is upper triangular, its determinant is the product of entries down the main diagonal.

You can use the LU factorization method as follows.

>>> import scipy.linalg as la
>>> la.lu([[1,2],[1,1]])
(array([[1., 0.],
        [0., 1.]]), array([[1., 0.],
        [1., 1.]]), array([[ 1.,  2.],
        [ 0., -1.]]))

The output is a triple ``(P,L,U)`` where ``P`` is a permutation matrix, ``L`` is a lower-triangular matrix, and ``U`` is an upper triangular matrix.
 

Task 1
------



Write a function ``det_rec(M)`` which takes as input a matrix ``M`` and compute the determinant of a matrix recursively using the cofactor expansion. 
Your base case should be when ``M`` is a ``1 x 1`` matrix, in which case the determinant is just the entry.

>>> det_rec([[1,2],[1,1]])
-1.0
>>> det_rec([[1,2,3],[1,1,1],[1,0,1]])
-2.0
>>> det_rec([[1,2,3,4,5],[1,1,1,0,0],[1,0,1,0,1],[0,-1,0,-1,-2],
[1,1,1,1,1]])
-4.0



Task 2
------


Write a function ``det_LU(M)`` which takes as input a matrix ``M`` and compute the determinant of a matrix by first computing the LU factorization of ``M`` as described above, and then returning the product of values on the main diagonal of ``U``. 
For this problem, you should ignore the permutation matrix. 
This will mean that your determinant is sometimes off by a sign since swapping rows changes the sign of the determinant.

>>> det_LU([[1,2],[1,1]])
-1.0
>>> det_LU([[1,2,3],[1,1,1],[1,0,1]])
2.0
>>> det_LU([[1,2,3,4,5],[1,1,1,0,0],[1,0,1,0,1],[0,-1,0,-1,-2],
[1,1,1,1,1]])
4.0




Challenge
---------


Fix your ``det_LU(M)`` function so that it accounts for the change of sign indicated by the permutation matrix.

>>> det_LU([[1,2],[1,1]])
-1.0
>>> det_LU([[1,2,3],[1,1,1],[1,0,1]])
-2.0
>>> det_LU([[1,2,3,4,5],[1,1,1,0,0],[1,0,1,0,1],[0,-1,0,-1,-2],
[1,1,1,1,1]])
-4.0



