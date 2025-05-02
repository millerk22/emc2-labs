Lab 3: Introduction to Python, Part III
=======================================

One of the most important skills you can learn for any programming language is how to look up documentation and examples online.
For Python, there is an excellent tutorial here:

`https://docs.python.org/3/tutorial/index.html <https://docs.python.org/3/tutorial/index.html>`_
   
Go to that site and visit ``3.2 First steps toward programming``.
This will teach you about ``while`` loops.
Now do a Google search for "python while loop" and read some of the examples that come up.
Throughout this course, remember: Google is your friend.



Task 1
------

Do the following problems to review what you learned during the two introductory labs. Feel free to look up the documentation and/or examples for anything you've forgotten or haven't learned yet. (For example, it will probably help to look up the modulo operator.)

Write a function ``last_two_deleted(num)`` that accepts a positive integer ``num`` and returns the integer with the last two digits deleted.
The function should return zero if the input is in the range ``[1,99]``.
Use integer division.

>>> last_two_deleted(246810)
2468


Write a function ``last_two(num)`` that accepts a positive integer ``num`` and returns the last two digits (as an integer).
The function should return a one-digit integer if the second-to-last digit is zero.
Use the modulo operator ``% 100``.

    
>>> last_two(246810)
10


Write a function called ``first_half(word)``, which should accept a string parameter ``word`` and return the first half of it, excluding the middle character if the string has an odd number of characters (use integer division for this).
Use the built-in function ``len(word)`` to get the length of ``word``.



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

