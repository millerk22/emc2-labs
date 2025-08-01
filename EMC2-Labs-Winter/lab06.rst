Lab 6: Sorting and Complexity of Algorithms 
===========================================

In :doc:`lab04`, we created a binary search algorithm to search in a **sorted** list. What do we do if we have an unsorted list? We sort it of course! There are many ways to sort lists. Say, for example, you had a shuffled deck of cards and you wanted to order them by number and by suit. What strategies would you take to sort the entire deck?

The goal of this lab is to create a function that sorts an unsorted list. We will use a sorting algorithm called Bubble Sort to accomplish this. It is not the fastest sorting algorithm, but it works well as an introduction to sorting. If you take CS 235, you will be introduced to more sorting algorithms. Some of them are faster but can be a bit more difficult to understand. Before diving into that, we will talk about :math:`\text{Big-}O` notation and time complexity.


Algorithmic Complexity and :math:`\text{Big}O` Notation
-------------------------------------------------------

**Time complexity** is a way to describe how the running time of an algorithm increases as the size of its input grows. Say we have a function ``sum_elements`` that adds up all the elements in a list:

.. code:: python

	def sum_elements(input_list):
		sum = 0
		for ele in input_list:
			sum += ele
		return sum

If the size of our list is :math:`n`, our ``for`` loop will iterate :math:`n` times. This is what we call **linear complexity** or **linear time** because as :math:`n` increases, the amount of time it takes to run the function linearly increases. It is important to note that in this example, lines like ``sum = 0`` and ``for ele in input_list:`` (setting up the for loop) both take some additional time. If we wanted to express the time our code takes to run as a function, it may look something like this:

.. math::

	f(n) = an + b

Where :math:`n` is the number of elements in the list, :math:`a` is a coefficient representing how long one iteration takes, and :math:`b` is a coefficient representing the constant time needed to set up the code.

When working with more complicated functions, it is important to consider the time complexity of your algorithm. We analyze complexity with :math:`\text{Big-}O` notation, which is very similar to a function mapping from :math:`n` to time. Linear complexity is written as ``O(n)`` because ``n`` is a linear term. There are two rules when analyzing complexity with :math:`\text{Big-}O` notation:

#. Only keep the fastest growing term
#. Drop all coefficients

For our linear example, the two rules of :math:`\text{Big-}O` notation state that we can drop the :math:`b` term becasue it grows slower than :math:`an`, and also that we can drop :math:`a` because it is a coefficient. Thus, we are left with :math:`f(n) = n` which translates to ``O(n)``.

The main question we ask with :math:`\text{Big-}O` notation is **"How much does time grow when input size grows?"**. 

Let's look at some other examples.

Constant Time (``O(1)``)
~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python
	def get_last_element(arr):
    	return arr[-1]  # Always takes the same amount of time

You don't need to go over all elements in a list in order to get an element.

