Lab 8675309: Introduction to Python, Revisited
==============================================
.. topics to cover lambda functions, array broadcasting, vectorization, plotting, try except, type declarations/docstrings in functions, f-strings (and .join, and \ with ""), dictionaries, modules
.. possibly move List comprehension here, but probably not....
.. map, filter, or sorted?

This lab covers additional topics in Python and NumPy that can help your coding to be more efficient.

Lambda Functions
----------------

.. talk about map for the task

Lambda functions are essentially one-time use functions. They look like:

.. code:: python

    lambda arguments: expression

So a simple power lambda function would look like:

.. code:: python

    lambda a, n: a ** n

Lambda functions are frequently used as parameters in other functions. For example, the ``map(func, a)`` function in Python exectues ``func`` on every element in ``a``. ``a`` can be anything you can iterate over (like a list or a string).

This will capitalize every word in a list

>>> x = map(lambda letter: letter.upper(), ["hello", "world"])
>>> x = x.list()    # convert it to a list for readability
>>> print(x)
['HELLO', 'WORLD']

This will capitalize every letter and return a list

>>> x = map(lambda letter: letter.upper(), "helloworld])
>>> x = x.list()    # convert it to a list for readability
>>> print(x)
['H', 'E', 'L', 'L', 'O', 'W', 'O', 'R', 'L', 'D']

Our lambda function ``lambda letter: lett.upper()`` just capitalizes a letter.

.. Note::
    The downside to lambda functions is that they reduce readability. Only use them for very small functions where the functionality is clear.

More Operators
--------------
You are familiar with simple operators like ``+``, ``-``, and ``*``. It is common to take a variable and set it to itself added, subtracted, or multiplied with another number. Python has a syntax for this:

>>> var = 120
>>> var -= 100
>>> var
20

Remember this is the same as ``var = var - 100``. This same syntax works for ``+``, ``*``, ``/``, ``**``, ``%``, and others as well.

Try/Except
------------------
.. arrays of different sizes
The try/except block is used for catching errors in code blocks without breaking the entire program.

.. code:: python

    def divide():
        try:    # without the try/except block, we would just get a ZeroDivisionError
            1/0
        except:
            print("An error occurred")
            
>>> divide()
An error occurred

You can also catch specific errors and chain them together

.. code:: python

    def divide_element(i):
        """Gets the the element at index i from my_list and divides it by 0."""
        my_list = [1, 2, 3]
        try:
            my_list[i]/0
        except IndexError:
            print("Got an Index Error")
        except ZeroDivisionError:
            print("Got a Zero Division Error")

>>> divide_element(10)
Got an Index Error
>>> divide_element(1)
Got a Zero Division Error

There is also an ``else`` block which gets run if no errors are raised in the try block. The ``finally`` block is run at the very end.

.. code:: python

    def divide_element(i, n):
        """Gets the the element at index i from my_list and divides it by n. If there is an error, it returns 0, if not, it returns the the quotient + 10."""
        my_list = [1, 2, 3]
        try:
            val = my_list[i]/n
        except IndexError:
            print("Got an Index Error")
            val = 0
        except ZeroDivisionError:
            print("Got a Zero Division Error")
            val = 0
        else:
            print("Successful")
            val += 10
        finally:
            return val
        
>>> print(divide_element(2, 1))
Successful
13.0
>>> print(divide_element(10, 1))
Got an Index Error
0
>>> print(divide_element(2, 0))
Got a Zero Division Error
0

Type Declarations in Functions
------------------------------

We have talked about functions and docstrings before, but python has an additional way to document the types that functions take in.

.. code:: python

    def add(a: int, b: float) -> float:
        """Adds an int and a float together."""
        return a + b

This simply says that ``a`` should be an ``int``, ``b`` should be a ``float``, and the return value should be a ``float``.

.. Warning::
    Python doesn't actually enforce type declarations in functions. It is purely for documentation purposes.

Additionally, you can have default parameters for functions. This way, the user doesn't need to pass in a parameter.

.. code:: python

    def calculate_force(mass: float, acceleration: float = 9.8) -> float:
        """Returns the force from a given mass an acceleration. The default value for acceleration is 9.8 m/s^2 from gravity."""
        return mass * acceleration

>>> calculate_force(10)
98.0
>>> calculate_force(10, 7)
70

f-strings
---------

.. possibly include r-strings

Python f-strings are an efficient and simple way of formatting strings. They are generally faster more readable than other methods of string fomratting (including concatenation with ``+``).

An f-string is just a string with an ``f`` in front of it. ``{}`` can be used inside f-strings to get the string value of python code.

>>> a = 10
>>> b = 37
>>> print(f"The value of a is: '{a}'")
>>> print(f"The value of a * b is: '{a * b}'")

.. Note::
    In the example above we used single quotes ``''`` inside double quotes ``""``. This is ok because they are different types of quotes.

f-strings also make it possible for fancier formatting. You can learn more about that on the `Python documentation <https://docs.python.org/3/tutorial/inputoutput.html#fancier-output-formatting>`_.

Dictionaries
------------

.. make a dictionary, print it or something like that. Find the lowest grade.

A dictionary is another Python type. It is similar to a list, but it can use any datatype to retrieve another (rather than just an integer index).

Dictionaries contain key-value pairs ie., given a key, we can retrieve a value (but not the other way around).
We access dictionaries using the ``[]`` notation.

>>> my_dict = {"apple": "red", "orange": 12, "blueberry": True}
>>> my_dict["apple"]
'red'
>>> my_dict["orange"]
12
>>> my_dict["blueberry"]
True

To insert or change a value in a dictionary, we use the same notation
>>> my_dict["strawberry"] = "red"
>>> my_dict
{"apple": "red", "orange": 12, "blueberry": True, "strawberry": "red"}
>>> my_dict["apple"] = "green"
>>> my_dict
{"apple": "green", "orange": 12, "blueberry": True}

Here are some useful functions for dictionaries:
- ``len(my_dict)`` the length of the dictionary
- ``my_dict.keys()`` gets all the keys in the dictionary
- ``my_dict.values()`` gets all the values from the dictionary
- ``my_dict.items()`` gets a list of tuples containing the all the keys and values

Importing
---------
At this point, you are familiar with how to import a module in python using

.. code:: python
    import package
    import package as pk

Here are a few other ways to import a module:

* ``from package import function`` will import a specific function or class from a module so you can call it directly (without ``package.function``)
* ``from package import *`` will import all of the functions or classes from a module so you can call them directly. This method is not very common, though.
* ``from package import function as func`` will import a function or class from a module with a nickname so you can call the nickname directly

So far in this class we have been using Google Colab for our projects. Google Colab is convenient because it allows us to write Python code in our browser, it is free to do large computation, and it has lots of Python libraries pre-installed.

When working on a large project it is better to run Python locally on your computer. This is commonly done with an Integrated Development Environment (IDE) like VS Code, PyCharm, or even a simple text editor and the command line. We won't get into this now, but it is important to know that Google Colab is just an intro.

Array Broadcasting
------------------

In Numpy, it does operations on an element by element basis.

vector * vector is the same as scalar * vector

Compares shapes element wise, starts with farthest right dimension. Compatible if dimensions are equal or one is 1. ValueError: operands could not be broadcast together

number of dimenstions (length of shape) does not have to be the same. The result will have the number of dimensions as the array with the greatest number of dimensions. Size of each dimension is the largest of the corresponding dimension.
Missing dimensions are treated as 1

.. condition masking

Vectorization
-------------

.. (n,2) sin of one cos of another
.. (n,2) one is hours, another is minutes. Calculate total time.

Plotting
--------
