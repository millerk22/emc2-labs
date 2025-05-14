Lab 3 DRAFT: Introduction to Python, Part III
=======================================

One of the most important skills you can learn for any programming language is how to look up documentation and examples online.
For Python, there is an excellent tutorial here:

`https://docs.python.org/3/tutorial/index.html <https://docs.python.org/3/tutorial/index.html>`_
   
Go to that site and visit ``3.2 First steps toward programming``.
This will teach you about ``while`` loops.
Now do a Google search for "python while loop" and read some of the examples that come up.
Throughout this course, remember: Google is your friend.

Function Docstrings
--------------------
Functions can get confusing sometimes, especially when you don't know what parameters tyey take in and what they return (if anything). Fortunately, Python has some conventions to help make these things more clear.

.. code:: python

    def functionName(parameter1: type, parameter2: type, parameter3: type) -> return_type:
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

For example, 

.. code:: python

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

Last two deleted:

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

Usage:

>>> last_two_deleted(246810)
2468

Last two:

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

Usage:

>>> last_two(246810)
10
>>> last_two(123405)
5

First half:

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

Usage:

>>> first_half('kevin_miller')
'kevin_'
>>> first_half('diophantine')
`dioph'


Backward:

.. code:: python

    def backward(word: str) -> str:
        """Reverse the order of a word.

        This function takes word and returns the reversed version of it.

        Parameters:
        word : str
            The word to reverse

        Returns:
        result : str
            The reversed word
        """

        # Your code here
        # Tip: Use slicing
        # Tip: The step parameter in [start:stop:step] can be negative.

Usage:

>>> backward('desserts')
`stressed'


Task 2
------

Use some of your previously written functions to help make this more complicated function.

.. code:: python

    def int_to_str26(message: int) -> str:
        """Returns the corresponding set of letters in the alphabet.

        This function takes message and returns the corresponding letter in the alphabet.
        A = 01, B = 02, C = 03, D = 04, ... Z = 26
        It returns an empty string ("") if the integer does not corespond to a letter.

        Parameters:
        message : int
            The number

        Returns:
        result : str
            The corresponding letter in the alphabet
        """

        # Your code here
        # Tip: Use a while loop to look at the last two digits of message and convert those digits to a character, then repeat with a smaller integer message (which is message with the last two digits deleted).

Usage:

>>> int_to_str26(30120)
`CAT'
>>> int_to_str26(2005192023151804)
`TESTWORD'



Task 3
------

Now do the same, but in reverse.

.. code:: python

    def str_to_int26(message: str) -> int:
        """Returns the number given a string of letters.

        This function takes message and returns the corresponding number to the letter in the alphabet.
        01 = A, 02 = B, 03 = D, 04 = D, ... 26 = Z
        It always returns a two digit number (01, 04, 26...).

        Parameters:
        message : str
            The string to convert

        Returns:
        result : int
            The corresponding numbers
        """

        # Your code here
        # Tip: Use a for loop.
        # Tip: If you prefer, you can keep track of the integer using a string (e.g. '123456'), then convert it to an integer at the end (e.g. int('123456')).

Usage:

>>> str_to_int26('CAT')
030120
>>> str_to_int26('DOESTHISFUNCTIONWORK')
0415051920080919062114032009151423151811


Challenge Problems
------------------

Visit `projecteuler.net <https://projecteuler.net/>`_. Here you will find many programming challenges that will help you hone your skills (click on Archives). If you would like to, make a free account to track your progress.
If there is still time remaining, try to solve the following challenge problems, (no credit).

1. Project Euler \#1

2. Project Euler \#5

3. Project Euler \#6

4. Project Euler \#9

