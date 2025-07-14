Lab 2: Introduction to Python Revised, Part II
==============================================

In `Lab 1 <lab01.html>`_, you were introduced to Python, learned about data types (like ``int``, ``float``, ``bool``, ``str``, and ``list``), and learned about conditionals and functions. In this lab, we are going to expound on functions and lists, and then we will introduce loops and list comprehension.

Functions, Part 2
-----------------

For Lab 1, we mainly worked with functions that took in one or two values and returned one value. We can also define functions that return multiple values and functions that call other functions when they are being evaluated.

.. code-block:: python
   
   def multiply(x,y):
      return x*y

>>> multiply(3,7)
21

.. code-block:: python
   
   def sum_diff(x,y):
      return x+y, x-y

>>> sum_diff(3,7)
(10, -4)

.. code-block:: python
   
   def mult_add(x,y):
      w = multiply(x,y)+x  # Here we call the function multiply that we defined earlier.
      return w             # Make sure that the cell containing the definition of multiply has already been executed.

>>> mult_add(3,7)
24

When we have nested functions like this, Python will step into each function as it encounters it. It will only exit the function when there are no more lines to complete in the function, or it runs into a ``return``. So in this case, Python starts executing our cell, then jumps into ``mult_add``, and then into ``multiply`` before returning from each function in reverse order.

.. code-block::

   Colab Cell
   ├── mult_add()
   │   ├── multiply()
   │   │   └── return
   │   └── return
   └── Cell Complete

Global and Local Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~

Consider the function from Lab 1:

.. code-block:: python

    def arithmetic(i, j):
        k = i + 2
        l = k * j
        w = k - 5
        return w

One important thing to note is how variables are treated by Python when they are defined inside of a function (like the variables ``k``, ``l``, and ``w`` above). These are examples of **local** variables, which are defined and can only be accessed from within the function itself. For example, when calling the function ``arithmetic(3)``, the intermediate variable ``k`` is assigned the value of ``15`` as part of the evaluation. However, as soon as the function finishes evaluating, the variable ``k`` and its value are immediately discarded, and can no longer be accessed. Trying to access it will result in an error message, indicating that we did something wrong:

>>> arithmetic(3, 4)
10
>>> k
NameError: name 'k' is not defined

**Global** variables act as a companion to local variables. These variables are accessible anywhere in the program. For example,

.. code-block:: python
    
    a = 10

    def add(n):
        return a + n

>>> add(4)
14
>>> a
10


Task 1
------

1. Define a function called ``triple(y)`` which takes a value ``y`` as input, and outputs ``3y``.
2. Define a function called ``avg(x,y)`` which takes two values ``x`` and ``y`` as input, and outputs the mean of ``x`` and ``y``. Recall that the *mean* of two numbers :math:`a` and :math:`b` is defined to be :math:`(a+b)/2`.
3. Define a function called ``combine(x,y)`` which takes a pair of input values ``x`` and ``y``, and finds the mean of ``x`` and ``3y``. The function ``combine(x,y)`` should call both of your functions ``triple(y)`` and ``avg(x,y)`` in its definition.

>>> triple(10)
30
>>> avg(5, 25)
15.0
>>> combine(6,5)
10.5


Lists
-----

So far, we have seen the ``int``, ``float``, ``str``, and ``bool`` data types.
Another very important data type in Python is the ``list`` data type. A list is an ordered
collection of objects (which can be numbers, strings, or even other lists), which we specify by
enclosing them in square brackets ``[]``.

>>> my_list=["Hello", 91.7, "world", 15, 100, -10.2]

Here the list ``my_list`` contains two strings, two floats (decimal values), and two integers. The benefit of lists is that we can store lots of data and access it easily because each entry in a list is labeled with an index starting at 0. We can access any element in a list "indexing" with ``[]``.

>>> my_list[0]
Hello
>>> my_list[4]
100
>>> my_list[5]
-10.2

