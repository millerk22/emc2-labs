Lab 7: NumPy and Matrix Row Reduction
=====================================

In earlier labs, we wrote functions like ``scalar_mult(s, v)``, ``vector_add(v, w)``, and ``dot_product(v, w)``. In order to avoid having to write these functions every time, people like `Travis Oliphant <https://en.wikipedia.org/wiki/Travis_Oliphant>`_ (a BYU alumnus) created a python library we can use called NumPy. 

In this lab you will learn how to use NumPy to write functions that perform basic operations related to row-reducing a matrix. You will learn about:

- importing NumPy
- vectors and matrices in NumPy
- accessing NumPy arrays using slicing

NumPy
-----

Importing
~~~~~~~~~

To start using NumPy import it using:

>>> import numpy as np

As mentioned in `Lab 5 <lab05.html>`_, every time we use a function from NumPy, we need to prefix it with ``np``. So calling a function like ``cos`` (for cosine) would look like:

>>> np.cos(0)
1.0

.. note::
    ``np`` is the commonly understood nickname for NumPy so we don't have to type out "``numpy``" every time.


Vectors and Matrices
~~~~~~~~~~~~~~~~~~~~

Recall that in NumPy, we represent matrices and vectors as a special kind of array called a NumPy array. To define
a NumPy array, we use the function ``np.array()``. For example, to create the vector

.. math::
   \left[\begin{array}1 1 \\ 2 \\ -1\end{array}\right]

as a NumPy array, we take the Python list ``[1,2,-1]`` and plug it into the
function ``np.array()``.

>>> my_vect=np.array([1,2,-1]) 

We can add vectors and multiply by scalars in a straightforward way. Think back to ``vector_add(v, w)`` and ``scalar_mult(c, v)`` from Lab 5.

>>> array1=np.array([1,2,3])
>>> array2=np.array([0,7,4])
>>> array1 + array2  # adding vectors
array([1, 9, 7])

>>> my_vect=np.array([1,2,-1])
>>> 3 * my_vect      # multiplying by scalars
array([3, 6, -3])

.. note::

    While the vectors,

    .. math::
        \left[\begin{array}1 1 & 2 & -1\end{array}\right] \text{, and} \left[\begin{array}1 1 \\ 2 \\ -1\end{array}\right]

    mean different things when we write them out, NumPy represents row and column vectors in the exact same way:
    
    .. code:: python
        
        >>> np.array([1, 2, -1])
        array([ 1,  2, -1])

    Both row and column vectors will be created with a one dimensional NumPy array.

NumPy makes working with vectors very easy. They even have ``dot()`` which replaces our ``dot_product()`` function.

>>> array1=np.array([1,2,3])
>>> array2=np.array([4,5,6])
>>> np.dot(array1, array2)
32

.. note::
       
    Note that if you attempt to add vectors of different lengths or perform the dot product of vectors of different sizes, NumPy will throw an error.

To define matrices in NumPy, we define them as "lists of lists". Then we can plug that into the function ``np.array()``. For example, to define the matrix

.. math::
   \left[ \begin{array}4 
   1 & 2 & 3 & 4 \\
   -5 & -6 & -7 & -8 \\
   1 & 5 & 2 & 3
    \end{array} \right]

we would create a list with three elements. The first element will be the list ``[1, 2, 3, 4]``, which we consider the first row of the matrix. The second element in our list will be ``[-5, -6, -7, -8]``, representing the second row, and so on.

.. note::
    In NumPy, both arrays *and* matrices are created using ``np.array()``. ``np.array()`` returns a special object called a ``np.ndarray`` which will be explained more later.

>>> my_matrix = np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
>>> print(my_matrix)
[[ 1  2  3  4]
 [-5 -6 -7 -8]
 [ 1  5  2  3]]

.. admonition:: Matrix Multiplication with ``@``, ``np.dot()``, and ``np.matmul()``

    There are a few different ways to multiply matrices in Python. ``@`` is native to python, while ``np.dot()`` and ``np.matmul()`` come with NumPy.

    >>> import numpy as np
    >>> a = np.array([[1, 2, 3],
                      [3, 4, 5]])
    >>> b = np.array([[2, 3],
                      [4, 5],
                      [6, 7]])
    >>> a @ b
    [[28 34]
     [52 64]]
    >>> np.dot(a, b)
    [[28 34]
     [52 64]]
    >>> np.matmul(a, b)
    [[28 34]
     [52 64]]
    
    Each of these operations returns the same thing for 2d matrices. Each has different rules for NumPy arrays that are not two dimensional, so be careful of that. You can see more information `here <https://stackoverflow.com/questions/34142485/difference-between-numpy-dot-and-python-3-5-matrix-multiplication>`_.

Accessing NumPy Arrays with Slicing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can access elements of a NumPy array the same way we access elements in a list, by
specifying indices. Recall that Python lists (and NumPy arrays) begin at
index ``0``. So if an element of a list or array has index ``3``, that really means it’s the 4th element
in the list or array. 

>>> v=np.array([4,1,-5,3,-2,1,0,9])
>>> print(v[3])
3

If we want more specific indexing, we can use **slicing**. This is where we specify a range of indices. It looks like:

>>> my_array[start:stop]

We can think of it like :math:`[start,stop)` in mathematics. So from the array above,

>>> print(v[3:7])
[ 3 -2  1  0]

There is another optional parameter in slicing called ``step``.

>>> my_array[start:stop:step]


``step`` determines how many elements we skip over. So 

>>> print(v[3:7:2])
[3 1]

will start at index 3 and select every second element until it reaches (but does not include) 7. 

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

