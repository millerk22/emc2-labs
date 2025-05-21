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

Lambda functions are frequently used as parameters in other functions. For example, the ``map(func, a)`` function in Python exectues ``func`` on every element in ``a``. ``a`` can be anything you can iterate over (like a list, or a string).

This will capitalize every letter in a word

>>> x = map(lambda letter: letter.upper(), ["hello", "world"])
>>> x = x.list()    # convert it to a list for readability
>>> print(x)
'HELLO WORLD'

Try/Except
------------------

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
