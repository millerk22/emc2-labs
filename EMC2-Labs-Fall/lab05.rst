Lab 5: Introduction to Python, Part IV
======================================

In this lab we will be working with matrix operations. We can think of matrices like lists of lists. So a matrix would look something like this:

.. code-block:: python

   A = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]]

For ease of readability, Python also accepts this:

.. code-block:: python

   A = [[ 1,  2,  3],
        [ 4,  5,  6],
        [ 7,  8,  9],
        [10, 11, 12]]

Nested for Loops
----------------

When working with vectors represented as Python ``list``\s, we used a single for loop, but when working with matrices it is helpful to use multiple for loops, one to go over rows, and another to go over columns. We call these nested ``for`` loops. Consider the following simple code.

.. code-block:: python

   for i in range(4):
      for j in range(3):
         print('i = ' + str(i) + ' and j = ' + str(j))

In this code, there are two ``for`` loops, an outside loop with variable ``i``, and an inside loop
with variable ``j``. When we first encounter the outside loop, we set the value of ``i`` to be ``0``, before
executing the code inside this loop. Executing the code inside the ``i`` loop involves running
another ``for`` loop though, this time with variable ``j``. The inner ``j`` loop is thus executed, and we
cycle through all of the ``j`` values, while the ``i`` value stays fixed at ``0``.

Once we've finished cycling through all of the ``j`` values, we then exit the inside ``j`` loop, and
return to the top of the outside ``i`` loop. It is at this time that the variable ``i`` is assigned the
value ``1``, before the inner ``j`` loop is called again, and we cycle through all of the ``j`` values once
again. This continues until we've run through all of the ``i`` values and the ``j`` values. The output
of this code is shown below.

.. note::

   We had to convert ``i`` and ``j`` to a ``str`` by calling ``str(i)`` and ``str(j)`` because you can't use the ``+`` operator on integers and strings together.

.. code-block:: console

   i = 0 and j = 0
   i = 0 and j = 1
   i = 0 and j = 2
   i = 1 and j = 0
   i = 1 and j = 1
   i = 1 and j = 2
   i = 2 and j = 0
   i = 2 and j = 1
   i = 2 and j = 2
   i = 3 and j = 0
   i = 3 and j = 1
   i = 3 and j = 2

Let's print out the values of matrix ``A`` from above using nested for loops.

.. code-block:: python

   for i in range(4):
      for j in range(3):
         print(str(A[i][j]) + ' at ' + 'i = ' + str(i) + ' and j = ' + str(j))

.. code-block:: console

   1 at i = 0 and j = 0
   2 at i = 0 and j = 1
   3 at i = 0 and j = 2
   4 at i = 1 and j = 0
   5 at i = 1 and j = 1
   6 at i = 1 and j = 2
   7 at i = 2 and j = 0
   8 at i = 2 and j = 1
   9 at i = 2 and j = 2
   10 at i = 3 and j = 0
   11 at i = 3 and j = 1
   12 at i = 3 and j = 2

Notice how when we print the elements of ``A``, we print ``A[i][j]``. Remember, ``A`` is a list of lists, so the first thing we do is index it with ``i`` which will get us whatever row we are on (like ``[ 1,  2,  3]``, or ``[ 7,  8,  9]``). Then we index that list by ``j`` which represents the column. This way, we end up with a single value.

This code works well for 4x3 matirces. If we want to generalize to any matrix, we need to change the ``range``\s based on the shape of the matrix. We can fix this using ``len()`` which gets the length of a Python ``list``. We might as well put this code in a function too.

.. code-block:: python
   
   def print_matrix(M):
      for i in range(len(M)):          # the number of rows
         for j in range(len(M[0])):    # the number of columns in a row
            print(str(M[i][j]) + ' at ' + 'i = ' + str(i) + ' and j = ' + str(j))

We can now use this function on any matrix as long as it is represented as a list of lists.

Consider the following, slightly more complex, code. Here we define a function that takes
a matrix ``M``, and replaces all of the negative entries with their absolute values (so for example,
if a ``-2`` occurs somewhere in the matrix, that entry is replaced with ``2``, while any nonnegative
entries are left alone).

.. code-block:: python

   def abs_matrix(M):
      n_rows = len(M)               # the number of rows
      n_cols = len(M[0])            # the number of columns
      for i in range(n_rows):       # i represents the row position.
         for j in range(n_cols):    # j represents the column position.
            if M[i][j] < 0:         # If M[i,j] is negative, we make it positive.
               M[i][j] = -M[i][j]   # Set the new value
      return M

In the above function, we first create two variables, ``n_rows`` and ``n_cols`` which store the
number of rows and columns in ``M`` respectively. After defining these two variables there are two
loops, one inside of the other. The outside loop uses the variable ``i``, which loops through the
different row indices in ``range(n_rows)``. For each step in the outside ``i`` loop (which we think of
as being a row of ``M``), we run through another for loop, this time cycling through the column
indices in ``range(n_cols)``. For each combination of ``i`` and ``j``, we test whether the entry ``M[i,j]``
in the ``i, j`` location is negative, and if it is we replace it with its absolute value.

