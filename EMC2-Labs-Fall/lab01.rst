Lab 1: Introduction to Python, Part I
=====================================

What is Programming?
--------------------

When first starting to learn how to code, it can be difficult to grasp the big ideas behind programming. Think of it like having a robot that can do anything, but only if you tell it *exactly* what to do and how to do it. You need to understand how the computer thinks so you can write instructions that it will understand. A great example of this can be found `here <https://youtube.com/shorts/mrmqRoRDrFg?si=ga23ojvoho0V5Rz5>`_.

These first few labs will be all about understanding how computers think and what language we use to communicate with them, in this case, Python.

This lab is adapted from Math 215 Lab 1.

Setting up Google Colab
-----------------------

In these labs we will be using Python, which is a powerful, general-purpose programming language that is widely used in science and engineering. 
It is a great first language to learn for beginners to computer programming!
Python has many other tools (called **libraries** and **packages**) available that make it a powerful tool for scientific computing and applied mathematics.
There are several ways to write programs in Python. 
In these labs we will be using Google's Colaboratory notebooks to write our code and create the files we will submit for grading. 
This allows us to write and run Python programs in an internet browser without the hassle of downloading and installing Python on our computers. 
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
~~~~~~~~~~~~~~~~~~~~~

Once you've created a new notebook you'll notice a little box to enter your code underneath the various menus. 
This is called a ``cell``, and it is the basic building block of a Colab notebook.
Any code that you want to execute in a notebook must be placed in a cell.

In your notebook type the following into the cell:

>>> print("Hello World!")

.. note::
   ``>>>`` indicates that the code that follows should be typed into a cell.

As you might expect, this is a command which tells the notebook to display the phrase ``Hello World!`` below the cell. 
In order to tell Python to actually perform this command, we must execute the cell by holding down the Shift button and pressing Return/Enter or by clicking the run button in the upper left of the cell.

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
Hello World!
>>> print("I'm hungry.")
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

Perhaps the most basic use of Python is as a fancy calculator, with all of the standard arithmetic operations defined: ``+``, ``-``, ``*`` (for multiplication), and ``/``. 
Python follows the usual order of mathematical operations, including the use of parentheses. 
For example, to compute :math:`15 × 3 − 81 ÷ 9`, we would enter

>>> 15 * 3 - 81 / 9
36.0

We can compute exponentiation using the ``**`` operator. 
For example, we can compute :math:`2^5`  by typing the following.

>>> 2**5
32

   Practice: Compute the values of :math:`(13 − 17) × 6` and :math:`2^3 + 21` in your practice notebook. 
   You should get ``-24`` and ``29`` respectively as your answers.

.. note::
   In Python, ``**`` is used for exponentiation. A common mistake is to use ``^``, which is used in things like LaTeX (which you will learn about later) to represent exponentiation.

Output and Print Statements
~~~~~~~~~~~~~~~~~~~~~~~~~~~

As mentioned above, we can include as many statements as
we want in a single cell by putting each of them on a separate line. Notice, however, that only
the result of the final command is included in the output displayed underneath the cell:

>>> 11+1
>>> 12-11
>>> 3*7
>>> 15 // 3
5

