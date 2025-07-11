Lab 5: Vector Arithmetic Using Python Lists
===========================================




In this lab you will program certain basic vector and matrix operations using Python Lists to represent vectors and nested Python Lists to represent matrices. In each problem your program must allow for vectors/matrices of any size. However, if your functions are given vectors/matrices of incompatible sizes, your program should raise an exception to notify the user. You can do this by including the line

.. code-block:: python	

	raise Exception('Error: Vectors have different lengths.')

Unless appropriately caught, an exception will immediately terminate not only the current function, but also every function that called it. So for instance if function ``A`` calls function ``B`` which calls function ``C``, and ``C``  raises an exception, then all three functions will terminate without returning a value, and the exception message will be printed.

``Exception`` is a generic exception. It can be a good idea to raise a more specific exception that is more descriptive depending on the context.
In the above example, we might instead raise a ``ValueError`` above when the vectors have different lengths.

.. code-block:: python	

	raise ValueError('Error: Vectors have different lengths.')

.. admonition:: Challenge
	Can you do all the Vector tasks with list comprehension?

Task 1
------

Write a function ``vector_add(v,w)`` that takes as input two vectors ``v`` and ``w`` and returns the vector ``v+w``. The input and output vectors should be represented as  python list data types. Your function should check to ensure the vectors are the same size. If not, your function should raise a ``ValueError`` with an appropriate message.

>>> vector_add( [ 1, -1, 0 ], [ 1, 2, 3 ] )
[ 2, 1, 3 ]
>>> vector_add( [ 1.5, -.5 ], [ -1, 1 ] )
[ 0.5, 0.5 ]
>>> vector_add( [ 0, 2 ], [ 1, 5, -4 ] )
Error: Vectors have different lengths.


Task 2
------

Write a function ``dot_product(v,w)`` that takes as input two vectors ``v`` and ``w`` and returns the dot product of ``v`` and ``w``. The input and output vectors should be represented as  python list data types. Your function should check to ensure the vectors are the same size.  If not, your function should raise a ``ValueError`` with an appropriate message.
	
>>> dot_product( [ 1, -1, 0 ], [ 1, 2, 3 ] )
-1
>>> dot_product( [ 1, 3 ], [ 4, 0 ] )
4
>>> dot_product( [ 0, 2 ], [ 1, 5, -4 ] )
Error: Vectors have different lengths.





Challenge
---------

Write a function that takes as input two vectors ``u`` and ``v``, and computes the cosine of the angle between them using the law of cosines. Do not turn this in for credit. You may find the ``math.sqrt`` function useful to compute the norms of vectors.





Double and Nested List Comprehensions
-------------------------------------


Much like nested ``for`` loops, we can use **double list comprehensions** to create more complicated lists. Consider this example:

>>> [a + b for a in range(0, 50, 10) for b in range (5)]
[0, 1, 2, 3, 4, 10, 11, 12, 13, 14, 20, 21, 22, 23, 24, 30, 31, 32, 33, 34, 40, 41, 42, 43, 44]

This is the same thing as:

>>> out = []
>>> for a in range(0, 50, 10):
... 	for b in range(5):
... 		out.append(a + b)
>>> out
[0, 1, 2, 3, 4, 10, 11, 12, 13, 14, 20, 21, 22, 23, 24, 30, 31, 32, 33, 34, 40, 41, 42, 43, 44]

.. admonition:: Functions
	We can also have a list comprehension cycle through a list of functions instead of just a range of numbers. Suppose, for example, that we wanted to create a list of the form

	.. math::
	[\sin(1), \cos(1), \log(1), \sin(2), \cos(2), \log(2),\ldots, \sin(99), \cos(99), \log(99)].

	We could do this using a double list comprehension as follows.


	>>> a=[f(i) for i in range(1,100) for f in [np.sin, np.cos, np.log]]

	In this example, the ``for i in range(1,100)`` acts similarly to an outer ``for`` loop, while
	``for f in [np.sin, np.cos, np.log]`` acts like an inner ``for`` loop. For each ``i`` value, the
	function ``f`` cycles through the different function ``np.sin``, ``np.cos``, and ``np.log``, before moving
	on to the value ``i+1``.

Another way you could use list comprehension is when creating a matrix. In this case, we nest our list comprehensions inside of each other to make a **nested list comprehension**.

>>> [[a + b for b in range(5)] for a in range(0, 50, 10)]
[[0, 1, 2, 3, 4], [10, 11, 12, 13, 14], [20, 21, 22, 23, 24], [30, 31, 32, 33, 34], [40, 41, 42, 43, 44]]

We get the matrix:

.. math::
	\begin{bmatrix}
	0 & 1 & 2 & 3 & 4\\
	10 & 11 & 12 & 13 & 14\\
	20 & 21 & 22 & 23 & 24\\
	30 & 31 & 32 & 33 & 34\\
	40 & 41 & 42 & 43 & 44
	\end{bmatrix}

Notice how the ones place represents the column index, and the tens place represents the row index.

Task 3
------

Using a double list comprehension, write a function ``cartesian_product(a, b)`` that takes in two Python lists ``a``, and ``b`` and returns a list of the cartesian product of :math:`a` and :math:`b`.

Task 4
------

Using a nested list comprehsion, write a function ``matrix_sum(A, B)`` that takes in two Python lists of lists and returns the matrix sum.

.. [[a[j][i] + c[j][i]  for i in range(len(a[0]))] for j in range(len(a))]