.. warning::

   An important thing to remember is that Python begins indexing elements of a list starting
   at ``0``. This may seem unusual at first, since humans typically start counting objects with the
   number ``1``.

We can also access elements from the end of a list by using negative numbers.

>>> my_list[-1]
-10.2
>>> my_list[-3]
15

If we would like to access a range of characters in a list, we can use "slicing". If we have list ``L``, then we can slice it  using the notation ``L[start:stop]``, where ``start`` and ``stop`` are both integer index values. Using
this command will return all of the objects in ``L`` that are between the positions ``start`` and ``stop``.
It will **include** ``start`` and **exclude** ``stop``.

>>> L = [0,1,2,3,4,5,6]
>>> L[3:6]
[3,4,5]

>>> L[-3:-1]
[4,5]

By not specifying a starting or stopping index, Python returns the elements starting at the
beginning of the list, or stopping at the end.

>>> L[:4]
[0,1,2,3]

>>> L[3:]
[3,4,5,6]

>>> L[-2:]
[5,6]

Finally, list elements can be changed by accessing an element from an array and reassigning it.
This uses a similar notation to indexing:

>>> my_list=[1,2,3,4]
>>> my_list[2] = -15
>>> print(my_list)
[1,2,-15,4]

Another way to change lists is by adding data to them. There are two ways to do this, both are referred to as *appending* to a list.

>>> my_list=[1,2,3,4]
>>> my_list.append(5)
>>> my_list
[1,2,3,4,5]
>>> my_list = my_list + [6]
[1,2,3,4,5,6]

Notice how one of these methods uses ``[]`` while the other does not require it. You can append any type of data (``str``, ``int``, ``float``, or ``bool``) to a list.

.. warning::
   
   There is something you will need to be careful about when using lists in Python, and in
   particular when you are trying to copy a list. Suppose we create a list, called ``list_a`` with the
   values ``[1,2,3]``. Then, we create a second list ``list_b``, and assign it the value of ``list_a``.
   As expected, when we print the values of ``list_b`` Python returns the list ``[1,2,3]``.

   >>> list_a=[1,2,3]
   >>> list_b=list_a
   >>> print(list_a)
   >>> print(list_b)

   You might expect that what we've done above is to create two separate lists, ``list_a`` and ``list_b``,
   both of which happen to have the same values. However, we have actually only created a single
   list, but given it two different names ``list_a`` and ``list_b`` to reference it by! For example, if we
   change one of the entries in ``list_b``, we will also be changing the list ``list_a``.

   >>> list_b[0]=100
   >>> print(list_b)
   [100,2,3]
   >>> print(list_a)
   [100,2,3]

   There are several ways to create a new copy of a list, which will avoid this behavior. One is
   by using the command ``list_a.copy()``, which we illustrate below.

   >>> list_a=[1,2,3]
   >>> list_b=list_a.copy()  # Here we create a separate copy of list_a, and assign it to list_b.
   >>> print(list_a)
   [1,2,3]
   >>> print(list_b)
   [1,2,3]
   
   >>> list_b[0]=100         # Now this only changes list_b.
   >>> print(list_a)
   [1,2,3]
   >>> print(list_b)
   [100,2,3]


Task 4
------

1. Write a function ``first(c)`` which accepts as input any list ``c``, and outputs the first element in the list ``c``.
2. Write a function ``first_last(c)`` which accepts as input a list ``c``, and outputs two values, the first element and the last element of ``c`` (in that order).
3. Write a function ``middle(c)`` which accepts as input a list ``c``, and outputs a list which is the same as ``c`` except that the first element and the last element have been removed.

>>> w=[1,2,3,4,5]
>>> first(w)
1
>>> first_last(w)
(1, 5)
>>> middle(w)
[2,3,4]


Task 5
------

Define a function ``swap(c)`` which accepts a list ``c`` with two or more elements,
and returns another list which is the same as ``c`` except that the first and last elements are
switched.

The first line of code in your ``swap`` function should be

``copied_list=c.copy()``

The rest of your function should only reference ``copied_list`` so that the original list ``c`` remains unchanged.

