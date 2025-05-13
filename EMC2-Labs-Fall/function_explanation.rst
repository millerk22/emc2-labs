This would go right before task one in lab 3. Then we would convert lab 3 to the docstring format.


Lab 3: Introduction to Python, Part III
=======================================

One of the most important skills you can learn for any programming language is how to look up documentation and examples online.
For Python, there is an excellent tutorial here:

`https://docs.python.org/3/tutorial/index.html <https://docs.python.org/3/tutorial/index.html>`_
   
Go to that site and visit ``3.2 First steps toward programming``.
This will teach you about ``while`` loops.
Now do a Google search for "python while loop" and read some of the examples that come up.
Throughout this course, remember: Google is your friend.

More about functions
--------------------
Functions can get confusing sometimes, especially when you don't know what parameters tyey take in and what they return (if anything). Fortunately, Python has some conventions to help make these things more clear.

.. code:: python
    
    def functionName(parameter1: type, parameter2: type, parameter3: type) -> returnType:
        """
        This is called a docstring.
        
        It is a note about what the function does and gives more details about the parameters and return values. It may look like this:
        Parameters:
        parameter1 : type
            This parameter is ...
        parameter2 : type
            This prameter is ...
        ...

        Returns:
        name : type
            The return value is ...
        ...
        """
        # the actual code goes down here

    # for example

    def multiply(a: int, b: float) -> float:
        """
        A multiply function.

        This function will multiply two numbers together. It handles decimal numbers as well.

        Parameters:
        a : int
            The first operand
        b : float
            The second operand

        Returns:
        result : float
            The result of a * b
        """
        return a * b

.. Warning::
    Python doesn't actually care if you return a ``float`` or a ``string`` or a ``numpy.ndarray``. These features are mostly for documentation and not double checking.

Task 1
------

Complete the following functions to review what you learned during the two introductory labs. Feel free to look up the documentation and/or examples for anything you've forgotten or haven't learned yet. (For example, it will probably help to look up the modulo operator.)

.. code:: python

    def last_two_deleted(num: int) -> int:
        """Deletes the last two digits.

        This function takes num and removes the last two digits and returns the result. If the number is only two digits long, it will return 0.

        Parameters:
        num : int
            The number to process

        Returns:
        result : int
            The trimmed number
        """

        # Your code here
        # Tip: Use integer division

>>> last_two_deleted(246810)
2468


.. code:: python

    def last_two(num: int) -> int:
        """Returns the last two digits of a number.

        This function takes num and returns the last two digits. If the number is only one digit long, it will not return any leading 0's (123405 will return 5, not 05).

        Parameters:
        num : int
            The number to process

        Returns:
        result : int
            The trimmed number
        """

        # Your code here
        # Tip: Use the modulo operator (% 100)

>>> last_two(246810)
10
>>> last_two(123405)
5

.. code:: python

    def first_half(word: str) -> str:
        """Returns the first half of the word.

        This function takes the word and returns the first half. It excludes the middle character if the word has an odd number of characters.

        Parameters:
        word : str
            The word to split

        Returns:
        result : str
            The trimmed word
        """

        # Your code here
        # Tip: Use integer division to exclude the middle character
        # Tip: Use the built-in function len(word) to get the length of word

>>> first_half('kevin_miller')
'kevin_'
>>> first_half('diophantine')
`dioph'





Write a function called ``backward(word)``, which should accept a string parameter ``word`` and reverse the order of its characters using slicing, then return the reversed string.
The ``step`` parameter in ``[start:stop:step]`` can be negative.

>>> backward('desserts')
`stressed'


Task 2
------

Use some of your previously written functions to help make this more complicated function.


Write a function ``int_to_str26(m)`` that, given an integer ``m``, returns the corresponding string in the 26 character alphabet
   ``A = 01, B = 02, C = 03, D = 04,... Z = 26``

(for example, ``250519`` is the word ``YES``)
or returns an empty string if the integer does not correspond to a string.
Use a ``while`` loop to look at the last two digits of ``m`` and convert those digits to a character, then repeat with a smaller integer ``m'`` (which is ``m`` with the last two digits deleted).

   >>> int_to_str26(30120)
   `CAT'
   >>> int_to_str26(2005192023151804)
   `TESTWORD'



Task 3
------

Now do the same, but in reverse.


Write a function ``str_to_int26(message)`` that, given a string of capital letters ``message``, returns the corresponding integer using the 26 character alphabet.
Use a ``for`` loop.
If you prefer, you can keep track of the integer using a string (e.g. ``'123456'``), then convert it to an integer at the end (e.g. ``int('123456')``).

>>> str_to_int26('CAT')
30120
>>> str_to_int26('DOESTHISFUNCTIONWORK')
415051920080919062114032009151423151811


Challenge Problems
------------------

Visit `projecteuler.net <https://projecteuler.net/>`_. Here you will find many programming challenges that will help you hone your skills (click on Archives). If you would like to, make a free account to track your progress.
If there is still time remaining, try to solve the following challenge problems, (no credit).

1. Project Euler \#1

2. Project Euler \#5

3. Project Euler \#6

4. Project Euler \#9

