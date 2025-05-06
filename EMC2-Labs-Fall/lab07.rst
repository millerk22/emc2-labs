Lab 7: Matrix Row Reduction
===========================

In this lab you will write functions to perform basic matrix operations related to row-reducing a matrix. We will use NumPy to make this process a little easier.

Diving into NumPy
-----------------
Do you remember in lab 5 how you wrote ``scalar_mult(s, v)``, ``vector_add(v, w)``, and ``dot_product(v, w)``? Can you imagine having to write these functions every time you have to do these operations? Python makes things like this easy because people like Travis Oliphant (a BYU alumnus) already wrote them! ``scalar_mult``, ``vector_add``, ``dot_product``, and many other functions are already built in to libraries like NumPy (although they may look a little different).

To start using NumPy import it using:

>>> import numpy as np

Like we mentioned in Lab 2, every time we use a function from NumPy, we need to prefix it with ``np``. So calling a function like cosine (``cos``) would look like

>>> np.cos(0)
1.0

.. note::
    ``np`` is the nickname for NumPy so we don't have to type out ``numpy`` every time. But we aren't required to call it ``np``, we could call it ``nick_andersen`` if we really wanted, but ``np`` is what is commonly understood.


Vectors and Matrices
~~~~~~~~~~~~~~~~~~~~

In NumPy we represent matrices and vectors as a special kind of array called a NumPy array. To define
a NumPy array, we use the function ``np.array``. For example, if we want to create the vector

.. math::
   \left[\begin{array}1 1 \\ 2 \\ -1\end{array}\right]

as a NumPy array, we first create the list ``[1,2,-1]`` in Python, and then plug it into the
function ``np.array``.

.. code-block:: python
    my_list=[1,2,-1]           # This is a good old-fashioned list.
    my_vect=np.array(my_list)  # my_vect is a NumPy array now, which we think of as a vector.
    print(my_vect)             # This prints the array my_vect.

Alternatively, one could create my_vect simply by writing

.. code-block:: python
    my_vect=np.array([1,2,-1]) 

We can add vectors and multiply by scalars in a straightforward way. Think back to ``vector_add(v, w)`` and ``scalar_mult(c, v)`` from lab 5.

>>> array1=np.array([1,2,3])
>>> array2=np.array([0,7,4])
>>> array1 + array2
array([1, 9, 7])

>>> my_vect=np.array([1,2,-1])
>>> 3*my_vect
array([3, 6, -3])

NumPy has made it really easy to work with vectors. They even have ``dot`` which replaces our ``dot_product`` function.

>>> array1=np.array([1,2,3])
>>> array2=np.array([4,5,6])
>>> np.dot(array1, array2)
32

.. note::
    Note that if you try to add vectors of different lengths or do the dot product of different sizes, NumPy will throw an error.

To define matrices in NumPy, we define them as "lists of lists". In other words, a matrix
can be defined by creating a list, whose elements are all lists of the same size that represent the
rows of the matrix. Then we can plug that into the function ``np.array()``. For example, to define
the matrix

.. math::
   \left[ \begin{array}4 
   1 & 2 & 3 & 4 \\
   -5 & -6 & -7 & -8 \\
   1 & 5 & 2 & 3
    \end{array} \right]

we would create a list with three elements. The first element will be the list ``[1, 2, 3, 4]``,
which we think of as the first row of the matrix. The second element in our list will be
``[-5, -6, -7, -8]``, representing the second row, and so on.

.. note::
    In NumPy, both arrays and matrices are created using `np.array()`.

>>> my_matrix = np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
>>> print(my_matrix)
[[ 1  2  3  4]
 [-5 -6 -7 -8]
 [ 1  5  2  3]]

NumPy arrays (of any dimension) have attributes that you can access to get information about the array. If our array is named ``array1``, then we can do:
* ``array1.ndim`` will tell you the dimension of the array
* ``array1.size`` will tell you how many elements are in the array
* ``array1.shape`` will tell give you a tuple with each element represents the number of elements in each dimension of the array (a one dimensional array would be ``(n)``, a two dimensional array would be ``(n, m)`` and so on)

.. note::
    These are not functions. We call functions with ``()``, but with attributes there aren't any parentheses.

NumPy also has built in functions to create NumPy arrays. These are important to know about, but you don't need to know all the details.
* ``np.zeros(<length>)`` creates an array full of 0s
* ``np.ones(<length>)`` creates an array full of 1s
* ``np.empty(<length>)`` creates an array full of random numbers (faster than ``zeros`` or ``ones``)
* ``np.arange(<first_num>, <last_num>, <step_size>)`` works just like ``range()``, but it creates an array with all the values
* ``np.linspace(<first_num>, <last_num>, <quantity>)``

