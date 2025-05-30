Lab 1: Introduction to Python, Part I
=====================================

This lab is adapted from Math 215 Lab 1.

Setting up Google Colab
-----------------------

In these labs we will be using Python, which is a powerful, general-purpose programming language that is widely used in science and engineering. 
It has many libraries and packages available to add on that make it a powerful tool for scientific computing and applied mathematics.
Even better, it is a great first language to learn for beginners to computer programming!
There are several ways to write programs in Python. 
In these labs we will be using Google's Colaboratory notebooks to write our code and create the files we will submit for grading. 
This allows us to write and run Python programs in an internet browser without the hassle of downloading and installing any software on our computers. 
This will be described in more detail below.

The first step is to make sure you have a Google account (if you have a Gmail account, you're done with this step). 
You can set one up at

`<https://accounts.google.com/signup>`_

Once your Google account is setup, navigate to the page

`<https://colab.research.google.com>`_

This will take you to a page with some introductory material about Google Colab.
Click the button in the top right corner to sign into your Google account if you are not
already signed in.

From the Google Colab welcome page you can navigate through a variety of introductory material to learn about Google Colab, or you can create a new notebook of your own to play around with. 
We will do the latter and create a new practice notebook in which to work and test our code.

Create a new notebook by selecting

``File > New notebook``

from the top menu in Google Colab.
Name your notebook ``Sandbox``.
Your sandbox notebook can be used to test code snippets while you're learning.
Use ``Sandbox`` in the same way you'd use paper to take notes in a lecture course.
You won't turn this notebook in; it's just for your benefit.

Now select 

``Tools > Settings > AI Assistance`` 

and make sure both options are unchecked.
(Generative AI is a very useful tool -- and it's really cool -- but it's more of a hindrance when your goal is to learn a new programming language.)


Running Code in Cells
---------------------

Once you've created a new notebook you'll notice a little box to enter your code underneath the various menus. 
This is called a ``cell``, and it is the basic building block of a Colab notebook.
Any code that you want to execute in a notebook must be placed in a cell.

In your notebook type the following into the cell:

>>> print("Hello World!")

.. note::
   ``>>>`` indicates that the code that follows should be typed into a cell!

As you might expect, this is a command which tells the notebook to display the phrase ``Hello world!`` below the cell. 
In order to tell Python to actually perform this command, we must execute the cell, by holding down the Shift button and pressing Return or Enter.

Execute this cell. You should see the following:

>>> print("Hello World!")
Hello World!

.. note::
   Code written without ``>>>`` is Python's output.

Congratulations, you've just run your first Python program. 
After running your "Hello World!" command, you should notice that a new cell appears beneath the output of your last cell. 
You can enter new commands into this cell, and execute them the same way you did in the above cell. 
You can enter as many commands in a cell as you want, by putting each of them on a separate line. 
When you execute a cell with more than one command, the commands will be executed one at a time, from top to bottom.

In the cell that was just created write and execute the following two commands:

>>> print("Hello World!")
>>> print("I'm hungry.")
Hello World!
I'm hungry.

Each time you execute a cell, a new cell should be created at the bottom of the notebook. 
If at any time you want to create an additional new cell, you can push the ``+Code`` button at the top of the notebook. 
You can also move any cell up or down in the notebook, by selecting that cell and pushing the ↑ and ↓ buttons that appear in the top right corner of the cell. 
Likewise, you can delete any cell by selecting it first, and then clicking on the 🗑 [trash can] icon that appears in the top right corner of the cell. 
At any time you can go back to a previous cell and edit it, and re-execute it as many times as you'd like. 
It is this ability to execute your code in small bite-sized chunks, and to go back and forth editing different parts, that makes Colab notebooks an easy way to quickly test out different ideas and pieces of code.


Python Basics
-------------

Arithmetic
~~~~~~~~~~

Perhaps the most basic use of our notebook is as a fancy calculator, with all of the standard arithmetic operations defined: ``+``, ``-``, ``*``, and ``/``. 
Python follows the usual order of mathematical operations, including the use of parentheses. 
For example, to compute :math:`15 × 3 − 81 ÷ 9`, we would enter

>>> 15 * 3 - 81 / 9
36.0

.. note:: 
   The output is ``36.0``, not ``36``, because we used division.
   Python now treats the output like a decimal number instead of an integer.
   In Python, the decimal number data type is called ``float``, which stands for floating point number.
   The integer data type is called ``int``.

   If we want to force the output to be an ``int`` instead, we can use integer division: ``//``:

   >>> 15 * 3 - 81 // 9
   36

   This works as expected. 
   Be careful, though: if you use integer division and the result is not an integer, Python will round down:

   >>> 7 // 2
   3
   >>> 7 / 2
   3.5

We can compute exponentiation using the ``**`` operator. 
For example, we can compute :math:`2^5`  by typing the following.

>>> 2**5
32

   Practice: Compute the values of :math:`(13 − 17) × 6` and :math:`2^3 + 21` in your practice notebook. 
   You should get ``-24`` and ``29`` respectively as your answers.


Output and print statements
~~~~~~~~~~~~~~~~~~~~~~~~~~~

As mentioned above, we can include as many statements as
we want in a single cell by putting each of them on a separate line. Notice, however, that only
the result of the final command is included in the output displayed underneath the cell:

>>> 11+1
>>> 12-11
>>> 3*7
>>> 15 // 3
5

If we'd like to see the output of multiple commands we can use the ``print`` command to make
sure that those commands are included in the output display.

   Practice: Enter the following commands in a cell, and execute them. What output do you see?

   >>> print(11 + 1)
   >>> print(12 - 11)
   >>> print(3 * 7)
   >>> print(15 // 3)

Variables
~~~~~~~~~

Just like in mathematics, a variable in Python is a placeholder for some value. For
example, we can define a variable called ``a`` and assign the value ``2`` to it simply by executing the
following code:

>>> a = 2

After executing this cell, the variable ``a`` can be used in other cells within this notebook, and
when executing these statements Python will replace the variable ``a`` with the value currently
stored there.

>>> a + 15
17

We can also redefine the value of ``a`` at any time in our notebook, and we can even use the
current value of ``a`` when we redefine it.

>>> a = a + 1
>>> print(a)
3
>>> a = a**a
>>> print(a)
27
>>> a = -17
>>> print(a)
-17

Sometimes it is useful to swap the values of given variables. 
The following does *not* work. (Try it out!)

>>> x = 2
>>> y = 5
>>> x = y
>>> y = x
>>> print(x,y)

To swap variables, we can introduce a
"placeholder" variable as follows:

>>> x = 2
>>> y = 5
>>> print(x, y)
2 5
>>> z = x
>>> x = y
>>> y = z
>>> print(x, y)
5 2

   Pratice: Enter the following commands into a cell. What do you expect the output will be? Now, execute the cell and check your answers.

   >>> b=5
   >>> print(b)
   >>> b=b+7
   >>> print(b)
   >>> b=3*(5-b)
   >>> print(b)

We can also use symbols such as ``<`` and ``>`` to compare various quantities and variables. We
can use a double equal sign ``==`` to test whether two quantities are equal, and ``<=`` and ``>=`` to test
quantities that are less than or equal to, or greater than or equal to each other.

>>> a = 5
>>> print (7 <= a)
False
>>> print(a == 5)
>>> print(a < 10)
True
True

Notice that the commands ``a=5`` and ``a==5`` have different meanings in the above code. In the
first case we are assigning the value of ``5`` to the variable ``a``, while in the second case we are
checking the value of ``a`` and testing if it equals the number ``5``.

   Practice: What will the output of the following cell be?

   >>> c=-5
   >>> c=c+3
   >>> print(c==-5)
   >>> print(c>=1)
   >>> print(c==-2)

Finally, notice that variables in Python can represent a variety of objects, not just numbers.
For example, variables can represent strings (``str``), which are sequences of characters, or Booleans (``bool``)
which are variables that are either ``True`` or ``False``.

>>> c = "my string"
>>> b = 7 > -2
>>> print(b, c)
True my string

.. admonition:: Lab Instructions

   Until this point, all of the code you've written should be in your ``Sandbox`` notebook.
   Create a new notebook called ``Lab01``. 
   In these labs, the code you'll turn in for credit will be labeled ``Task``.
   Write the code for each Lab 1 task in your ``Lab01`` notebook. 
   For future labs, create a new notebook each time.

Task 1
------

Enter the expression 

.. math::
   \frac{118+11\times 2}{9-2}

and store it as a variable called ``my_first_var``.
Remember to use parentheses to ensure that the order of operations is correct.
Don't just save the numerical value of this expression,
which is ``20``. Save the actual expression with the addition, multiplication, division, subtraction, and parentheses as the variable.



Functions, Part 1
-----------------

In computer programming, like in mathematics, a function is an object which accepts as
input values from some set, and produces output which depends both on the input values and
some given rules. In Python we illustrate how to define simple functions with the following
example.

Type the following into a cell, and execute it.

.. code-block:: python

   def reciprocal(n):
      """A function that takes the reciprocal of the input n."""
      return 1/n

Here we have defined a function called ``reciprocal``, which has a single input parameter ``n``. The
first line of the function definition begins with ``def``, followed by the name of the function, the
parameters it accepts in parentheses, and ends with a colon. Each line in the remainder of
the function **must be indented** (which Colab will do for you automatically), and the function
definition ends with a ``return`` statement that defines what the output of the function will be. It
is customary to put a docstring directly below the def statement, which is a note (using ``"""`` or ``'''``) designed
to describe the purpose of the function to the user. 
(You can put additional notes throughout code with a comment. A comment is anything written after a ``#``; Python will ignore it.)
In the case of our function ``reciprocal``, it
accepts a single value ``n`` as its input, and it returns the value ``1/n`` as its output. To evaluate our
function on a given input, we write it much as one might expect:

>>> reciprocal(13)
0.07692307692307693

>>> a = 2
>>> reciprocal(a)
0.5

.. warning::

   What do you think will happen if we try:

   >>> reciprocal(0)

   You should have received an ugly error message when you tried to evaluate ``reciprocal(0)``,
   as a result of trying to divide by zero. Python will produce an error message anytime you try to
   execute code that violates one of its rules. Learning to interpret error messages is an important
   part of becoming a good programmer. Be warned though, just because you don't
   get an error message when you execute your code doesn't mean that your code is doing what
   you want it to be doing. This is why we will always test our code with various input values.


Our functions can also include more lines of code inside of them, which dictate which steps
to perform before returning the output of the function. We can also define new variables inside
of a function. In this case, each step in the function should be on its own line, indented from
the first line of the function.


   Practice: Define the following function in your practice notebook. Remember to indent all of the
   lines in the function definition from the second line on! Proper use of indentation and
   whitespace is very important in Python.

   .. code-block:: python

      def arithmetic(i):
         j=i+2
         k=3*j
         w=k-5
         return w

   What output do the following commands produce? (Try to figure it out before you run the code.)

   >>> print(arithmetic(3))
   >>> print(arithmetic(-10))


Task 2
------

Define a function called ``arithmetic2(i)`` which does exactly the same thing
as the function ``arithmetic(i)`` defined above, but which only has a ``def`` line and
a ``return`` statement. In other words, write a function that does the exact same thing as
``arithmetic(i)``, but which fits in only two lines of code.

.. admonition:: Test your Code
   
   Whenever you are instructed to write a function in these labs, we will include some test code that you can run to make sure your code is working properly.
   This is a very important step in programming -- don't skip it!

   >>> arithmetic2(3)
   10
   >>> arithmetic2(-10)
   -29


Functions, Part 2
-----------------

One item to note in the ``arithmetic`` example is how variables are treated by Python when they
are defined inside of a function (like the variables ``j``, ``k``, and ``w`` above). They are examples of
**local** variables, which are defined and can only be accessed from within the function itself. For
example, when calling the function ``arithmetic(3)``, the intermediate variable ``k`` is assigned the
value of ``15`` as part of the evaluation. However, as soon as the function finishes evaluating, the
variable ``k`` and its value are immediately discarded, and can no longer be accessed. Trying to
access it will result in an error message, indicating that we did something wrong:


>>> arithmetic(3)
10
>>> k
NameError: name 'k' is not defined

We can define functions that accept multiple values as inputs, functions that output
multiple return values, and functions that call other functions when they are being evaluated.

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


Task 3
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

>>> my_list=["Hello",91.7,"world",15,100,-10.2]

Here the list ``my_list`` contains two strings, two floats (decimal values), and two integers. We
can access any of the elements in a given list, or any subset of the elements by indexing and
slicing. The elements in a list are all labeled from left to right with an integer index, starting
at zero. For example, the first element in ``my_list`` is ``"Hello"`` which has index ``0``, the second
element is ``91.7`` and has index ``1``, and so on. To access any of the individual objects in the list,
we use a pair of square brackets ``[]`` as in the following example.

>>> my_list[0]
Hello
>>> my_list[4]
100

.. warning::

   An important thing to remember is that Python begins indexing elements of a list starting
   at ``0``. This may seem unusual at first, since humans typically start counting objects with the
   number ``1``.

We can also access elements from the end of a list by using negative numbers.

>>> my_list[-1]
-10.2
>>> my_list[-3]
15

If we would like to access a range of characters in a list, we can slice the list ``L`` using the
notation ``L[start:stop]``, where ``start`` and ``stop`` are both integer index values. Using
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

.. warning::
   
   There is something you will need to be careful about when using lists in Python, and in
   particular when you are trying to copy a list. Suppose I create a list, called ``list_a`` with the
   values ``[1,2,3]``. Suppose I then create a second list ``list_b``, and assign it the value of ``list_a``.
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

Finally, we can change lists in a number of ways. One way is to use the index of a list element
to access that element and to redefine it directly.

>>> my_list=[1,2,3,4]
>>> my_list[2] = -15
>>> print(my_list)
[1,2,-15,4]


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


Conditionals
------------

So far we have enough tools to create functions which perform arithmetic operations and
rearrange lists, but not much else. To define more complicated functions we will need a few
more building blocks. We will end this lab by talking about ``if`` statements, and will learn about
``for`` loops in the next lab. We introduce ``if`` statements with the following example.

.. code-block:: python
   
   if 1<7:
      print("1 is less than 7")
   else:
      print("1 is not less than 7")

All ``if`` statements start with a condition, or question, whose answer may be either ``True`` or
``False``. In our case, this question is asking whether the number ``1`` is less than ``7``. When Python
executes the ``if`` statement it first checks to determine whether the condition is ``True`` or ``False``.
If the condition is ``True`` then Python will continue and execute the code which is contained
immediately below the ``if`` statement line (this code needs to be indented). If, on the other
hand, the condition is ``False``, then Python will jump immediately to the ``else`` line and execute
the indented block of code below it, skipping over any commands in between.

In our case, because 1 is indeed less than 7, Python will execute the line after the ``if`` statement, and will print the following output.

``1 is less than 7``

Note that ``if`` statements do not need to be followed by ``else`` statements. If an ``if`` statement
is not followed by an ``else`` statement, and the condition contained in the ``if`` statement is ``False``,
then the code won't do anything:

.. code-block:: python

   if 1>7:
      print("1 is greater than 7")  #This won't execute since 1>7 is False.


Notice that we can also write ``if`` statements that contain more than one step. Every step that
we want to be evaluated should be indented beneath the ``if`` line or the ``else`` line (depending on
if we want it to be evaluated when the condition is ``True`` or ``False`` respectively).

What will the following code output? And what will the value of ``a`` be when the code is finished executing?

.. code-block:: python

   a=-5
   
   if a==7:
      print("a was equal to 7")  # Both of these indented lines will be
      a=4                        # evaluated if a is equal to 7.
   else:
      print("a was not equal to 7") # Both of these indented lines will
      a=7                           # be evaluated if a is not equal to 7.



The most important use of conditional statements is in function definitions.
Consider the following functions.

.. code-block:: python
   
   def f(x):
      if x < 0:
         return 0
      else
         return x

Every time we call the function ``f(x)`` only one of the two ``return`` statements is
being executed, while the other is simply skipped over depending on whether the ``if`` evaluates
the condition to be ``True`` or ``False``.

>>> f(7)
7
>>> f(-100)
0


Task 6
------

Write a function called ``absolute_value(x)`` which accepts as input a single
number ``x``, and returns the absolute value of ``x``.

>>> absolute_value(10)
10
>>> absolute_value(-10)
10


Compound Conditions
-------------------


To test more complicated conditions it is useful to use the ``and`` and ``or`` operators. The statement ``P and Q`` will return ``True`` only if both ``P`` and ``Q`` are ``True``. If either one of, or both of, ``P`` and
``Q`` are ``False``, then the statement ``P`` and ``Q`` will return ``False``.


.. code-block:: python
   
   (10<11) and (-3>=-12)   # This will return True because both (10<11) and (-3>=-12) are True.
   (10<11) and (-3==-12)   # This will return False because one of the statements is False.
   (10==11) and (-3==-12)  # This will also return False because both of the statements are False.


The statement ``P or Q``, on the other hand, will return ``True`` if at least one of, or both of, ``P``
and ``Q`` are true. The only situation in which ``P or Q`` will return False is if both ``P`` and ``Q`` are
False.

.. code-block:: python

   (10<11) or (-3>=-12)    # This will return True because at least one of the statements is True.
   (10<11) or (-3==-12)    # This will return True because at least one of the statements is True.
   (10==11) or (-3==-12)   # This will return False because both of the statements are False.


Task 7
------


Define a function, called ``indicator(lower,upper,n)`` which accepts as input
three numbers ``lower``, ``upper``, and ``n``, with ``lower <= upper``, and returns ``1`` if the number ``n``
satisfies ``lower <= n <= upper``, and returns ``0`` otherwise.

>>> indicator(3,7,2)
0

>>> indicator(-3,9,8)
1



Task 8
------


Define a function, called ``trunc_max(x,y)`` which accepts as input two numbers
``x``, ``y``, and returns the larger of the two numbers if at least one of them is positive, and
returns ``0`` otherwise.

>>> trunc_max(3,-5)
3
>>> trunc_max(2,7)
7
>>> trunc_max(-173,-21)
0

.. hint::

   You may need to use multiple ``if`` statements, possibly nested inside each other. Remember that every time you call an ``if`` statement, you need to indent the code inside the
   ``if`` statement.
   Here is some "pseudocode" to get you started:

   .. code-block:: console

      if both numbers are negative:
         return 0
      else:
         if the first number is larger than the second:
            return the first number
         else:
            return the second number











