Lab 12: Recursion
=================

Recursion is an important problem solving technique used in computer programming. It is very similar to mathematical induction. To understand the concept, consider this example:

You are at your favorite restaurant on a Friday night and the line has gone out the door into the parking lot. You want to figure out how many people are ahead of you before you try a different restaurant. You could walk down the entire line and count each person as you go, but then you would lose your spot and begin to feel bad about yourself for going out to eat alone on a Friday night. To avoid effort and embarassment, your other option is to ask the person ahead of you how many people are ahead of them. Then they ask the person ahead of them the same question, and the pattern continues all the way down the line until you reach the person at the counter. That person says there are 0 people in front of them. This message is then passed up the line towards you with each person adding one to the count. This is a recursive method. You delegated subtasks to people ahead of you and each person provided a little bit of information at each step.

Recursion is generally implemented in functions in computer programming. If we were to write pesudocode for our restaurant example, it may look something like this:

.. code-block:: python

   def line_count(person):
      if (persons_position == 1):
         return 0
      else:
         return 1 + line_count(person_ahead)

This function essentially asks, "Is the current person the first in line?". If they aren't, then it will go to the person ahead of them, and so on and so forth. Each time this happens, we are adding ``1`` to our count and returning it.

If we had this line:

.. code-block:: console

   You -> Jeff -> Joe -> Peter -> James

and we called ``line_count`` on ``You``, our function would make calls like this:

.. code-block:: console

   line_count(You) = 1 + line_count(Jeff)
                   = 1 + (1 + line_count(Joe))
                   = 1 + (1 + (1 + line_count(Peter)))
                   = 1 + (1 + (1 + (1 + line_count(James))))

At which point, ``line_count`` would see that the position of ``James`` is ``1``. So it would ``return 0`` and the process would continue like this:

.. code-block:: console

                   = 1 + (1 + (1 + (1 + line_count(James))))
                   = 1 + (1 + (1 + (1 + 0)))
                   = 1 + (1 + (1 + 1))
                   = 1 + (1 + 2)
                   = 1 + 3
                   = 4

You may have noticed that we could also have used a ``for`` loop to solve this problem. In theory, every problem that can be done with recursion can be done with iteration. The pseudoceode for an iterative ``line_count`` would look like this:

.. code-block:: python
   def line_count_iter(person):
      count = 0
      while person_ahead is not None:   # while there is a next person
         count = count + 1
         person_ahead = person_ahead_ahead   # set a new person_ahead to the person after person_ahead
      return count

The benefit to recursion is that it makes the code simpler. The iterative version of ``line_count`` is a little unintuitive, while the recursive version is fairly easy to understand.

Hopefully you can see that recursion and induction are cousin concepts. A recursive function is one that calls itself, and proof by induction uses ``P(n)`` to prove ``P(n+1)``.

Writing a Recursive Function
----------------------------

In order to create a valid recursive function, three things must be present: 

#. Base Case: What is the solution to the smallest problem?
#. Recursive Case: How do we break up our problem into smaller problems? (This can also be thought of as the inductive step.)
#. Conditional Statement: When do we stop? How we know if we are at the base case or the recursive case?

For ``line_count``, the base case is ``return 0`` for when a person is at the front of the line. The recursive case is ``return 1 + line_count(person_ahead)`` where we add one person in our return chain and call ``line_count`` on the next person. The conditional statement is ``if (persons_position == 1):`` which checks if we are at the front of the line or not.

.. warning::
   The base case is crucial! Without a base case, recursive functions will go on forever until you get a Stack Overflow error.

Consider another piece of code that computes the sum of all the integers from ``1`` to ``n``:

.. code-block:: python

   def recursive_sum(n):
       if n==1:
           return 1
       else:
           return n + recursive_sum(n-1)

.. make this a task?

Task 1
------

Turn to a neighbor and discuss which line is the base case, recursive case, and conditional statement.

Write out the different calls ``recursive_sum(5)`` will make. This should look something like when we called ``line_count`` on ``You``.

"If all you have is a hammer, everything looks like a nail." - Abraham Maslow
-----------------------------------------------------------------------------

Recursion is perfectly suited for certain cases, but be careful to not overuse it for all cases.

.. list-table::

   :widths: 50 50
   :header-rows: 1

   * - Feature
      - Recursion
      - Iteration (for or while loops)
   * - **Code Attributes**
      - Tends to have shorter and simpler code
      - Sometimes easier to write
   * - **Efficiency**
      - Less efficient
      - Frequently more efficient
   * - **Use Cases**
      - Good for when you don't know how big something is (think the restaurant example)
      - Good for simple, repetitive tasks

Recursion is a very difficult topic to understand when first starting out, so don't worry if you have trouble grasping it.

Task 2
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
   
   

.. Task 3
.. ------

.. In section 15.C of the `Math 290 textbook <https://mathdept.byu.edu/~doud/Transition/Transition.pdf>`_ an algorithm is given (in the form of the proof of Proposition 15.3) to compute the binary expansion of a given integer.
.. The idea is:

.. .. code-block:: console
   
..    the binary expansion of 1 is `1'
..    if n is odd:
..      the binary expansion of n is [binary expansion of (n-1)/2] followed by '1'
..    if n is even: 
..      the binary expansion of n is [binary expansion of n/2] followed by '0'
   
.. If you are unfamiliar with binary arithmetic, see `<https://en.wikipedia.org/wiki/Binary\_number\#Counting\_in\_binary>`_

.. Note that if the binary expansion of a number ends in a zero (e.g. ``14=1110``) then dividing by ``2`` simply removes the rightmost bit (``7=111``). 
.. Similarly, if the binary expansion of a number ends in a one (e.g. ``5=101``) then the function ``x -> (x-1)/2`` simply removes the rightmost bit (``2=10``).

   
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


   