Elements of NumPy Arrays
~~~~~~~~~~~~~~~~~~~~~~~~

We can access elements of a NumPy array the same way we access elements in a list, by
specifying indices or ranges of indices. Recall that Python lists (and NumPy arrays) begin at
index ``0``. So if an element of a list or array has index ``3``, that really means it’s the 4th element
in the list or array. 

>>> v=np.array([4,1,-5,3,-2,1,0,9])
>>> print(v[3])
3

If we want more specific indexing, we can use **slicing**. This is where we specify a range of indices. It looks like:
.. code-block:: python
    my_array[<start>:<stop>]

We can think of it like ``[<start>,<stop>)`` in mathematics. So from the example above,

>>> print(v[3:7])
[ 3 -2  1  0]

There is another optional option in slicing called ``step``.

.. code-block:: python
    my_array[<start>:<stop>:<step>]


``step`` determines how many elements we step over. So 

>>> print(v[3:7:2])
[3 1]

will start at index 3 and get every second element until it gets to 7. 

Here are some more examples:

>>> v=np.array([4,1,-5,3,-2,1,0,9])
>>> print(v[2:6])   # [2,6)
[-5 3 -2 1]
>>> print(v[3:])    # [3,end)
[3 -2 1 0 9]
>>> print(v[:4])    # [beginning,4)
[4 1 -5 3]
>>> print(v[::2])   # [beginning,end) stepping every second element
[ 4 -5 -2  0]

We can access the entries in a matrix in a similar way to accessing elements of a list, though
for matrices we have to list two indices (or ranges of indices), to specify the location of the
row(s) and/or column(s) in which we are interested.

.. warning::
    Remember in python we index starting at 0!

>>> my_matrix=np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
>>> print(my_matrix)
[[ 1  2  3  4]
 [-5 -6 -7 -8]
 [ 1  5  2  3]]
>>> print(my_matrix[1,2])   # row index 1, column index 2
-7
>>> print(my_matrix[2,1:3]) # row inxex 2, column indices 1 through 3
[5 2]
>>> print(my_matrix[:,3])   # all the rows, column index 3
[4 -8 3]
>>> print(my_matrix[1])     # row index 1 (2nd row)
[-5 -6 -7 -8]


Now we will write functions to perform basic matrix operations related to row-reduction. These aren't explicitly defined in NumPy, but we can use NumPy to make writing them easier!
The functions you write for this lab should work for matrices of any size.
All inputs and outputs for this lab should be NumPy arrays.

Task 1
------

Write a function ``row_swap(A, i, j)`` which takes as input a matrix ``A``, and two indexes ``i`` and ``j``. Your function should return the matrix obtained from ``A`` with rows ``i`` and ``j`` swapped.

>>> row_swap( np.array( [ [ 1, -1, 1 ], [ 0, 1, 3 ], [ 2, -2, 0] ] ), 0, 2)
array([ [ 2, -2, 0], [ 0, 1, 3 ], [ 1, -1, 1 ] ])
>>> row_swap( np.array( [ [ 2, -1, 3 ], [ 1, 2, 3 ] ] ), 0, 1)
array([ [ 1, 2, 3 ], [ 2, -1, 3 ] ])

Task 2
------

Write a function ``row_mult(A, i, c)`` which takes as input a matrix ``A``, one index ``i``, and a scalar ``c``. Your function should return the matrix obtained from ``A`` with row ``i`` multiplied by ``c``. 

```
>>> row_mult( np.array( [ [ 1, 1 ], [ 2, 3 ] ] ), 1, 3)
array([ [ 1, 1 ], [ 6, 9 ] ])
>>> row_mult( np.array( [ [ 1, 1 ], [ 6, 9 ] ] ), 0, 0)
array([ [ 0, 0 ], [ 6, 9 ] ])
```

Task 3
------

Write a function ``row_add(A, i, j, c)`` which takes as input a matrix ``A``, two indexes ``i`` and ``j``, and a scalar ``c``. Your function should return the matrix obtained from ``A`` with row ``i`` replaced with itself plus ``c`` times row ``j``.

>>> row_add( np.array( [ [ 0, 1, 1 ], [ 1, -1, 3 ], [ 1, 3, 2] ] ), 2, 0, -3)
array([ [ 0, 1, 1 ], [ 1, -1, 3 ], [ 1, 0, -1] ])
>>> row_add( np.array( [ [ 2, 1 ], [ 1, -2 ] ] ), 0, 1, 0)
array([ [ 2, 1 ], [ 1, -2 ] ])


Challenge
---------

1. Write a function that determines whether or not a matrix is in echelon form. 

2. Write a function that row-reduces a matrix to echelon form. The hard part of this problem is determining when to swap rows. 