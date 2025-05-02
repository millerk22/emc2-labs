Lab 16: The Gram-Schmidt Process
================================


In this lab you will use the python ``numpy`` module to perform the Gram-Schmidt process on a collection of vectors to find an orthonormal basis for their span. Recall that to import the numpy module you use the command

>>> import numpy as np

Use the numpy array constructor for vectors:

>>> A=np.array([1,2,3])

This will allow you to use the built-in method to compute dot products. 
To compute the dot product of two vectors ``A`` and ``B``, use the syntax ``A.dot(B)``  or ``B.dot(A)``.



Task 1
------



Write a function ``projection(A,B)`` that takes as input two vectors  ``A`` and ``B`` of the same length ``n`` and computes the projection of  ``B`` onto the subspace of :math:`\mathbb R^n` spanned by  ``A``. Recall the formula for this projection is

.. math::
   \text{Proj}_{A}(B)=\frac{A\cdot B}{A\cdot A} A,

where ``·`` is the usual dot product.

>>> projection([1,0,-1],[1,2,3])
array([-1., -0., 1.])

>>> projection([1,2,0,-1],[2,3,4,5])
array([ 0.5,  1. ,  0. , -0.5])


Task 2
------



Write a function  ``GramSchmidt(X)`` that takes as input a list ``X`` of vectors ``[v_1, v_2,... v_p]`` and returns a list of vectors ``[u_1, u_2,... u_q]`` which forms an orthogonal basis for the space spanned by the original vectors.
You may assume the original vectors are the same length, however you should not assume the original vectors are linearly independent. 
In order to avoid some ``numpy`` errors, you may need to convert the contents of each vector into ``floats``; this can be done by dividing each vector by ``1.0`` after it has been converted to a ``numpy`` array.

So that your results match the autograder, the order in which this is done matters. Start the process with the first element of ``X``, and continue in order through the rest of the elements. Set ``u_1 = v_1``, and then ``u_2 = v_2 - projection(u_1,v_2)``, etc.

Due to rounding errors, after calculating each ``u_i`` vector, replace each of its elements that has absolute value ``< 10^-5`` with ``0``. As you go through the process you should throw out any ``0`` vectors that come up. The ``np.count_nonzero`` function may be useful here.

>>> GramSchmidt([[1,0,-1],[1,2,3]])
[array([1., 0., -1.]), array([2., 2., 2.])]

>>> GramSchmidt([[1,0,-1,0],[1,2,3,4],[0,1,2,2]])
[array([1., 0., -1., 0.]), array([2., 2., 2., 4.])]



Task 3
------


Write a function  ``Orthonormal(X)`` that takes as input a list ``X`` of vectors ``[v_1, v_2,... v_p]`` and returns a list of vectors ``[u_1, u_2,... u_q]`` which forms an orthonormal basis for the space spanned by the original vectors.
Use the ``GramSchmidt`` function from the previous task to construct an orthogonal basis, then normalize each element to have norm ``1``.


>>> Orthonormal([[1,0,-1],[1,2,3]])
[array([ 0.70710678,  0.        , -0.70710678]), 
array([0.57735027, 0.57735027, 0.57735027])]

>>> Orthonormal([[1,0,-1,0],[1,2,3,4],[0,1,2,2]])
[array([ 0.70710678,  0.        , -0.70710678,0]), 
array([0.37796447, 0.37796447, 0.37796447, 0.75592895])]


