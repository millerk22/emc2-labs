Lab 17: Recursion Reloaded
==========================


Systems of One-Way Roads
------------------------

In Section 15 of the `Math 290 textbook <https://mathdept.byu.edu/~doud/Transition/Transition.pdf>`_ it is shown that any finite set of cities with a system of one-way roads connecting them has a valid path (re-read that section if you don't remember what these terms mean). 
We will write a program that finds a valid path through any such system of roads.

First, we need to be able to generate random systems of roads.
A system of one-way roads through ``n`` cities can be represented as a list of ``n`` city names together with an ``n x n`` matrix ``A``, where

.. math::
   A[i,j] = 
   \begin{cases}
      0 & \text{ if }i=j, \\
      1 & \text{ if there is a road from $i$ to $j$}, \\
      -1 & \text{ if there is a road from $j$ to $i$}.
   \end{cases}

We will use the system of roads through five cities pictured on p. 108 of the Math 290 textbook as an example.

.. image:: _static/cities.svg
   :align: center

These cities would be represented by the list ``L = ['A', 'B', 'C', 'D', 'E']`` together with the matrix

.. math::
   M = \left[\begin{matrix}
      0 & -1 & 1 & -1 & -1 \\
      1 & 0 & -1 & 1 & 1 \\
      -1 & 1 & 0 & -1 & 1 \\
      1 & -1 & 1 & 0 & -1 \\
      1 & -1 & -1 & 1 & 0
   \end{matrix}\right].

Notice that ``M`` is antisymmetric, meaning that ``transpose(M) = -M``.

Task 1
------

Write a function ``random_system(n)`` that takes as input a positive integer ``n`` and returns a random system of one-way roads through ``n`` cities as an ``n x n`` matrix as described above.
If you need help generating random integers, read about the function ``randint`` online. You will need to import ``random``:

>>> from random import randint

Valid Paths
-----------

To find a valid path through ``n`` cities: let ``X`` be a random city in the list ``L``.
For each other city ``Y``, say that ``Y`` is a blue city if there is a road from ``Y`` to ``X`` (i.e. ``A[X,Y]=-1``), and say that ``Y`` is a red city if there is a road from ``X`` to ``Y`` (i.e. ``A[X,Y]=1``).
Then form two smaller systems of one way roads, one comprising the blue cities, and the other comprising the red cities (where the order of the labels is preserved).

.. math::
   [\text{path through blue cities}] \rightarrow X \rightarrow [\text{path through red cities}].

Then, solve each reduced system with the same process.

For example, for the matrix ``M`` above, we have ``X=C`` and

.. math::
   M_\text{blue} = 
   \left[
   \begin{matrix}
      0 & 1 & -1 \\
      -1 & 0 & -1 \\
      1 & 1 & 0
   \end{matrix}
   \right], \quad L_{\text{red}} = [A,C,D] 
   \quad \text{ and } \quad 
   M_\text{red} = 
   \left[
   \begin{matrix}
      0 & -1 & 1 \\
      1 & 0 & 1 \\
      -1 & -1 & 0
   \end{matrix}
   \right], \quad L_{\text{blue}} = [B,C,E]. 

Now we recursively find a valid path through the red cities and a valid path through the blue cities and combine them to make the final valid path.

.. image:: _static/cities_path.svg
   :align: center

Task 2
------

Write a function ``valid_path(M,L)`` that takes as input an ``n x n`` matrix ``M`` and a list ``L`` of length ``n``, and returns a valid path through the cities as a list of length ``n``. The list ``L`` contains the names of the cities.
For example, the function should return ``[B, E, D, A, C]`` as the path for the example above.

If you want to make a copy of a list of lists, such as the matrix ``M``, it is (unfortunately) not as simple as calling ``M.copy()``. 
The ``copy`` package helps with this:

>>> import copy
>>> Mc = copy.deepcopy(M)

As an extra (ungraded) challenge, write a function that computes all valid paths for the given input.

A Problem with Recursion
------------------------

Pull up your Fibonacci function ``fib(n)`` from :doc:`lab12` and see how long it takes to compute the ``40``-th Fibonacci number.
To do this, first run the following code:

>>> from timeit import default_timer as timer

Then you can measure how long it takes (in seconds) to compute ``fib(40)`` by running:

.. code-block:: python

   start = timer()
   fib(40)
   end = timer()
   print(end-start)

The thing you should learn from this is: recursion makes for beautiful code but often expensive results.
The reason it takes so long to compute ``fib(40)`` is that all of the earlier Fibonacci numbers are computed *several times* in order to compute the ``40``-th. To test this out, add the following print command in the base case of your ``fib`` function:

.. code-block:: python

   if n==1 or n==2:
       print("I'm calling the base case")
       return 1

Unsurprisingly, this prints "I'm calling the base case" every time the base case is called. 
Now run ``fib(10)`` and watch the flood of output. 
In theory, computing the ``10`` -th Fibonacci number "by hand" should only call the base case once or twice.

Task 3
------

In order to speed up our Fibonacci function, we'll use a programming technique called "memoization". 
(The name is awkward, but the technique is great.) 
The idea is that to compute ``fib(41)`` we shouldn't have to do much work, because we already computed ``fib(40)`` and, while computing ``fib(40)``, we computed ``fib(39)``. 
So it would be nice if Python would just remember that for us.
Luckily, there's a built-in Python tool just for that:

.. code-block:: python

   import functools
   @functools.lru_cache(maxsize=256)
   def fib(n):
       blah blah blah

The line starting with ``@`` needs to come immediately before your function definition. Replace ``blah blah blah`` by the code you already wrote for the ``fib`` function. Now see how fast your function computes ``fib(40)``. And just for fun, see how fast it computes ``fib(200)``. It should compute this in less than one second; don't submit your code to CodeBuddy until you have memoization working properly.


Task 4: Towers of Hanoi
-----------------------


There is a legend about an Indian temple in Kashi Vishwanath which contains a large room with three time-worn posts in it.
At the beginning of time, the leftmost post was surrounded by 64 golden disks. 
Brahmin priests, acting out the command of an ancient prophecy, have been moving these disks in accordance with the immutable rules of Brahma since that time, in an effort to move the disks to the rightmost post. 
The rules are:

   1. Only one disk can be moved at a time.
   2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack or on an empty post.
   3. No larger disk may be placed on top of a smaller disk.

When the last move of the puzzle is completed, the world will end.
Your task is to determine how soon the world will end, given that the priests can move one disk per second.

Start by playing the `<https://www.webgamesonline.com/towers-of-hanoi/index.php>`_.
Play with 3 disks first until you have a solution that takes the minimal number of moves (in this case, 7 moves).
Then move on to 4 disks until you have a solution that takes 15 moves. Keep playing with more disks until you see the pattern. Don't read on until you're done with this step.



Let's call the leftmost and rightmost posts the "source" and "target," respectively. 
We'll call the middle post "aux."
How do we solve the puzzle when there are two disks? 

.. code-block:: console
   
   move the top disk source --> aux
   move the next disk source --> target
   move the top disk aux --> target

When there are three disks?

.. code-block:: console
   
   move the top [two disks] source --> aux (use the solution for two disks)
   move the third disk source --> target
   move the top [two disks] aux --> target (use the solution for two disks)




Write a function ``hanoi(n, source, aux, target)`` that takes in an integer ``n`` and the names of the source, aux, and target posts as strings.
Do not implement memoization for this function.
Your function should move the top ``n`` disks from source to target, using aux for help.
At each move, print "move from post _ to post _", like this:


>>> hanoi(3,'A','B','C')
'move from post A to post C'
'move from post A to post B'
'move from post C to post B'
'move from post A to post C'
'move from post B to post A'
'move from post B to post C'
'move from post A to post C'

For how many years will the priests be moving disks? Remember that there are 64 disks and the priests can move one disk per second.

*Hint:* don't run ``hanoi(64,...)`` -- instead try to find the pattern. Can you prove by induction that your pattern is correct?


