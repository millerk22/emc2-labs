Lab 12: Recursion
=================

Recursion, a close cousin to mathematical induction, is an important problem solving technique used in computer programming.
A recursive function is one that calls itself (similar to how a proof by induction uses ``P(n)`` to prove ``P(n+1)``).
Consider the following program that computes the sum of all the integers from ``1`` to ``n``:

.. code-block:: python

   def recursive_sum(n):
       if n==1:
           return 1
       else:
           return n + recursive_sum(n-1)


As with proof by induction, we start with a base case (the ``if`` statement that checks if ``n=1``).
Among other things, this helps ensure that our program will terminate eventually.
The "inductive step" tells the program how to compute the sum up to ``n`` once it knows the sum up to ``n-1``.
Here is what is happening in the background when we call ``recursive_sum(5)``:

.. code-block:: console

   recursive_sum(5) = 5 + recursive_sum(4)
                    = 5 + (4 + recursive_sum(3))
                    = 5 + (4 + (3 + recursive_sum(2)))
                    = 5 + (4 + (3 + (2 + recursive_sum(1))))
                    = 5 + (4 + (3 + (2 + (1))))


Once the base case is reached, the recursion terminates and the whole stack is evaluated.
Then ``recursive_sum(5)`` returns ``15``, which is the sum of all the integers between ``1`` and ``5``.


Task 1
------

Recall that the factorial function is defined on nonnegative integers as

.. math::
   n! = 
   \begin{cases}
      1 & \text{ if } n=0, \\
      n \cdot (n-1)! & \text{ if } n\geq 1.
   \end{cases}
   
   
Write a function ``fac(n)`` that computes ``n!`` recursively. Your program should raise a ``ValueError`` if the input is not a nonnegative integer.

   
>>> fac(7)
5040
>>> fac(30)
265252859812191058636308480000000
   
   

Task 2
------

In section 15.C of the `Math 290 textbook <https://mathdept.byu.edu/~doud/Transition/Transition.pdf>`_ an algorithm is given (in the form of the proof of Proposition 15.3) to compute the binary expansion of a given integer.
The idea is:

.. code-block:: console
   
   the binary expansion of 1 is `1'
   if n is odd:
     the binary expansion of n is [binary expansion of (n-1)/2] followed by '1'
   if n is even: 
     the binary expansion of n is [binary expansion of n/2] followed by '0'
   
If you are unfamiliar with binary arithmetic, see `<https://en.wikipedia.org/wiki/Binary\_number\#Counting\_in\_binary>`_

Note that if the binary expansion of a number ends in a zero (e.g. ``14=1110``) then dividing by ``2`` simply removes the rightmost bit (``7=111``). 
Similarly, if the binary expansion of a number ends in a one (e.g. ``5=101``) then the function ``x -> (x-1)/2`` simply removes the rightmost bit (``2=10``).

   
Write a function ``binary(n)`` that returns the binary expansion of ``n`` as a string. 
Your program should raise a ``ValueError`` if the input is not a positive integer.

   
>>> binary(45)
'101101'
>>> binary(2**30)
'1000000000000000000000000000000'
   
   

Task 3
------

The Fibonacci numbers are a collection of natural numbers labeled

.. math::
   F_1, F_2, F_3, \ldots

and defined by the rule

.. math::
   F_1 = F_2 = 1

and for :math:`n \geq 3`,

.. math::
   F_n = F_{n-1} + F_{n-2}.


   
Write a function ``fib(n)`` that recursively computes the ``n``-th Fibonacci number :math:`F_n`. Your program should raise a ``ValueError`` if the input is not a positive integer.

   
>>> fib(15)
610
>>> fib(30)
832040
   
   

Task 4
------

Follow the proof of Proposition 14.6 in the Math 290 textbook to write the following function computing power sets.

   
Write a function ``power_set(S)`` that recursively computes the power set of a given set of integers, input as a list ``S``. 
The order of the resulting list does not matter.

   
>>> power_set([1,2,3])
[[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]
>>> power_set([])
[[]]
   

*Hint 1*: the ``append()`` function is probably not helpful here, since it does not return a new list. You might try using the code 

``L = L+[a]`` 

to add the element ``a`` to the list ``L`` and return the result.

*Hint 2*: another way to state the idea in Proposition 14.6 is to say that: given ``a`` in ``S``,

.. math::
   \mathcal P(S) = \mathcal P(S-\{a\}) \bigcup \{X\cup \{a\} : X\in \mathcal P(S-\{a\})\}.

In Python, if ``a=S[0]``, this might look like:

.. code-block:: python

   power_set(S) = power_set(S[1:]) + [x+[a] for x in power_set(S[1:])]


   

