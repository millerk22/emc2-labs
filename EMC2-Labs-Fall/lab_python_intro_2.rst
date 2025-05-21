Lab 8675309: Introduction to Python, Revisited
==============================================
.. topics to cover lambda functions, array broadcasting, vectorization, plotting, try except, type declarations/docstrings in functions, f-strings (and .join, and \ with ""), dictionaries, modules
.. possibly move List comprehension here, but probably not....
.. map, filter, or sorted?

This lab covers additional topics in Python and NumPy that can help your coding to be more efficient.

Lambda Functions
----------------

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
The try/except block is used for catching errors in code blocks without breaking the entire program.

.. code:: python
    def divide():
        try:    # without the try/except block, we would just get a ZeroDivisionError
            1/0
        except:
            print("An error occurred.")
            
>>> divide()
An error occurred.

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

F-Strings
---------

Dictionaries
------------
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

Modules
-------

Array Broadcasting
------------------

Vectorization
-------------

Plotting
--------