We can access the entries in a matrix in a similar way to accessing elements of a list. However
for matrices, we need to provide two indices (or ranges of indices), to specify the location of the
row(s) and/or column(s) in which we are interested.

>>> my_matrix=np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
>>> print(my_matrix)
[[ 1  2  3  4]
 [-5 -6 -7 -8]
 [ 1  5  2  3]]
>>> print(my_matrix[1,2])   # row index 1, column index 2
-7
>>> print(my_matrix[2,1:3]) # row index 2, column indices 1 through 3
[5 2]
>>> print(my_matrix[:,3])   # all the rows, column index 3
[4 -8 3]
>>> print(my_matrix[1])     # row index 1 (2nd row)
[-5 -6 -7 -8]

.. warning::
    Remember in python, indexing starts at 0!

.. note::
       ``my_matrix[1,2]`` will do the same thing as  ``my_matrix[1][2]`` for ``np.ndarray``\s. For two dimensional python lists, only ``my_matrix[1][2]`` is valid.

Other NumPy Tools
~~~~~~~~~~~~~~~~~
When you make a NumPy array, it isn't an ``int``, ``str``, ``float``, or ``bool``, it is something called an object of type ``numpy.ndarray`` (which stands for n-dimensional array). Objects in python are just one more way to represent data. When an object is made, it has **attributes** that contain different information about the object. We get attributes with the ``.`` notation. We will learn more about objects later, but for now you just need to know how to use object attributes. As an example, if our array is named ``array1``, then:

- ``array1.ndim`` will tell you the number of dimensions of the array
- ``array1.size`` will tell you how many elements are in the array
- ``array1.shape`` will give you a tuple with each element represents the number of elements in each dimension of the array (a one dimensional array would be ``(n,)``, a two dimensional array would be ``(n, m)`` and so on)

NumPy arrays also have functions associated with them. These functions have a special name because they only work on ``np.ndarrays``. These special functions are called **methods**. We call them in the exact same way we would a normal function. Here are some of the most useful ones:

- ``array1.sum()`` returns the sum of all the elements in the array
- ``array1.mean()`` returns the mean of all the elements in the array
- ``array1.max()`` returns the maximum value of the array
- ``array1.min()`` returns the minimum value of the array

.. warning::
       Attributes are not functions so we don't call them with ``()``.

The main difference between methods and attributes is that methods are calculated on the fly, while attributes are stored with the object.

NumPy also has built-in functions to create NumPy arrays. These are important to know about, but you don't need to know all the details right now.

- ``np.zeros(shape)`` creates an array full of 0s
- ``np.ones(shape)`` creates an array full of 1s
- ``np.empty(shape)`` creates an array filled with uninitialized (potentially random) numbers faster than ``zeros()`` or ``ones()``
- ``np.full(shape, fill_value)`` creates an array filled with the specified value
- ``np.arange(start, stop, step)`` works just like ``range()``, but it creates an array with all the values
- ``np.linspace(start, stop, num)`` creates an array from start to end (inclusive) of evenly spaced numbers (specified by ``num``)

NumPy also has a set of functions that you access with ``numpy.linalg``.
It includes things like matrix multiplication, eigenvalues, the transpose of a matrix, and lots of other useful functions.
Again, these are good to know about, but you don't need to know all the details yet.

Application: Matrix Row Reduction
---------------------------------

Now, we will write functions to perform basic matrix operations related to row-reduction.
These aren't directly built into NumPy, but we can use NumPy to make writing them easier!
These functions will be very useful for future labs as well.

.. admonition:: Requirements

       * The functions you write for this lab should work for matrices of any size.
       * All inputs and outputs for this lab should be NumPy arrays.

Task 1
------

Write a function ``row_swap(A, i, j)`` which takes as input a matrix ``A``, and two indices ``i`` and ``j``. Your function should return the matrix obtained from ``A`` with rows ``i`` and ``j`` swapped.

>>> row_swap(np.array([[1, -1, 1], [0, 1, 3], [2, -2, 0]]), 0, 2)
array([[ 2, -2,  0],
       [ 0,  1,  3],
       [ 1, -1,  1]])
>>> row_swap(np.array([[2, -1, 3], [1, 2, 3]]), 0, 1)
array([[ 1,  2,  3],
       [ 2, -1,  3]])

Task 2
------

Write a function ``row_mult(A, i, c)`` which takes as input a matrix ``A``, one index ``i``, and a scalar ``c``. Your function should return the matrix obtained from ``A`` with row ``i`` multiplied by ``c``. 

>>> row_mult(np.array([[1, 1], [2, 3]]), 1, 3)
array([[ 1,  1],
       [ 6,  9]])
>>> row_mult(np.array([[1, 1], [6, 9]]), 0, 0)
array([[ 0,  0],
       [ 6,  9]])

Task 3
------

Write a function ``row_add(A, i, j, c)`` which takes as input a matrix ``A``, two indices ``i`` and ``j``, and a scalar ``c``. Your function should return the matrix obtained from ``A`` with row ``i`` replaced with itself plus ``c`` times row ``j``.

>>> row_add(np.array([[0, 1, 1], [1, -1, 3], [1, 3, 2]]), 2, 0, -3)
array([[ 0,  1,  1],
       [ 1, -1,  3],
       [ 1,  0, -1]])
>>> row_add(np.array([[2, 1], [1, -2]]), 0, 1, 0)
array([[ 2,  1],
       [ 1, -2]])

Challenge
---------

1. Write a function that determines whether or not a matrix is in echelon form. 

2. Write a function that row-reduces a matrix to echelon form. The difficult part of this problem is determining when to swap rows. 