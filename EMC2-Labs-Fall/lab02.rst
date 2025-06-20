Lab 2: Introduction to Python, Part II
======================================

For Loops
---------

In the previous lab we learned how to define functions, and how to use ``if`` statements to
design ones that do more than just perform arithmetic operations. In this lab we will learn
about another tool for writing functions, called ``for`` loops. We will illustrate this idea with the
following simple example of a ``for`` loop.

.. code-block:: python

   for j in range(5):
      print(j)

.. code-block:: console

   0
   1
   2
   3
   4

First, the ``range(5)`` function essentally creates a
list of integers ``[0,1,2,3,4]``, which we will call ``L``, which starts with ``0`` and ends at ``4``.
``range`` doesn't actually return a list like this, but we can think of it as behaving
like one, so we will refer to it as a "list" anyway. Notice that the second line of code above
is indented. We think of this as being code that is inside the ``for`` loop. It's possible to have
multiple lines of indented code following a ``for`` statement like the one above.

.. admonition:: Range

   The general syntax for the ``range`` command is ``range(start, stop, step)``. This is similar to the command for list slicing that you learned in :doc:`lab01`. By default, ``start=0`` and ``step=1`` so you can get the following behavior:

   .. code-block:: console

      range(5)        -->   [0, 1, 2, 3, 4]
      range(2,5)      -->   [2, 3, 4]
      range(2,5,2)    -->   [2, 4]
      range(-2,-5,-1) -->   [-2, -3, -4]


When Python encounters the statement ``for j in range(5):``, it starts by assigning ``j`` the
first value in the list ``L``, namely ``0``, and then it proceeds to execute the commands which are
indented inside the ``for`` loop. In this case, ``print(j)`` is the only command, and since we
have assigned ``j`` to be ``0``, this prints ``0`` in the output.


Once Python has finished executing all of the code inside the ``for`` loop, it then returns to
the top of the ``for`` loop and continues the same process. This time, however, it assigns ``j`` to
be the second entry in the list ``L``, which is ``1``. Python again executes the code inside the ``for``
loop, which again consists only of ``print(j)``. This time, however, ``j = 1``, and hence we see a ``1``
printed in the output following the ``0``.

After executing the code in the for loop with ``j = 1``, Python then returns again to the top
of the ``for`` loop at the beginning of the cell. At this point ``j`` takes on the next value
in the list ``L``, namely ``2``, and proceeds again to execute the code inside the ``for`` loop. This
continues until ``j`` has cycled through every value in the list ``L=[0,1,2,3,4]``, and executed the
code inside the ``for`` loop for each value of ``j``.

We don't have to use the ``range`` function with ``for`` loops. We can replace ``range`` with
any ``list`` we'd like. Try the following code out in your ``Sandbox`` notebook.

.. code-block:: python

   A = [2, -6.7, "sandwich", []]

   for item in A:
      print(item)

Now let's try something slightly more complicated. Consider the following function.

.. code-block:: python

   def summation(n):
      total = 0
      for i in range(n+1):
         total = total + i
      return total

The function ``summation`` takes as input an integer ``n``, and then adds up all of the integers
between 0 and ``n``. The function first creates a variable ``sum``, which will keep track of the running
total of our summation as we add everything up. We will think of our function as adding one
number at a time, so we initially define the variable ``sum`` so that it has value ``0`` since we haven't
added any of the numbers to it yet.

The variable ``i`` in the ``for`` loop then runs through the integers ``0,1,...,n``, and at each step
it adds the current value of ``i`` to the running total in the variable ``sum``. Once we have looped
through all of the integers ``0,1,...,n``, the function exits the ``for`` loop, and returns the final
value of ``sum``.

Question: Why do we use ``range(n+1)`` instead of ``range(n)`` in the code above?


   Practice: What does the following code do? Work out the expected output on paper, then run the code to check your answer.

   .. code-block:: python

      my_list = [1,2,3,4]

      for i in range(len(my_list)):
         my_list[i] = 2*my_list[i]

      print(my_list)

   Note: we have introduced a new command ``len`` which gives the length of a list.


Task 1
------

Define a function ``sum_list(L)`` which takes as input a list ``L`` of numbers, and
returns the sum of the values in the list. 

>>> sum_list([1,3,7,-13])
-2


Task 2
------

Define a function ``list_relu(L)`` which takes as input a list ``L`` of numbers, and
returns a list which is the same as ``L`` except that all negative values in ``L`` are replaced with ``0``.

