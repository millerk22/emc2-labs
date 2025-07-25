Lab 2: Introduction to Python, Part II
======================================

In `Lab 1 <lab01.html>`_, you were introduced to Python, learned about data types (like ``int``, ``float``, ``bool``, ``str``, and ``list``), and learned about conditionals and functions. In this lab, we are going to expound on functions and lists, and then we will introduce loops and list comprehension.

Functions, Part 2
-----------------

For Lab 1, We introduced basic functions like the ``multiply`` function below. We can also define functions that return multiple values and functions that call other functions when they are being evaluated.

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
      w = multiply(x,y) + x   # Here we call the function multiply that we defined earlier.
      return w                # Make sure that the cell containing the definition of multiply has already been executed.

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

In Lab 1, we briefly introduced ``list``\s. Let's go into a little more detail.

A list is an ordered collection of objects (which can be numbers, strings, or even other lists), which we specify by enclosing them in square brackets ``[]``.

>>> my_list=["Hello", 91.7, "world", 15, 100, -10.2]

Lists make it easy to store lots of data together. We can access data from lists with **indexing** with ``[]``.

>>> my_list[0]
Hello
>>> my_list[4]
100
>>> my_list[5]
-10.2

.. admonition:: Remember

   Python indexing starts at 0, not 1.

We can also access elements from the end of a list by using negative numbers.

>>> my_list[-1]
-10.2
>>> my_list[-3]
15

If we would like to access a range of characters in a list, we can use a feature called **slicing**. Given list ``L``, slicing uses the notation ``L[start:stop]``, where ``start`` and ``stop`` are both integer index values. Using
this command will return all of the objects in ``L`` that are between the positions ``start`` and ``stop``.
It will **include** ``start`` and **exclude** ``stop``.

>>> L = [0,1,2,3,4,5,6]
>>> L[3:6]
[3,4,5]

>>> L[-3:-1]
[4,5]

By not specifying a starting or stopping index, Python returns the elements starting at the
beginning of the list, or stopping at the end.

>>> L[:4]   # the beginning of the list to 4
[0,1,2,3]

>>> L[3:]   # 3 to the end of the list
[3,4,5,6]

>>> L[-2:]  # -2 to the end of the list
[5,6]

List elements can be changed by accessing an element from an array and reassigning it. This looks just like assigning a variable to a value.

>>> my_list = [1,2,3,4]
>>> my_list[2] = -15
>>> print(my_list)
[1,2,-15,4]

Another way to change lists is by adding data to them. There are two ways to do this, both are referred to as **appending** to a list.

>>> my_list=[1,2,3,4]
>>> my_list.append(5)
>>> my_list
[1,2,3,4,5]
>>> my_list = my_list + [6]
[1,2,3,4,5,6]

Notice how one of these methods uses ``[]`` while ``.append()`` does not require it. You can ``.append()`` any type of data (``str``, ``int``, ``float``, ``bool``, or even ``list``) to a list.

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
   >>> list_b=list_a.copy()  # Here we create a separate copy of list_a, and assign it to list_b
   >>> print(list_a)
   [1,2,3]
   >>> print(list_b)
   [1,2,3]
   
   >>> list_b[0]=100         # Now this only changes list_b
   >>> print(list_a)
   [1,2,3]
   >>> print(list_b)
   [100,2,3]


Task 2
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


Task 3
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


For Loops
---------

Loops are another tool we have in programming. They are commonly used to perform repetitive tasks like repeating calculations, processing items in a list, or automating steps that would be tedious to write out individually. In Python, the most common types of loops are ``for`` loops and ``while`` loops. Let's start by exploring ``for`` loops. In this lab, we will be using loops and lists to do vector arithmetic. 

This is what a for loop looks like.

.. code-block:: python
   
   for variable in sequence:
      # code to execute

``variable`` takes the value of each item in ``sequence`` one by one, then the indented block under the for statement runs for each value of ``variable``. Let's think of this as our "for-sequence" loop. Here is an example,