>>> A = [0,1,2,3,4,5]
>>> swap(A)
[5,1,2,3,4,0]
>>> A
[0,1,2,3,4,5]




.. review functions and lists
.. this becomes vector arithmetic

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


.. while loops



.. NumPy
.. -----

.. Although there are a number of useful functions which are already defined in Python, like
.. ``range`` and ``len``, there are many common mathematical functions like ``sin(x)`` and ``log(x)`` which
.. are not defined. In order to use these functions (and others), we need to import the NumPy
.. package. A package is a collection of functions that have been written in Python, and are
.. available to use in our programs so that we don't have to define these functions ourselves.
.. NumPy is a particularly helpful package that contains many functions which are important for
.. doing linear algebra and mathematics in general.

.. In order to use the functions in the NumPy package, we first must import the package. To
.. do this we use the following command:

.. >>> import numpy as np

.. Here we are telling Python to import NumPy. We are also telling Python that we will be
.. referring to the NumPy package in our code by the shortened ``np``, instead of its full name. You
.. will need to do this for every notebook you create that uses NumPy. Furthermore, if you close a
.. notebook which has imported NumPy, and then open it again, you will need to re-execute the
.. cell containing the command ``import numpy as np`` in order to use any of NumPy's functions.

.. To use NumPy's functions in our code, we simply have to include ``np.`` at the beginning of
.. the function name.

.. >>> np.sin(0.5)
.. 0.479425538604203

.. >>> np.cos(1)
.. 0.5403023058681398

.. >>> np.sqrt(16)
.. 4.0

.. >>> np.exp(10)
.. 22026.465794806718

.. >>> np.log(116)
.. 4.7535901911063645

.. Note that the trigonometric functions in NumPy are computed in terms of radians, and that
.. ``np.log`` is the natural logarithm, with base ``e``.

.. Task 3
.. ------

.. Find the value of 

.. .. math::
..    \frac{e^5 - \log(\sqrt 5)}{e^{\cos 3}}

.. using NumPy functions, and save its value as the variable ``my_var``.
.. Here log denotes the natural logarithm.


.. Vectors and Matrices
.. --------------------

.. Another useful feature of the NumPy package is that it also contains functions for dealing
.. with vectors and matrices. In NumPy we represent matrices and vectors as arrays. To define
.. a NumPy array, we use the function ``np.array()``. For example, if we want to create the vector

.. .. math::
..    \left[\begin{array}1 1 \\ 2 \\ -1\end{array}\right]

.. as a NumPy array, we first create the list ``[1,2,-1]`` in Python, and then plug it into the
.. function ``np.array``.

.. .. code-block::

..    my_list=[1,2,-1]           # This is a good old-fashioned list.
..    my_vect=np.array(my_list)  # my_vect is a NumPy array now, which we think of as a vector.
..    print(my_vect)             # This prints the array my_vect.

.. Alternatively, one could create my_vect simply by writing

.. .. code-block::
   
..    my_vect=np.array([1,2,-1]) 


.. To define matrices in NumPy, we define them as "lists of lists". In other words, a matrix
.. can be defined by creating a list, whose elements are all lists of the same size that represent the
.. rows of the matrix, and then plugging it into the function ``np.array()``. For example, to define
.. the matrix

.. .. math::
..    \left[ \begin{array}4 
..    1 & 2 & 3 & 4 \\
..    -5 & -6 & -7 & -8 \\
..    1 & 5 & 2 & 3
..     \end{array} \right]

.. we would create a list with three elements. The first element will be the list ``[1, 2, 3, 4]``,
.. which we think of as the first row of the matrix. The second element in our list will be
.. ``[-5, -6, -7, -8]``, representing the second row, and so on.

.. >>> my_matrix = np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
.. >>> print(my_matrix)
.. [[ 1 2 3 4]
..  [-5 -6 -7 -8]
..  [ 1 5 2 3]]

.. We can add vectors and multiply by scalars in a straightforward way.

