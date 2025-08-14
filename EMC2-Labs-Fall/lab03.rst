Lab 3: Introduction to Python, Part III
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
Functions can get confusing sometimes, especially when written by someone else. Python has a convention called a docstring which allows you to write a description of what a function does, what the parameters are, and what the return value is. Writing docstrings is a good practice to get into, especially when you are writing functions that will be used by other people.

.. code:: python

    def functionName(parameter1, parameter2, parameter3):
        """
        This is called a docstring.
        
        It is a note about what the function does and gives more details about its parameters and return values. It may look like this:
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

        # the actual code replaces "pass"
        pass    # pass makes it so no error's occur when an empty function is run

Task 1
------

Complete all of the following functions according to the instructions in their docstrings. This will be a review of the past two Python labs. Feel free to look up the documentation and/or examples for anything you've forgotten or haven't learned yet. (For example, it will probably help to look up the modulo operator.)

Function: ``last_two_deleted``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

    def last_two_deleted(num):
        """Deletes the last two digits.

        This function takes num and removes the last two digits and returns the result. If the number is only two digits long, it will return 0.

        Parameters:
        num : int
            The number to process

        Returns:
        result : int
            The trimmed number
        """

        # Tip: Use integer division
        # Replace 'pass' with your code
        pass

>>> last_two_deleted(246810)
2468

Function: ``last_two``
~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

    def last_two(num):
        """Returns the last two digits of a number.

        This function takes num and returns the last two digits. If the number is only one digit long, it will not return any leading 0's (123405 will return 5, not 05).

        Parameters:
        num : int
            The number to process

        Returns:
        result : int
            The trimmed number
        """

        # Tip: Use the modulo operator (% 100)
        # Replace 'pass' with your code
        pass

>>> last_two(246810)
10
>>> last_two(123405)
5

Function: ``first_half``
~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

    def first_half(word):
        """Returns the first half of the word.

        This function takes the word and returns the first half.
        It excludes the middle character if the word has an odd number of characters.

        Parameters:
        word : str
            The word to split

        Returns:
        result : str
            The trimmed word
        """

        # Tip: Use integer division to exclude the middle character
        # Tip: Use the built-in function len(word) to get the length of word
        # Replace 'pass' with your code
        pass

>>> first_half('yourname')
'your'
>>> first_half('diophantine')
`dioph'

Function: ``backward``
~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

    def backward(word):
        """Reverse the order of a word.

        This function takes word and returns the reversed version of it.

        Parameters:
        word : str
            The word to reverse

        Returns:
        result : str
            The reversed word
        """

        # Tip: Use slicing
        # Tip: The step parameter in [start:stop:step] can be negative.
        # Replace 'pass' with your code
        pass

>>> backward('desserts')
`stressed'


Task 2
------

Use some of your previously written functions to help make this more complicated function.

.. code:: python

    def int_to_str26(message):
        """Returns the corresponding set of letters in the alphabet.

        This function takes a number "message" and returns the corresponding letters in the alphabet, i.e.,
        A = 01, B = 02, C = 03, D = 04, ... Z = 26
        It returns an empty string ("") if the integer does not corespond to a letter.

        Parameters:
        message : int
            The number

        Returns:
        result : str
            The corresponding letter in the alphabet
        """

        # Tip: Use a while loop to look at the last two digits of message and convert those digits to a character
        # Repeat this process with a smaller integer message (which is message with the last two digits deleted).
        # Replace 'pass' with your code
        pass

>>> int_to_str26(30120)
`CAT'
>>> int_to_str26(2005192023151804)
`TESTWORD'

Task 3
------

Now do the same, but in reverse.

.. code:: python

    def str_to_int26(message):
        """Returns the number given a string of letters.

        This function takes string "message" and returns the corresponding number, i.e.,
        01 = A, 02 = B, 03 = D, 04 = D, ... 26 = Z
        It always returns a two digit number (01, 04, 26...).

        Parameters:
        message : str
            The string to convert

        Returns:
        result : int
            The corresponding numbers
        """

        # Tip: Use a for loop.
        # Tip: If you prefer, you can keep track of the integer using a string (e.g. '123456')
        # Then convert it to an integer at the end (e.g. int('123456')).
        # Replace 'pass' with your code
        pass

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