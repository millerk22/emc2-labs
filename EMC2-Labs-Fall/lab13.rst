Lab 13: Basis-finding
=====================



In this lab you will write a function that will compute a basis for a subspace of :math:`\mathbb R^n` spanned by a given set of vectors and any linear dependencies among the vectors. 
You will want to use Sympy Matrix objects and the ``rref`` method for this lab.



Task 1
------


Write a function ``vec_basis(L)`` that takes as input a list of vectors in  :math:`\mathbb R^n` and returns a basis for the subspace spanned by the vectors. 
The input vectors should be given as lists. 
If the vectors are of different lengths, your function should raise a ``ValueError``.  
The output should be a list of lists, where each inner list represents a vector in the original list. 
Your function should compute the basis following the procedure to compute a basis of the column space of a matrix. 
Remember that the Sympy Matrix ``rref`` method returns a tuple, where the second value contains the indices of the columns which have leading terms.


>>> vec_basis([[1,2],[2,1],[0,1]])
[[1, 2], [2, 1]]

>>> vec_basis([[1,2,3],[3,4,5],[6,7,8]])
[[1, 2, 3], [3, 4, 5]]




Task 2
------



Write a function ``lin_deps(L)`` that takes as input a list of list of vectors in  :math:`\mathbb R^n` and returns a list of linear dependencies among the vectors. 
The input vectors should be given as lists. 
If the input vectors are of different lengths, your function should raise a ``ValueError``. 
The output should be a list of lists, where each inner list represents a linear dependence among the input vectors and should represent a basis for the null space of the matrix ``A`` whose column vectors are the input vectors. 

You should have one output vector per free variable in the matrix equation ``Ax=0``. 
If ``B`` is the reduced echelon form of ``A`` and ``x_i`` is a free variable, we create the linear dependence corresponding to ``x_i`` as follows. 

1. If ``m`` is the number of input vectors, create a list of length ``m`` where every entry is zero.

2. Change the ``i`` -th entry to a 1.

3. For each basic variable ``x_j`` let ``k`` be the index of the leading term in the ``j`` -th column of the reduced matrix so that ``B[k,j] != 0``. Then set ``j`` -th entry of the list to ``-B[k,i]``. 



>>> M=sp.Matrix([[1,2,3,4],[5,10,6,11]])
>>> M.rref()
(Matrix([
 [1, 2, 0, 1],
 [0, 0, 1, 1]]), (0, 2))

>>> lin_deps([[1,5],[2,10],[3,6],[4,11]])
[[-2,1,0,0], [-1,0,-1,1]]


>>> M=sp.Matrix([[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15]])
>>> M.rref()
(Matrix([
 [1, 0, -1, -2, -3],
 [0, 1,  2,  3,  4],
 [0, 0,  0,  0,  0]]), (0, 1))
 
>>> lin_deps ([[1,6,11],[2,7,12],[3,8,13],[4,9,14],[5,10,15]])
[[1,-2,1,0,0], [2,-3,0,1,0], [3,-4,0,0,1]]