Now, we can see if the function actually does what we think it should:

>>> mat = [[ 1, -1,  2, -3,  1,  1],
           [-2, -2,  0,  1,  1, -5],
           [ 1,  1,  1,  1, -2, -1]]
>>> print(mat)
[[1, -1, 2, -3, 1, 1], [-2, -2, 0, 1, 1, -5], [1, 1, 1, 1, -2, -1]]
>>> abs_mat=abs_matrix(mat) 
>>> print(abs_mat)
[[1, 1, 2, 3, 1, 1], [2, 2, 0, 1, 1, 5], [1, 1, 1, 1, 2, 1]]

.. note::

   After running ``abs_matrix`` on ``mat``, what is the value of ``mat``?

   >>> print(mat)
   [[1, 1, 2, 3, 1, 1], [2, 2, 0, 1, 1, 5], [1, 1, 1, 1, 2, 1]]

   ``abs_matrix(mat)`` changes the actual value of ``mat`` because it uses indexing. If we wanted to return a copy, we could do something like this:

   .. code-block:: python

      def abs_matrix(M):
         n_rows = len(M)                        # the number of rows
         n_cols = len(M[0])                     # the number of columns
         new_M = []                             # create an entirely new matrix to return
         for i in range(n_rows):                # i represents the row position.
            row_copy = M[i].copy()              # create a copy of the row
            new_M.append(row_copy)              # add the new row to new_M
            for j in range(n_cols):             # j represents the column position.
               if row_copy[j] < 0:              # if row_copy[i] is negative, we make it positive.
                  row_copy[j] = -row_copy[j]    # set the new value
         return new_M

Task 1
------

Define a function, called ``matrix_sum(M)``, which takes as input a matrix ``M`` (as
a NumPy array), and adds up all of the entries.

>>> mat=np.array([[1,-1,2,-3,1,1],[-2,-2,0,1,1,-5],[1,1,1,1,-2,-1]])
>>> matrix_sum(mat)
-5

Task 2
------

Using nested for loops, write a function ``matrix_sum(A, B)`` that takes in two Python lists of lists and returns the matrix sum. Raise a ``ValueError`` if the matrices are different shapes

>>> matrix_sum([[1, 2], [3, 4]], [[5, 6], [7, 8]])
[[6, 8], [10, 12]]
>>> A = [[3.14, 56, 1], [90, 1, 42]]
>>> B = [[5, 6, 7], [89, 10.2, 32.1]]
>>> matrix_sum(A, B)
[[8.14, 62, 8], [179, 11.2, 74.1]]
>>> matrix_sum([[1]], [[1, 2], [3, 4]])
ValueError: Matrices A and B are different shapes.


Double and Nested List Comprehensions
-------------------------------------


Much like nested ``for`` loops, we can use **double list comprehensions** to create more complicated lists. Consider this example:

>>> [a + b for a in range(0, 50, 10) for b in range (5)]
[0, 1, 2, 3, 4, 10, 11, 12, 13, 14, 20, 21, 22, 23, 24, 30, 31, 32, 33, 34, 40, 41, 42, 43, 44]

This is the same thing as:

.. code-block:: python

   out = []
   for a in range(0, 50, 10):
   	for b in range(5):
   		out.append(a + b)

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

The main difference between double list comprehension and nested list comprehension is that double list comprehension returns a list, while nested list comprehension returns a list of lists.

Task 3
------

Using a double list comprehension, write a function ``cartesian_product(A, B)`` that takes in two Python lists ``A``, and ``B`` and returns a list of the cartesian product of :math:`A` and :math:`B`.

>>> cartesian_product([1, 2, 3], [4, 5, 6])
[[1, 4], [1, 5], [1, 6], [2, 4], [2, 5], [2, 6], [3, 4], [3, 5], [3, 6]]


Task 4
------

Rewrite ``matrix_sum(A, B)`` using a nested list comprehsion. ``matrix_sum`` should take in two Python lists of lists and returns the matrix sum. Don't worry about raising a value error if the matrices are different sizes.

>>> matrix_sum([[1, 2], [3, 4]], [[5, 6], [7, 8]])
[[6, 8], [10, 12]]
>>> A = [[3.14, 56, 1], [90, 1, 42]]
>>> B = [[5, 6, 7], [89, 10.2, 32.1]]
>>> matrix_sum(A, B)
[[8.14, 62, 8], [179, 11.2, 74.1]]


Intro to Numpy
--------------