.. >>> array1=np.array([1,2,3])
.. >>> array2=np.array([0,7,4])
.. >>> array1+array2
.. array([1, 9, 7])

.. >>> my_vect=np.array([1,2,-1])
.. >>> 3*my_vect
.. array([3, 6, -3])


.. Task 4
.. ------

.. Let

.. .. math::
..    \vec{u} = 
..    \left[
..       \begin{array}1
..          1 \\
..          3 \\
..          -2 \\
..          4 \\
..          5 
..       \end{array}
..    \right]
..    \qquad
..    \vec{v} = 
..    \left[
..       \begin{array}1
..          1 \\
..          1 \\
..          -2 \\
..          1 \\
..          1 
..       \end{array}
..    \right]
..    \qquad
..    \vec{w} = 
..    \left[
..       \begin{array}1
..          1 \\
..          0 \\
..          1 \\
..          0 \\
..          1 
..       \end{array}
..    \right]

.. Compute the value of

.. .. math::
..    3\vec{u} - 6\vec{v}+\vec{w}

.. and save it as a variable called ``my_vect_var``.


.. Elements of NumPy Arrays
.. ------------------------

.. We can access elements of a NumPy array the same way we access elements in a list, by
.. specifying indices or ranges of indices. Recall that Python lists (and NumPy arrays) begin at
.. index ``0``. So if an element of a list or array has index ``3``, that really means it's the 4th element
.. in the list or array. Furthermore, when we specify a range of indices, say ``my_array[3:7]``,
.. the element with index ``3`` is included, but the element with index ``7`` is not included (Python only
.. includes up to index ``6``).

.. >>> v=np.array([4,1,-5,3,-2,1,0,9])
.. >>> print(v[3])
.. 3
.. >>> print(v[2:6])
.. [-5 3 -2 1]
.. >>> print(v[3:])
.. [3 -2 1 0 9]
.. >>> print(v[:4])
.. [4 1 -5 3]

.. We can access the entries in a matrix in a similar way to accessing elements of a list, though
.. for matrices we have to list two indices (or ranges of indices). The syntax is ``matrix[row, column]``
.. which will return the element at ``row`` and ``column``.

.. >>> my_matrix=np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
.. >>> print(my_matrix)
.. [[ 1  2  3  4]
..  [-5 -6 -7 -8]
..  [ 1  5  2  3]]
.. >>> print(my_matrix[1,2])     # row 1, column 2
.. -7
.. >>> print(my_matrix[2,1:3])   # row 2, columns 1 (inclusive) to 3 (exclusive)
.. [5 2]
.. >>> print(my_matrix[:,3])     # all rows, column 3
.. [4 -8 3]
.. >>> print(my_matrix[1])       # row 1
.. [-5 -6 -7 -8]

.. Task 5
.. ------

.. Define a function ``first_rpt(M)`` which takes as input a NumPy matrix ``M``,
.. and outputs a matrix in which every row of ``M`` has been replaced with the first row.
.. Use the ``.copy()`` method to make a copy of ``M`` and only modify the copy, i.e., ``M_copy = M.copy()``.

.. >>> my_matrix=np.array([[1, 2, 3, 4],[-5, -6, -7, -8],[1, 5, 2, 3]])
.. >>> first_rpt(my_matrix)
.. array([[1, 2, 3, 4],
..        [1, 2, 3, 4],
..        [1, 2, 3, 4]])


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

Here is what this list comprehension looks like using a ``for`` loop.

.. code:: python
   
   a = []
   for i in range(10):
      a = a + 3*i

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


Using list comprehension, create a list

.. math::
   [0.5^1, 0.5^2, 0.5^3,\ldots, 0.5^{100}]

and save it as a variable called ``long_list``.


Task 8
------

Using list comprehension, write a function returns a Python list of temperatures in fahrenheit from a Python list of temperatures in celcius. Call it ``fah_to_cel(c)``. The formula is :math:`\frac{9}{5}c + 32 = f`.