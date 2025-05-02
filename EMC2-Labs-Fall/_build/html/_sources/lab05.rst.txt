Lab 5: Vector Arithmetic Using Python Lists
===========================================




In this lab you will program certain basic vector operations using standard Python Lists to represent vectors. In each problem your program must allow for vectors of any size. However, if your functions are given vectors of incompatible sizes, your program should raise an exception to notify the user. You can do this by including the line

.. code-block:: python	

	raise Exception('Error: Vectors have different lengths.')

Unless appropriately caught, an exception will immediately terminate not only the current function, but also every function above it in the stack. So for instance if function ``A`` calls function ``B`` which calls function ``C``, and ``C``  raises an exception, then all three functions will terminate without returning a value, and the exception message will be printed.

``Exception`` is a generic exception. It can be a good idea to raise a more specific exception that is more descriptive depending on the context.
In the above example, we might instead raise a ``ValueError`` above when the vectors have different lengths.

.. code-block:: python	

	raise ValueError('Error: Vectors have different lengths.')


Task 1
------

Write a function ``scalar_mult(s,v)`` that takes as input a scalar ``s`` and a vector ``v`` and returns the vector 
``sv``. The input and output vectors should be represented as Python list data types. 

>>> scalar_mult( 4, [ 1, 2 ] )
[ 4, 8 ]
>>> scalar_mult( 3, [ 1., 0., 0.5 ] )
[ 3., 0., 1.5 ]
	

Task 2
------

Write a function ``vector_add(v,w)`` that takes as input two vectors ``v`` and ``w`` and returns the vector ``v+w``. The input and output vectors should be represented as  python list data types. Your function should check to ensure the vectors are the same size. If not, your function should raise a ``ValueError`` with an appropriate message.

>>> vector_add( [ 1, -1, 0 ], [ 1, 2, 3 ] )
[ 2, 1, 3 ]
>>> vector_add( [ 1.5, -.5 ], [ -1, 1 ] )
[ 0.5, 0.5 ]
>>> vector_add( [ 0, 2 ], [ 1, 5, -4 ] )
Error: Vectors have different lengths.


Task 3
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