.. code-block:: python

   A = [2, -6.7, "sandwich", []]

   for item in A:
      print(item)

.. code-block:: console

   2
   -6.7
   sandwich
   []

When executing a loop, Python starts by assigning the variable (in this case, ``item``) to the first element in the sequence (``A``). Then, Python executes all of the lines that are tabbed in under the loop. For us, this just prints the item to the screen. After it has completed all the tabbed lines, Python returns to the top of the loop and checks if it is done. After one iteration, there are still three more items in the list so we need to keep going. Python will then set ``item`` to the second item in ``L``, which is ``-6.7`` and print it to the screen. Then we return to the top of the loop and continue the process until there are no more items in ``L``.

Another kind of for loop uses the ``range()`` function. Let's call this our "for-range" loop.

.. code-block:: python

   for j in range(5):
      print(j)

.. code-block:: console

   0
   1
   2
   3
   4

We can think of the ``range(5)`` function as creating a list of integers ``[0,1,2,3,4]`` (``range`` doesn't actually do this, but that description is close enough). For each integer in ``[0,1,2,3,4]``, we assign it to the variable ``j``, and then print it out.

Now let's try something slightly more complicated. Let's say we wanted to sum up all the elements in a list. Here is what that would look like with our "for-sequence" loop.

.. code-block:: python
   L = [1, 5, 6, 2, 7]

   sum = 0
   for num in L:
      sum = sum + num

   print(sum)

We start by defining our list ``L`` and setting our ``sum`` variable to 0. Then, we step into our for loop. The first step in the loop will take the first element in ``L`` (``1``) and assign it to ``num``. Then, we take the previous ``sum`` and add it to ``num`` and make that the new ``sum``. At that point, our loop is done with its first iteration, so Python goes back up to the top of the loop and follows the same process with the next value in ``L``, which, in this case is ``5``.

Notice that we initially set our ``sum`` variable to ``0`` because we are treating it as a running sum that we calculate as we move through the list.

Consider the following function:

.. code-block:: python

   def double_list(L):
      for i in range(len(L)):
         L[i] = 2*L[i]


>>> L = [1, 4.2, 5, 6]
>>> double_list(L)
>>> L
[2, 8.4, 10, 12]

Note that ``len(L)`` returns the number of items in the list ``L``.

**Question:** What is the difference between ``double_list`` and the function below?

.. code-block:: python
   
   def double_list_2(L):
      new_L = []
      for item in L:
         new_L.append(item * 2)

Once you have an answer, read the following paragraph.

The main difference is that ``double_list_2`` creates a new list, while ``double_list`` modifies the original list. This is because in ``double_list``, we use indexing with ``[]`` and a "for-range" loop, but in ``double_list_2``, we use a "for-sequence" loop. The "for-sequence" loop creates a copy of the ``item`` in ``L``.

.. admonition:: Range

   The general syntax for the ``range`` command is ``range(start, stop, step)``. This is similar to the command for list slicing that you learned in :doc:`lab01`. By default, ``start=0`` and ``step=1`` so you can get the following behavior:

   .. code-block:: console

      range(5)        -->   [0, 1, 2, 3, 4]
      range(2,5)      -->   [2, 3, 4]
      range(2,5,2)    -->   [2, 4]
      range(-2,-5,-1) -->   [-2, -3, -4]


Task 4
------

Define a function ``list_relu(L)`` which takes as input a list ``L`` of numbers, and
returns a list which is the same as ``L`` except that all negative values in ``L`` are replaced with ``0``.

Notes:

1. Your function should first make a copy of the list ``L`` so that ``L`` remains unchanged.
2. You will need an ``if`` statement inside your ``for`` loop.

>>> list_relu([1,-2,17,-3.2,-15])
[1,0,17,0,0]


Task 5
------

Write a function ``scalar_mult(s,v)`` that takes as input a scalar ``s`` and a vector ``v`` and returns the vector 
``sv``. The input and output vectors should be represented as Python list data types. 

>>> scalar_mult( 4, [ 1, 2 ] )
[ 4, 8 ]
>>> scalar_mult( 3, [ 1., 0., 0.5 ] )
[ 3., 0., 1.5 ]
	
Exceptions
----------

The next task has you write a function that will add two vectors together. This operation is only valid if the two vectors are the same size. If someone tries to use your function and passes in a vector with three elements, and a vector with 6 elements, you want the function to fail and tell them what they did wrong. This is what ``Exceptions`` are for in Python. Exceptions are ``raised`` like:

.. code-block:: python
   raise type_of_exception(message)
   

For your vector addition function, you will want to raise this Exception ``if`` the lengths of the two vectors are different.

.. code-block:: python	

	raise Exception('Error: Vectors have different lengths.')

Unless appropriately caught, an exception will immediately terminate not only the current function, but also every function that called it. So for instance if function ``A`` calls function ``B`` which calls function ``C``, and ``C``  raises an exception, then all three functions will terminate without returning a value, and the exception message will be printed.

``Exception`` is a generic exception. It can be a good idea to raise a more specific exception that is more descriptive depending on the context.
In the above example, we might instead raise a ``ValueError`` above when the vectors have different lengths.

.. code-block:: python	

	raise ValueError('Error: Vectors have different lengths.')

Task 6
------

Write a function ``vector_add(v,w)`` that takes as input two vectors ``v`` and ``w`` and returns the vector ``v+w``. The input and output vectors should be represented as  python list data types. Your function should check to ensure the vectors are the same size. If not, your function should raise a ``ValueError`` with an appropriate message.

>>> vector_add( [ 1, -1, 0 ], [ 1, 2, 3 ] )
[ 2, 1, 3 ]
>>> vector_add( [ 1.5, -.5 ], [ -1, 1 ] )
[ 0.5, 0.5 ]
>>> vector_add( [ 0, 2 ], [ 1, 5, -4 ] )
Error: Vectors have different lengths.

Task 7
------

Write a function ``dot_product(v,w)`` that takes as input two vectors ``v`` and ``w`` and returns the dot product of ``v`` and ``w``. The input and output vectors should be represented as  python list data types. Your function should check to ensure the vectors are the same size.  If not, your function should raise a ``ValueError`` with an appropriate message.
	
>>> dot_product( [ 1, -1, 0 ], [ 1, 2, 3 ] )
-1
>>> dot_product( [ 1, 3 ], [ 4, 0 ] )
4
>>> dot_product( [ 0, 2 ], [ 1, 5, -4 ] )
Error: Vectors have different lengths.


List Comprehension
------------------

Lists and loops are used together very frequently, especially in mathematical applications. Because of this, Python has a way to create or modify lists using a loop-type syntax. This is called list comprehension. To illustrate how this is done, consider the following.

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
      a.append(3*i)

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


Task 8
------

Rewrite your ``scalar_mult(s,v)`` function with list comprehension. It should take as input a scalar ``s`` and a vector ``v`` and returns the vector ``sv``. The input and output vectors should be represented as Python list data types. 

>>> scalar_mult( 4, [ 1, 2 ] )
[ 4, 8 ]
>>> scalar_mult( 3, [ 1., 0., 0.5 ] )
[ 3., 0., 1.5 ]


Task 9
------


Using list comprehension, create a list

.. math::
   [0.5^1, 0.5^2, 0.5^3,\ldots, 0.5^{100}]

and save it as a variable called ``long_list``.


Task 10
------

Using list comprehension, write a function that returns a Python list of temperatures in Fahrenheit from a Python list of temperatures in Celsius. Call it ``fah_to_cel(c)``. The formula is :math:`\frac{9}{5}c + 32 = f`.

>>> fah_to_cel([0, 32, 100, 15])
[32.0, 89.6, 212.0, 59.0]