If we'd like to see the output of multiple commands we can use the ``print()`` command to make
sure that those commands are included in the output display.

   Practice: Enter the following commands in a cell, and execute them. What output do you see?

   >>> print(11 + 1)
   >>> print(12 - 11)
   >>> print(3 * 7)
   >>> print(15 // 3)

Variables
~~~~~~~~~

Just like in mathematics, a **variable** in Python is a placeholder for some value. For
example, we can define a variable called ``a`` and assign the value ``2`` to it simply by executing the
following code:

>>> a = 2

To see the value of ``a``, we have a few options:

>>> a
2
>>> print(a)
2

Now, the variable ``a`` can be used in other cells within this notebook, and
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

Notice how whenever we use ``=``, the value of ``a`` changes.

Sometimes it is useful to swap the values of given variables. 
Run the following code in your Colab notebook:

>>> x = 2
>>> y = 5
>>> x = y
>>> y = x
>>> print(x,y)

You may have noticed that this does **not** work. Walk through the code and think about why.

To properly swap variables, we have to introduce a
"placeholder" variable as follows:

>>> x = 2
>>> y = 5
>>> print(x, y)
2 5
>>> temporary_variable = x
>>> x = y
>>> y = temporary_variable
>>> print(x, y)
5 2

This will store the value of ``x`` in ``temporary_variable`` before reassigning ``x``. So our original ``x`` value is saved!

   Pratice: Enter the following commands into a cell. What do you expect the output will be? Now, execute the cell and check your answers.

   >>> b=5
   >>> print(b)
   >>> b=b+7
   >>> print(b)
   >>> b=3*(5-b)
   >>> print(b)

Task 1
------

Enter the expression 

.. math::
   \frac{118+11\times 2}{9-2}

and store it as a variable called ``my_first_var``.
Remember to use parentheses to ensure that the order of operations is correct.
Don't just save the numerical value of this expression,
which is ``20``. Save the actual expression with the addition, multiplication, division, subtraction, and parentheses as the variable.

Python Types
------------

One import thing you need to understand about Python is how it uses **types**. We can think of a type like a real world category. For example, you may cook a pancake, but you definitely don't cook a waterbottle. You may drink from a waterbottle, but not a pancake. Categories, or types, tell us what we can do with objects. So far, you have seen four out of five main Python types, and we will introduce the last one later in this lab.

.. list-table:: Python Types
    :widths: 25 25 25 25
    :header-rows: 1

    * - Name
      - Python Name
      - Description
      - Examples
    * - **Integer**
      - ``int``
      - Numbers without a decimal point, similar to integers in mathematics.
      - ``1``, ``24``, ``0``, ``8675309``
    * - **Floating Point Number**
      - ``float``
      - Numbers with a decimal point, similar to the real numbers in mathematics.
      - ``3.14``, ``1.0``, ``123.456``
    * - **Boolean**
      - ``bool``
      - Either ``True`` or ``False``, pronounced "boo-lee-in", named after `George Boole <https://en.wikipedia.org/wiki/George_Boole>`_
      - ``True``, ``False``
    * - **String**
      - ``str``
      - Words, sentences, or even individual characters.
      - ``Hello World``, ``a``, ``BYU!``

.. note::
    You may have noticed that earlier when we evaluated the expression ``15 * 3 - 81 / 9``, we got ``36.0``, not ``36``. This is because the division operator (``/``) always returns a ``float`` type in Python, even when both dividend and divisor are ``int``\s.

    If we want to force the output to be an ``int`` we can use integer division (``//``) instead:

    >>> 15 * 3 - 81 // 9
    36

    ``//`` is also called floor division because it "floors" any number by removing the decimal at the end of the operation. This is a really useful tool, but is generally not used when performing arithmetic operations.

    >>> 7 / 2
    3.5
    >>> 7 // 2
    3

To figure out what type a variable or value is, you can use ``type()``.

    Practice: Put this code into a cell in your Colab notebook and run the cell. See if you can figure out what type each variable is, then, call ``type()`` on each variable and see if you are right!

    >>> name = "Alice"
    >>> pi = 3.14
    >>> likes_pizza = True 
    >>> age = 16

    For exmaple, to figure out the type of ``name``, you would do ``type(name)``.

Each of these data types operate differently from the others. We will get into what you can do with each type later, but for right now, you just need to know what each type looks like.

Booleans and Comparison Operators
---------------------------------

Earlier you learned about symbols like ``+``, ``-``, ``*``, ``/``, ``**``, and ``=`` that work for ``int``\s and ``float``\s. We can also use Python operators to compare values. For example, ``<`` and ``>`` unsurprisingly represent our less than and greater than symbols. We can alsue use ``<=`` and ``>=`` to test quantities that are less than or equal to, or greater than or equal to each other. 

>>> a = 5
>>> print (7 <= a)
False
>>> print(a < 10)
True

Python has the ``==`` operator which tests if two values are equal in value.

>>> print(a == 5)
True

Notice that the commands ``a=5`` and ``a==5`` have different meanings. ``=``means we are assigning the value of ``5`` to the variable ``a``, while in ``==`` means we are checking the value of ``a`` and testing if it equals the number ``5``. This is a very important difference in Python syntax.

   Practice: What will the output of the following cell be?

   >>> c = -5
   >>> c = c + 3
   >>> print(c == -5)
   >>> print(c >= 1)
   >>> print(c == -2)

Notice that comparison operators return boolean types (``True`` or ``False``).



Conditionals
------------

So far we have enough tools to perform arithmetic operations and compare numbers. To define more complicated operations we will need a few more building blocks. One of these is the ``if`` statement.

.. code-block:: python
   
   if 1<7:
      print("1 is less than 7")
   else:
      print("1 is not less than 7")

All ``if`` statements start with a condition, or question, whose answer is a boolean value (``True`` or
``False``). In our case, this question is asking whether the number ``1`` is less than ``7``. When Python
executes the ``if`` statement it first checks to determine whether the condition is ``True`` or ``False``.
If the condition is ``True`` then Python will continue and execute the code which is contained
immediately below the ``if`` statement line (this code needs to be indented). If the condition is ``False``, then Python will jump immediately to the ``else`` line and execute
the indented block of code below it, skipping over any commands in between.

In our case, because 1 is indeed less than 7, Python will execute the line after the ``if`` statement, and will print the following output.

``1 is less than 7``

Note that ``if`` statements do not need to be followed by ``else`` statements. If an ``if`` statement
is not followed by an ``else`` statement, and the condition contained in the ``if`` statement is ``False``,
then the code won't do anything:

.. code-block:: python

   if 1>7:
      print("1 is greater than 7")  # This won't execute since 1>7 is False.


Notice that we can also write ``if`` statements that contain more than one step. Every step that
we want to be evaluated should be indented beneath the ``if`` line or the ``else`` line (depending on
if we want it to be evaluated when the condition is ``True`` or ``False`` respectively).

What will the following code output? And what will the value of ``a`` be when the code is finished executing?

.. code-block:: python

    a = -5
   
    if a == 7:
        print("a was equal to 7")       # Both of these indented lines will be
        a = 4                           # evaluated if a is equal to 7.
    else:
        print("a was not equal to 7")   # Both of these indented lines will
        a = 7                           # be evaluated if a is not equal to 7.
    
    print(a)



Functions
---------

In computer programming, like in mathematics, a function is something that accepts
input values (called parameters) and produces an output. Functions are one of the core building blocks of programming.
In Python we illustrate how to define simple functions with the following example.

Type the following into a cell, and execute it.

.. code-block:: python

   def reciprocal(n):
      return 1/n  # calculate the reciprocal

Here we have defined a function called ``reciprocal``, which has a single input parameter ``n``. The
first line of the function definition begins with ``def``, followed by the name of the function, the
parameters it accepts in parentheses, and ends with a colon. Each line in the remainder of
the function **must be indented** (which Colab will do for you automatically), and the function
definition ends with a ``return`` statement that defines what the output of the function will be.
Any Python function will follow this same format.

Any text written on the same line after a ``#`` is called a comment. It will be ignored by Python and is useful for documenting specifics of how a segment of code works.

To use a function, we use ``()`` to "call" it. Inside the parenthesis, we put our input parameters.
In the case of our function ``reciprocal``, we can give it a single value ``n`` as its input.
We should expect the return value to be ``1/n``.

>>> reciprocal(13)
0.07692307692307693

You can even pass variables into functions

>>> a = 2
>>> reciprocal(a)
0.5

A unique feature with ``return`` is that it allows you to do things with the output of a function.
For example, we can create a variable from the return value of a function:

>>> a = 2
>>> b = reciprocal(a)
>>> b
0.5

A key difference between returning a value from a function and just printing it is that when we return we
can use the value (as shown above), while when we print, the value is discarded after it printed.

.. warning::

   What do you think will happen if we try:

   >>> reciprocal(0)

   You should have received an error message when you tried to evaluate ``reciprocal(0)``,
   as a result of trying to divide by zero. Python will produce an error message anytime you try to
   execute code that violates one of its rules. These error messages contain important information about what went wrong and where. Learning how to read them is an important skill to have when programming.
   
   Just because you don't get an error message when you execute some code doesn't mean that it code is doing what you want it to be doing. This is why we will always test our code with various input values. If you have ever had a page crash, weird characters on a website, or infinte loading pages, then you have experienced code with some type of errors in it.


Our functions can also include multiple inputs (called parameters). We can also define new variables inside
of a function. In this case, each step in the function should be on its own line, indented from
the first line of the function.


   Practice: Define the following function in your practice notebook. Remember to indent all of the
   lines in the function definition from the second line on! Proper use of indentation and
   whitespace is very important in Python.

   .. code-block:: python

      def arithmetic(i, j):
         k = i + 2
         l = k * j
         w = k - 5
         return w

   What output do the following commands produce? (Try to figure it out before you run the code.)

   >>> print(arithmetic(3, 4))
   >>> print(arithmetic(-10, 1))

Combining functions with things like conditionals enables us to do a lot more.
Consider the following function.

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

The great thing about functions is that once they are written, we can use them over and over and we don't need to worry so much about the details about how they work, just what they do.

.. admonition:: Lab Instructions

   Until this point, all of the code you've written should be in your ``Sandbox`` notebook.
   Create a new notebook called ``Lab01``. 
   In these labs, the code you'll turn in for credit will be labeled ``Task``.
   Write the code for each Lab 1 task in your ``Lab01`` notebook. 
   For future labs, create a new notebook each time.

Task 2
------

Define a function called ``arithmetic2(i, j)`` which does exactly the same thing
as the function ``arithmetic(i, j)`` defined above, but which only has a ``def`` line and
a ``return`` statement. In other words, write a function that does the exact same thing as
``arithmetic(i, j)``, but which fits in only two lines of code.

.. admonition:: Test your Code
   
   Whenever you are instructed to write a function in these labs, we will include some test code that you can run to make sure your code is working properly.
   This is a very important step in programming -- don't skip it!

   >>> arithmetic2(3, 4)
   0
   >>> arithmetic2(-10, 1)
   -13

Task 3
------

Write a function called ``absolute_value(x)`` which accepts as input a single
number ``x``, and returns the absolute value of ``x``.

>>> absolute_value(10)
10
>>> absolute_value(-10)
10

Task 4
------
Define a function called ``avg(x,y)`` which takes two values ``x`` and ``y`` as input, and outputs the mean of ``x`` and ``y``. Recall that the *mean* of two numbers :math:`a` and :math:`b` is defined to be :math:`(a+b)/2`.

>>> avg(10, 30)
20
>>> avg(5, 25)
15.0



Compound Conditions
-------------------


To test more complicated conditions it is useful to use the ``and`` and ``or`` operators. The statement ``P and Q`` will return ``True`` only if both ``P`` and ``Q`` are ``True``. If either one of, or both of, ``P`` and
``Q`` are ``False``, then the statement ``P`` and ``Q`` will return ``False``.

.. raw:: html

   <div style="text-align: center">

.. code-block:: python
   
   (10<11) and (-3>=-12)   # This will return True because both (10<11) and (-3>=-12) are True.
   (10<11) and (-3==-12)   # This will return False because one of the statements is False.
   (10==11) and (-3==-12)  # This will also return False because both of the statements are False.


.. list-table:: ``And`` Truth Table
    :widths: 33 33 34
    :header-rows: 1
    :align: center

    * - P
      - Q
      - P and Q
    * - True
      - True
      - True
    * - True
      - False
      - False
    * - False
      - True
      - False
    * - False
      - False
      - False

.. raw:: html

   </div>

The statement ``P or Q``, on the other hand, will return ``True`` if at least one of, or both of, ``P``
and ``Q`` are true. The only situation in which ``P or Q`` will return False is if both ``P`` and ``Q`` are
False.

.. code-block:: python

   (10<11) or (-3>=-12)    # This will return True because at least one of the statements is True.
   (10<11) or (-3==-12)    # This will return True because at least one of the statements is True.
   (10==11) or (-3==-12)   # This will return False because both of the statements are False.

.. raw:: html

   <div style="text-align: center">

.. list-table:: ``Or`` Truth Table
    :widths: 33 33 34
    :header-rows: 1
    :align: center

    * - P
      - Q
      - P or Q
    * - True
      - True
      - True
    * - True
      - False
      - True
    * - False
      - True
      - True
    * - False
      - False
      - False

.. raw:: html

   </div>

Task 5
------


Define a function, called ``indicator(lower,upper,n)`` which accepts as input
three numbers ``lower``, ``upper``, and ``n``, with ``lower <= upper``, and returns ``1`` if the number ``n``
satisfies ``lower <= n <= upper``, and returns ``0`` otherwise.

>>> indicator(3,7,2)
0
>>> indicator(-3,9,8)
1



Task 6
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




Strings
-------
A **String** is a sequence of characters, such as words or sentences, surrounded by quotes. You can use either single quotes ``'...'`` or double quotes ``"..."`` to define a string.

>>> greeting = "Hello, world!"
>>> greeting
'Hello, world!'
>>> print(greeting)
Hello, world!
>>> name = 'Alice'
>>> name
'Alice'

Notice that printing a string shows it without the quotes.

You can combine (concatenate) strings using the ``+`` operator:

>>> full_greeting = greeting + " My name is " + name
>>> print(full_greeting)
Hello, world! My name is Alice

You can also find the length of a string using ``len()``

>>> len(name)
5

Strings support a feature called **indexing** which allows you to access individual characters by using square brackets ``[]``.

>>> name[0]
'A'
>>> name[1]
'l'
>>> full_greeting[5]
','
>>> greeting[12]
'!'

.. warning::

   Python begins indexing elements of a string starting at ``0``. This may seem unusual at first, since humans typically start counting objects with the number ``1``.

Task 7
------

Write a function ``print_len(my_string)`` that takes in a ``str`` called ``my_string``. This function should **print** "``The length of the string is: length``" where "``length``" is the actual length of the string.

>>> print_len("")
The length of the string is: 0
>>> print_len("Hello World!")
The length of the string is: 12

Task 8
------
Write a function ``last_character(my_string)`` that takes in a ``str`` called ``my_string``. It should **return** the last character in the string.

>>> last_character("Hello World!")
'!'
>>> last_character("Kevin")
'n'

.. hint::

    If there are :math:`n` characters in a string, the index of the last one is :math:`n - 1`.

Lists
-----

So far, we have seen the ``int``, ``float``, ``bool``, and ``str`` data types.
Another very important data type in Python is the ``list`` data type. A list is an ordered
collection of objects (which can be numbers, strings, or even other lists), which we specify by
enclosing them in square brackets ``[]``.

>>> my_list=["Hello", 91.7, "world", 15, 100, -10.2]

Here the list ``my_list`` contains two strings, two floats (decimal values), and two integers. The benefit of lists is that we can store lots of data and access it easily because lists, like strings support indexing: each entry is associated with an index starting at 0.

>>> my_list[0]
Hello
>>> my_list[4]
100
>>> my_list[5]
-10.2

.. warning::

   Remember, Python indexing starts at 0, not 1.

We will learn more about lists in the next lab.

Task 9
------

Write a function, ``median(a)``, that finds the median of sorted list ``a`` with an odd number of elements.

>>> a = [1, 2, 3, 4, 5]
>>> median(a)
3
>>> median([1, 2, 3, 4, 5, 6])
3.5


Review
------

Congrats on making it through your first Python lab of this class! Here is a quick summary of what we have learned:

- printing in Python
- arithmetic in Python
- variables
- integers and floats
- booleans and comparison operators
- conditionals
- functions
- compound conditionals
- strings
- lists

We have covered a lot here so don't worry if not all of it is sticking right now. We will review and build off of these topics in future labs.