Quadratic Time (``O(n^2)``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

	def matrix_sum(A):
		rows, cols = A.shape
		sum = 0
		for row in range(rows):
			for col in range(cols):
				sum = sum + A[row][col]
		return sum

Nested for loops most often means ``O(n^2)``.

Logarithmic Time (``O(log(n))``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

	def divide_until_one(n):
		steps = 0
		while n > 1:
			n = n // 2
			steps = steps + 1
		return steps

Each iteration, the number is cut in half. This means that every time we double the number, we only add one more iteration. This is logarithmic time.


Exponential Time (``O(2^n)``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: python

	def fib(n):
		if n <= 1:
			return n
		return fib(n - 1) + fib(n - 2)

Every time we increase ``n``, we have to calculate both ``n - 1`` and ``n - 2``. This makes it exponential.


There are also time complexities like Log-Linear Time (``O(nlog(n))``) or Factorial Time (``O(n!)``), and a few that are more complicated, but we won't worry about any of these.

.. note::

	As a general rule, we don't need to evaluate how many steps there will be exactly. Each ``for`` loop contributes a multiple of ``n`` **if the** ``for`` **loop depends on** ``n``. For example, the function below is ``O(1)`` even though it has a ``for`` loop within it. That is because it always has the exact same number of iterations for every input of ``n``.

	.. code-block:: python

		def bad_factorial_funct(n):
			prod = 1
			for i in range(1,10):
				prod *= i
			return prod


Task 1
------

For each function, talk to a friend and find the time complexity in :math:`\text{Big-}O` notation. Make sure you can explain why.

Remember the two rules:

#. Only keep the fastest growing term
#. Drop all coefficients


.. n

.. code:: python

	def print_items(lst):
		for item in lst:
			print(item)

.. n^2

.. code:: python

	def print_pairs(lst):
		for i in lst:
			for j in lst:
				print(i, j)

.. 1

.. code:: python

	def print_first(lst):
		if lst:
			print(lst[0])

.. 1

.. code:: python

	def print_two_lists(a, b):
		for item in a:
			print(item)
		for item in b:
			print(item)

.. logn

.. code:: python

	def count_halvings(n):
		count = 0
		while n > 1:
			n = n // 2
			count += 1
		return count

.. n^2

.. code:: python

	def has_pair_with_sum(arr, target):
		for i in range(len(arr)):
			for j in range(i + 1, len(arr)):
				if arr[i] + arr[j] == target:
					return True
		return False

.. admonition::

	The main thing to take away with :math:`\text{Big-}O` notation is that it helps us understand how much time a function will take to run.

Bubble Sort
-----------

To learn about Bubble Sort, consider this example.

Suppose that Alice is having a party with ``4`` friends. At one point during the party, she hands out t-shirts with numbers on them and tells everyone to line up with their numbers going from smallest to largest. (This is, of course, a common party game among mathematicians.) However, they are in a tight hallway and chaos ensues. Eventually, everyone lines up against the wall, out of order. How can they get in order in an organized fashion?

.. image:: _static/figures/unsorted-1.png
	:width: 45%
	:align: center

Alice has an idea. Every pair should compare shirts and decide whether or not to swap places. Then, the people with the smallest numbers will work their way to the left side of the hallway, and those with the biggest numbers will go to the right. Sorting this way will also keep everything efficient and keep everyone from bustling around and elbowing for a spot.

Starting on the left, each pair compares numbers. If they are out of order, they swap. When they have gone through the line once, they start again at the beginning and repeat the process. They continue until they are finally in order. In the figure below, note that ``0 < 2`` and ``2 < 4``, so we don't need to swap either of these. However, ``4 > 1``, so we swap ``4`` and ``1``. Likewise, we swap ``3`` and ``4``. When we reach the end of the line of people, we start again at the beginning and repeat until everyone is in order.

.. image:: _static/figures/unsorted-2.png
	:width: 45%
	:align: center


Note that we had to go through the line of people more than once. (In other words, we had to restart at the beginning after we had looked at every element because ``1`` and ``2`` were still out of order.) Most of the time, we cannot sort a list in one pass. What is the largest number of passes needed?


Task 2
------

In CodeBuddy, bubble sort the list ``[3,2,1,0]``  so that it is in increasing order, writing each step on its own line. 
How many times did you have to run through the entire list? 
What do you suspect is the maximum number of times that you will have to run through an arbitrary list to sort it?


Task 3
------

Write a function ``bubble_sort`` that takes as a parameter an unsorted list ``l`` and returns the list sorted from smallest to largest. Here are some hints and words of caution:

- Because we need to sort the entire list with one call of the function, a single ``for`` loop will not suffice. How many ``for`` loops do we need? Recall that instead of writing multiple ``for`` loops one after the other, we can nest them to repeat a ``for`` loop a variable number of times.

- We are swapping two elements, which means accessing the ``i`` th and ``(i+1)`` th elements of a list. Be careful not to access beyond the length of your list!

- Consider how you could optimize this algorithm:

  - The ``k`` largest elements are guaranteed to be at the end of our list, in ascending order, after the ``k`` th iteration of our first ``for`` loop.

  - If no terms were swapped during an iteration of our outer ``for`` loop, then the list must already be in ascending order.

>>> bubble_sort([2,1,3,0])
[0, 1, 2, 3]
>>> l = [48, 81, 25, 12, 47, 4, 15, 90, 95, 7, 80, 68, 88, 8, 42, 3, 6, 14, 76, 19, 91, 52, 15, 51, 95, 1, 6, 81, 35, 99, 23, 24, 72, 94, 98, 88, 20, 84, 55, 32, 45, 99, 40, 51, 2, 25, 82, 66, 75, 30, 38, 8, 75, 33, 2, 7, 98, 61, 28, 2, 39, 100, 25, 89, 70, 41, 91, 8, 78, 61, 26, 9, 88, 92, 59, 44, 41, 60, 99, 80, 28, 53, 45, 95, 96, 84, 39, 55, 32, 98, 41, 23, 4, 14, 22, 4, 64, 12, 79, 43]
>>> bubble_sort(l)
[1, 2, 2, 2, 3, 4, 4, 4, 6, 6, 7, 7, 8, 8, 8, 9, 12, 12, 14, 14, 15, 15, 19, 20, 22, 23, 23, 24, 25, 25, 25, 26, 28, 28, 30, 32, 32, 33, 35, 38, 39, 39, 40, 41, 41, 41, 42, 43, 44, 45, 45, 47, 48, 51, 51, 52, 53, 55, 55, 59, 60, 61, 61, 64, 66, 68, 70, 72, 75, 75, 76, 78, 79, 80, 80, 81, 81, 82, 84, 84, 88, 88, 88, 89, 90, 91, 91, 92, 94, 95, 95, 95, 96, 98, 98, 98, 99, 99, 99, 100]


.. 3. With your code, sort the following lists:

.. .. code-block:: console

.. 	l = [2, 1, 3, 0]

.. .. code-block:: console

.. 	l = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

.. .. code-block:: console

.. 	l = [48, 81, 25, 12, 47, 4, 15, 90, 95, 7, 80, 68, 88, 8, 42, 3, 6, 14, 76, 19, 91, 52, 15, 51, 95, 1, 6, 81, 35, 99, 23, 24, 72, 94, 98, 88, 20, 84, 55, 32, 45, 99, 40, 51, 2, 25, 82, 66, 75, 30, 38, 8, 75, 33, 2, 7, 98, 61, 28, 2, 39, 100, 25, 89, 70, 41, 91, 8, 78, 61, 26, 9, 88, 92, 59, 44, 41, 60, 99, 80, 28, 53, 45, 95, 96, 84, 39, 55, 32, 98, 41, 23, 4, 14, 22, 4, 64, 12, 79, 43]
        

Algorithmic Complexity
----------------------

We now study the **complexity** of the Bubble Sort algorithm. The complexity of an algorithm is the number of steps it takes as a function of the size of the input. The more steps, the longer the algorithm will take to run. 

For the Bubble Sort, is the number of steps a linear function of the length :math:`n` of the list?  A quadratic function?  An exponential function?  We don't need to know the function exactly; it will suffice to know how it grows for large :math:`n`. If one algorithm involves :math:`n^2` steps and another involves :math:`n^2 + 1` steps or even :math:`10n^2 + 1000`, they will grow roughly the same as :math:`n` gets large. 
We say all of these algorithms are :math:`O(n^2)`. This is said as "big-:math:`O` of :math:`n^2`." 
(For an exact definition of big-:math:`O` notation, see the end of this lab.) 
Similarly, an algorithm that takes around :math:`n` steps on average is said to be :math:`O(n)`. 
We have a similar interpretations for algorithms that are :math:`O(\log{n})`, :math:`O(n \log{n})`, :math:`O(n^3)`, etc.

We consider some examples and find their algorithmic complexity.

.. code-block:: python

	def my_sum_funct(n):
	    total = 0
	    for i in range(n):
	        total = total + i
	    return total


Within the function, we run a single ``for`` loop which looks at all numbers between ``0`` and ``n-1``, inclusive. So for every choice of ``n``, we will iterate over ``n`` things. Thus, this function is ``O(n)``. Let's look at another example.

.. code-block:: python

	def my_mult_funct(n):
	    prod = 1
	    for i in range(1,n):
	        for j in range(1,i):
	            prod *= i+j
	    return prod


Now, we have a nested ``for`` loop. The outer ``for`` loop iterates over ``n-1`` items. The inner loop iterates over ``i-1`` items for every ``i``. We can find out how many iterations are done exactly by evaluating 

.. math::
    \sum_{i = 1}^{n-1} (i - 1) = \frac{n(n-1)}{2} - (n-1) = \frac{1}{2}n^2 - \frac{3}{2}n + 1.

So this algorithm is ``O(n^2)``.

As a general rule, we don't need to evaluate how many steps there will be exactly. Each ``for`` loop contributes a multiple of ``n`` **if the** ``for`` **loop depends on** ``n``. For example, the function below is ``O(1)`` even though it has a ``for`` loop within it. That is because it always has the exact same number of iterations for every input of ``n``.

.. code-block:: python

	def bad_factorial_funct(n):
	    prod = 1
	    for i in range(1,10):
	        prod *= i
	    return prod


Task 4
------

Let's look at the algorithmic complexity of programs that we have made.


- What is the complexity of Bubble Sort? On average, about how many comparisons are we doing? How many ``for`` loops are there? Note that the input ``n`` that grows is the size of the list.

- What is the complexity of the binary search function from :doc:`lab04`? Hint: this algorithm does **not** run in either ``O(n)`` or ``O(n^2)`` time. We are cutting the search space in half each time. If we started with a list of ``16`` elements, how many times do we have to cut in half to be certain that we have found the correct index? Can you generalize that to a list of arbitrary length? Remember that with big ``O`` we do not need to be perfectly precise.


As promised, here is the formal definition of big ``O``. This is a common concept in computing, but it is also something that you may run into in math classes in the future. We will state the definition in terms of two real-valued functions, but we may instead consider ``f`` to be an algorithm of some kind.

.. admonition:: Definition

	Let ``f`` and ``g`` be real functions defined on some unbounded domain, say the real numbers ``R``. Then ``f(x) = O(g(x))`` as ``x -> ∞`` if there exists some constant ``C > 0`` and a real number ``x_0 > 0`` such that 

	.. math::

	    \left\vert f(x) \right\vert \leq C \left\vert g(x) \right\vert \qquad \text{ for all } x\geq x_0



In other words, a big ``O`` gives an approximate upper bound on the growth of a function as ``x -> ∞``.

.. https://www.youtube.com/watch?v=D6xkbGLQesk
.. graph them
.. use matrix multiplication and matrix vector
.. go through a bunch of different examples