Although there are a number of useful functions which are already defined in Python, like
``range`` and ``len``, there are many common mathematical functions like ``sin(x)`` and ``log(x)`` which
are not defined. **Packages** and **libraries** contain functions that we can include in our code so we don't have to define them ourselves. Here is a table of common packages and what they do.

.. list-table::
   :widths: 25 75
   :header-rows: 1

   * - Package
     - Description
   * - ``os``
     - Interacts with the operating system (files and paths).
   * - ``math``
     - Basic math operations like square root, trig functions, constants like π.
   * - ``random``
     - Generate random numbers, choices, shuffles, etc.
   * - ``numpy``
     - Fast array/matrix math; foundation of scientific computing.
   * - ``pandas``
     - Powerful data tables (like spreadsheets) and data cleaning.
   * - ``matplotlib``
     - Plotting
   * - ``scikit-learn``
     - Classic machine learning including regression, classification, clustering.
   * - ``beautifulsoup4``
     - Scrape and parse information from websites.

NumPy is a particularly helpful package that contains many functions which are important for
doing linear algebra and mathematics in general.

In order to use the functions in the NumPy package, we first must import the package. To
do this we use the following command:

>>> import numpy as np

Here we are telling Python to import NumPy. We are also telling Python that we will be
referring to the NumPy package in our code by the shortened ``np``, instead of its full name. You
will need to do this for every notebook you create that uses NumPy. Furthermore, if you close a
notebook which has imported NumPy, and then open it again, you will need to re-execute the
cell containing the command ``import numpy as np`` in order to use any of NumPy's functions.

To use NumPy's functions in our code, we simply have to include ``np.`` at the beginning of
the function name.

>>> np.sin(0.5)
0.479425538604203

>>> np.cos(1)
0.5403023058681398

>>> np.sqrt(16)
4.0

>>> np.exp(10)
22026.465794806718

>>> np.log(116)
4.7535901911063645

Note that the trigonometric functions in NumPy are computed in terms of radians, and that
``np.log`` is the natural logarithm, with base ``e``.

Task 5
------

Find the value of 

.. math::
   \frac{e^5 - \log(\sqrt 5)}{e^{\cos 3}}

using NumPy functions, and save its value as the variable ``my_var``.
Here log denotes the natural logarithm.


Vectors and Matrices
--------------------

Another useful feature of the NumPy package is that it contains functions for working
with vectors and matrices. In NumPy we represent matrices and vectors as special arrays. To define
a NumPy array, we use the function ``np.array()``. For example, if we want to create the vector

.. math::
   \left[\begin{array}1 1 \\ 2 \\ -1\end{array}\right]

as a NumPy array, we first create the list ``[1,2,-1]`` in Python, and then plug it into the
function ``np.array``.

.. code-block::

   >>> my_list=[1,2,-1]           # This is a good old-fashioned list.
   >>> my_vect=np.array(my_list)  # my_vect is a NumPy array now, which we think of as a vector.
   >>> print(my_vect)             # This prints the array my_vect.
   array([1, 2, -1])

Alternatively, one could create my_vect simply by writing

.. code-block::
   
   my_vect=np.array([1,2,-1]) 


To define matrices in NumPy, we define them as "lists of lists". In other words, a matrix
can be defined by creating a list, whose elements are all lists of the same size that represent the
rows of the matrix, and then plugging it into the function ``np.array()``. For example, to define
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

>>> my_matrix = np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
>>> print(my_matrix)
[[ 1 2 3 4]
 [-5 -6 -7 -8]
 [ 1 5 2 3]]

We can add vectors and multiply by scalars in a straightforward way.

>>> array1=np.array([1,2,3])
>>> array2=np.array([0,7,4])
>>> array1+array2
array([1, 9, 7])

>>> my_vect=np.array([1,2,-1])
>>> 3*my_vect
array([3, 6, -3])


Task 6
------

Let

.. math::
   \vec{u} = 
   \left[
      \begin{array}1
         1 \\
         3 \\
         -2 \\
         4 \\
         5 
      \end{array}
   \right]
   \qquad
   \vec{v} = 
   \left[
      \begin{array}1
         1 \\
         1 \\
         -2 \\
         1 \\
         1 
      \end{array}
   \right]
   \qquad
   \vec{w} = 
   \left[
      \begin{array}1
         1 \\
         0 \\
         1 \\
         0 \\
         1 
      \end{array}
   \right]

Compute the value of

.. math::
   3\vec{u} - 6\vec{v}+\vec{w}

and save it as a variable called ``my_vect_var``.

Conclusion
----------

We will dive more into NumPy in Lab 7. It makes much about computational linear algebra easier. Even though most of the code you have written in these labs so far is not unique, it has hopefully given you good coding experience and helped you understand what is going on behind the scenes. Libraries like NumPy do a lot, but are limited in their capacity so there is still a lot more we can do with it. In future labs, we will use other packages and libraries to do things like

- machine learning
- image manipulation
- graphing data
- data analysis