Notes:

1. Your function should first make a copy of the list ``L`` so that ``L`` remains unchanged.
2. You will need an ``if`` statement inside your ``for`` loop.

>>> list_relu([1,-2,17,-3.2,-15])
[1,0,17,0,0]


NumPy
-----

Although there are a number of useful functions which are already defined in Python, like
``range`` and ``len``, there are many common mathematical functions like ``sin(x)`` and ``log(x)`` which
are not defined. In order to use these functions (and others), we need to import the NumPy
package. A package is a collection of functions that have been written in Python, and are
available to use in our programs so that we don't have to define these functions ourselves.
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

Task 3
------

Find the value of 

.. math::
   \frac{e^5 - \log(\sqrt 5)}{e^{\cos 3}}

using NumPy functions, and save its value as the variable ``my_var``.
Here log denotes the natural logarithm.


Vectors and Matrices
--------------------

Another useful feature of the NumPy package is that it also contains functions for dealing
with vectors and matrices. In NumPy we represent matrices and vectors as arrays. To define
a NumPy array, we use the function ``np.array()``. For example, if we want to create the vector

.. math::
   \left[\begin{array}1 1 \\ 2 \\ -1\end{array}\right]

as a NumPy array, we first create the list ``[1,2,-1]`` in Python, and then plug it into the
function ``np.array``.

.. code-block::

   my_list=[1,2,-1]           # This is a good old-fashioned list.
   my_vect=np.array(my_list)  # my_vect is a NumPy array now, which we think of as a vector.
   print(my_vect)             # This prints the array my_vect.

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


Task 4
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


Elements of NumPy Arrays
------------------------

We can access elements of a NumPy array the same way we access elements in a list, by
specifying indices or ranges of indices. Recall that Python lists (and NumPy arrays) begin at
index ``0``. So if an element of a list or array has index ``3``, that really means it's the 4th element
in the list or array. Furthermore, when we specify a range of indices, say ``my_array[3:7]``,
the element with index ``3`` is included, but the element with index ``7`` is not included (Python only
includes up to index ``6``).

>>> v=np.array([4,1,-5,3,-2,1,0,9])
>>> print(v[3])
3
>>> print(v[2:6])
[-5 3 -2 1]
>>> print(v[3:])
[3 -2 1 0 9]
>>> print(v[:4])
[4 1 -5 3]

We can access the entries in a matrix in a similar way to accessing elements of a list, though
for matrices we have to list two indices (or ranges of indices). The syntax is ``matrix[row, column]``
which will return the element at ``row`` and ``column``.

>>> my_matrix=np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
>>> print(my_matrix)
[[ 1  2  3  4]
 [-5 -6 -7 -8]
 [ 1  5  2  3]]
>>> print(my_matrix[1,2])     # row 1, column 2
-7
>>> print(my_matrix[2,1:3])   # row 2, columns 1 (inclusive) to 3 (exclusive)
[5 2]
>>> print(my_matrix[:,3])     # all rows, column 3
[4 -8 3]
>>> print(my_matrix[1])       # row 1
[-5 -6 -7 -8]

Task 5
------

Define a function ``first_rpt(M)`` which takes as input a NumPy matrix ``M``,
and outputs a matrix in which every row of ``M`` has been replaced with the first row.
Use the ``.copy()`` method to make a copy of ``M`` and only modify the copy, i.e., ``M_copy = M.copy()``.

>>> my_matrix=np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
>>> first_rpt(my_matrix)
array([[1, 2, 3, 4],
       [1, 2, 3, 4],
       [1, 2, 3, 4]])


Nested for Loops
----------------

Oftentimes when working with matrices it is helpful to use more than one ``for`` loop, with
some loops sitting inside of others. We call these nested ``for`` loops. Consider the following
simple code.

.. code-block:: python

   for i in range(4):
      for j in range(3):
         print('i = ', i, ' and j = ', j)


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

Consider the following, slightly more complex, code. Here we define a function that takes
a matrix ``M``, and replaces all of the negative entries with their absolute values (so for example,
if a ``-2`` occurs somewhere in the matrix, that entry is replaced with ``2``, while any nonnegative
entries are left alone).

.. code-block:: python

   def abs_matrix(M):
      n_rows, n_cols = M.shape   # This gets the number of rows and columns of M.
      for i in range(n_rows):    # i represents the row position.
         for j in range(n_cols): # j represents the column position.
            if M[i,j]<0:         # If M[i,j] is negative, we make it positive.
               M[i,j]=-M[i,j]    # Set the new value
      return M

.. Note::
   ``M.shape`` is **not** a function. It is called an attribute (which we will talk about later).
   For now, all you need to know is that you don't need to use ``()`` to call it.

In the above function, we first create two variables, ``n_rows`` and ``n_cols`` which store the
number of rows and columns in ``M`` respectively. After defining these two variables there are two
loops, one inside of the other. The outside loop uses the variable ``i``, which loops through the
different row indices in ``range(n_rows)``. For each step in the outside ``i`` loop (which we think of
as being a row of ``M``), we run through another for loop, this time cycling through the column
indices in ``range(n_cols)``. For each combination of ``i`` and ``j``, we test whether the entry ``M[i,j]``
in the ``i, j`` location is negative, and if it is we replace it with its absolute value.

Now, we can see if the function actually does what we think it should:

>>> mat=np.array([[1,-1,2,-3,1,1],[-2,-2,0,1,1,-5],[1,1,1,1,-2,-1]])
>>> print(mat)
[[ 1 -1 2 -3 1 1]
 [-2 -2 0 1 1 -5]
 [ 1 1 1 1 -2 -1]]
>>> abs_mat=abs_matrix(mat) 
>>> print(abs_mat)
[[1 1 2 3 1 1]
 [2 2 0 1 1 5]
 [1 1 1 1 2 1]]

Task 6
------

Define a function, called ``matrix_sum(M)``, which takes as input a matrix ``M`` (as
a NumPy array), and adds up all of the entries.

>>> mat=np.array([[1,-1,2,-3,1,1],[-2,-2,0,1,1,-5],[1,1,1,1,-2,-1]])
>>> matrix_sum(mat)
-5


List Comprehension
------------------


One handy way to define lists (and NumPy arrays) is by using a list comprehension. To
illustrate how this is done, consider the following.

>>> a = [3*i for i in range(10)] 
>>> a
[0, 3, 6, 9, 12, 15, 18, 21, 24, 27]

List comprehension is the programming version of set-builder notation.
Think about how the code above resembles the following.

.. math::
   a = \{3i : i \in \{0, 1, 2,\ldots, 9\}\}

The first part of the above list comprehension, namely ``3*i``, tells Python that we are going
to create a list and fill it with numbers of the form ``3*i``, for some values of ``i``. The second part
of the list comprehension, the command ``for i in range(10)``, tells Python what values of ``i``
to use. In other words, we are creating a list with the elements ``3*i``, where ``i`` ranges between
``0`` and ``9``.

Here are a few more examples.

>>> b = [np.sqrt(num) for num in [4, 1, 9, 81]]
>>> b
[np.float64(2.0), np.float64(1.0), np.float64(3.0), np.float64(9.0)]

>>> c = [len(ele) for ele in ["hello", "EMC2", "lab"]]
>>> c
[5, 4, 3]


Task 7
------


Using a list comprehension, create a list

.. math::
   [0.5^1, 0.5^2, 0.5^3,\ldots, 0.5^{100}]

and save it as a variable called ``long_list``.

Nested List Comprehension
-------------------------


Much like nested ``for`` loops, we can use double list comprehensions to create more complicated lists. We can also have a list comprehension cycle through a list of functions instead of
just a range of numbers. Suppose, for example, that we
wanted to create a list of the form

.. math::
   [\sin(1), \cos(1), \log(1), \sin(2), \cos(2), \log(2),\ldots, \sin(99), \cos(99), \log(99)]

We could do this using a double list comprehension as follows.


>>> a=[f(i) for i in range(1,100) for f in [np.sin, np.cos, np.log]]

In this example, the ``for i in range(1,100)`` acts similarly to an outer ``for`` loop, while
``for f in [np.sin, np.cos, np.log]`` acts like an inner ``for`` loop. For each ``i`` value, the
function ``f`` cycles through the different function ``np.sin``, ``np.cos``, and ``np.log``, before moving
on to the value ``i+1``.


Task 8
------

Using a double list comprehension, create a list

.. math::
   [1^1, 2^1, 3^1, 1^2, 2^2, 3^2, 1^3, 2^3, 3^3, \ldots, 1^{99}, 2^{99}, 3^{99}]

and save it as a variable called ``very_long_list``.

.. hint::
   
   By looking at the above example try to figure out the order in which the list comprehensions need to be stated. If you don't obtain the correct answer, try swapping the order
   of the list comprehensions.








