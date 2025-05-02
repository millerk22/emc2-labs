
Lab 17: Rearrangements of Conditionally Convergent Series
=========================================================

The harmonic series is our favorite example of a divergent series. We also know that the *alternating harmonic series* converges by the alternating series test. In fact 

.. math::
    \sum_{n = 0}^\infty \frac{(-1)^n}{n+1} = \ln 2.

Intuitively speaking, the alternating harmonic series converges because of the large amount of cancellation. The first few partial sums :math:`S_n` are given by 

.. math::
    S_0 &= 1, \\
    S_1 &= 1 - \frac{1}{2} = \frac{1}{2}, \\
    S_2 &= 1 - \frac{1}{2} + \frac{1}{3} = \frac{5}{6}, \\
    S_3 &= 1 - \frac{1}{2} + \frac{1}{3} - \frac{1}{4} = \frac{7}{12}.

However, these exact partial sums and their limit are dependent on the order in which we add. Consider instead a *rearrangement* 

.. math::
    R_0 &= - \frac{1}{2} = - \frac{1}{2}, \\
    R_1 &= - \frac{1}{2} - \frac{1}{4} = -\frac{3}{4}, \\
    R_2 &= - \frac{1}{2} - \frac{1}{4} + 1 = \frac{1}{4},


and so on, adding two negative terms and then a positive term. We are getting much smaller partial sums than we were before, and they are sometimes negative. Do they converge to the same limit as the original sequence of partial sums?  We might try to convince ourselves that they should because a series is a sum of numbers and addition is commutative. However, we in fact have the startling result that 

.. math::
    \lim_{n\to \infty} R_n \approx 0.346574,

half of the limit of :math:`\{S_n\}`!

The terms are still cancelling with each other, but they are cancelling in a different way than they were originally. Formally, let :math:`a` be a sequence such that :math:`\sum a_n` converges conditionally. For a sequence :math:`b`, we call :math:`\sum b_k` a *rearrangement* of :math:`a` if there exists a bijection :math:`n: \mathbb N_0 \to \mathbb N_0` such that :math:`b_k = a_{n(k)}` for all :math:`k`. Most importantly, we are not guaranteed that :math:`\sum b_k = \sum a_n`. We are not even guaranteed that :math:`\sum b_k` converges. In other words, if we change the order in which we sum the terms of a sequence :math:`a`, the rearranged sum may not converge, and, if it does converge, it may not converge to the same value.

An even more startling result is that we can get a rearrangement of a conditionally convergent series to converge to anything or diverge to either positive or negative infinity! Suppose that :math:`a` is a sequence for which :math:`\sum a_n` converges conditionally. Then for every :math:`L \in \mathbb{R} \cup \{-\infty, \infty\}`, there exists a rearrangement :math:`\sum b_k` satisfying :math:`\sum b_k = L`, where of course if :math:`L \in \{-\infty, \infty\}`, the series is divergent.

How can we achieve any limit :math:`L`? Let's first think about :math:`L = 0`. In this case, we could start with a positive term, then add in some negative terms until the partial sum is negative. Then we could add in some positive terms until the partial sum is positive, and repeat the process. If you have ever tried to get the correct balance of tortilla chips and salsa at a party, you have gone through exactly this same process. You grab some tortilla chips, then realize you do not have enough salsa, so you get more salsa. However, you have too much salsa now, so you get more tortilla chips. Continuing this process, eventually you will have no tortilla chips, no salsa, and a very full stomach.

This idea can be generalized to any limit :math:`L` in the following algorithm:


Let :math:`a` be a sequence whose associated series converges conditionally.  We want to reach a limit :math:`L`, which we call ``target``. First, create two indices ``pos_ind`` and ``neg_ind`` that keep track of how many positive terms we have summed and how many negative terms we have summed. We also need a variable ``current`` that keeps track of our current partial sum.

1. For each index ``i`` less than some maximum value, compare ``current`` with ``target``.
2. If ``current < target``, add the next positive term and increment ``pos_ind``.
3. Otherwise, add the next negative term and increment ``neg_ind``.


Task 1
------

Write a function, ``rearrange(a, L, N)``, that finds a rearrangement of the alternating series for a given a sequence, ``a`` (i.e. the series is computed on the sequence ``(-1)**n * a(n)``), that converges to a given limit, ``L``, using the first ``N`` terms (starting at ``0``). Return both the terms and indices of the rearrangement. Note: ``a``, as a function, does not alternate so you must account for the alternating behavior in your code.


Task 2
------

Using your code from the previous exercise, write a function, ``plot_rearrangement(a, L, N)``, that computes the rearrangement of ``a`` converging to ``L`` with ``rearrange(a, L, n)`` and plots the partial sums of the alternating series on ``a`` alongside the partial sums of the rearrangement.

Task 3a
-------

Use your code from the previous exercise to plot the sequence ``a = lambda n: 1 / (n + 1)`` alongside its rearrangements for ``L = 0`` and ``N = 100``.

Task 3b
-------

Use your code from the previous exercise to plot the sequence ``a = lambda n: np.log(n + 2) / (n + 2)`` alongside its rearrangements for ``L in [0, 5, -5, -0.159869]`` and ``N = 100``.


Task 3c
-------

Use your code from the previous exercise to plot the sequence ``a = lambda n: 1 / (n + 1)`` alongside its rearrangements for ``L = 0`` and ``N = 1000``. Does this rearrangement appear to converge closer to its limit for the larger value of ``N``?

Task 3d
-------

Use your code from the previous exercise to plot the sequence ``a = lambda n: np.log(n + 2) / (n + 2)`` alongside its rearrangements for ``L in [0, 5, -5, -0.159869]`` and ``N = 1000``. Does this rearrangement appear to converge closer to its limit for the larger value of ``N``?

Task 4
------

Use your code from the previous exercise to see how high and low you can set ``L`` and still calculate a rearrangement of ``a = lambda n: np.log(n + 2) / (n + 2)`` that appears to converge to ``L``, setting ``N`` as high as you need.



.. Task 1
.. ------

.. Using the first :math:`100` terms of the sequence :math:`a_n = \frac{(-1)^n}{n+1}`, write code that will find the first few terms of a rearrangement summing to ``L = target = 0``. Continue adding to the rearrangement sequence until either ``pos_ind`` or ``neg_ind`` is greater than :math:`100`. You can keep track of the order that you are summing in if you append each term to a list when you add it to ``current``. How close is ``current`` to ``target`` at the end of this process?

.. Task 2
.. ------

.. Plot the sequence of partial sums of :math:`a` for :math:`0 \leq n < 100`. On the same plot but in a different color, plot the sequence of partial sums of a rearrangement of :math:`a` with :math:`L = 0`. Look back over :doc:`lab07` if you have forgotten how to do this.

.. Task 3
.. ------

.. Consider the first :math:`100` terms of the sequence :math:`b_n = \frac{(-1)^n \log{n}}{n}` for :math:`n \geq 2`. In a new cell, alter your code from Problem 1 to find the first few terms of the rearrangements summing to :math:`L = 0`, :math:`L = 5`, :math:`L=-5`, and :math:`L = -0.159869`. We note here that the series, without rearranging the terms, satisfies :math:`\sum_{n = 2}^\infty b_n \approx 0.159869`. 

.. Task 4
.. ------

.. Plot the sequence of partial sums of :math:`b` for :math:`2 \leq n < 102`. On the same plot but in different colors, plot the sequences of partial sums of rearrangements of :math:`b` with :math:`L = 0` and :math:`L = 5`.

.. Task 5
.. ------

.. Repeat Problem 2 with the first :math:`1000` terms of :math:`b`. Are the end values of ``current`` closer to ``target`` than before? If we continue this process with infinitely many terms of :math:`b`, we should be able to reach ``target`` exactly in the limit.

.. Task 6
.. ------

.. Increasing the number of terms of :math:`b` if necessary, explore how high and how low of a limit :math:`L` you can input for which you can find a rearrangement of :math:`b` with that limit value. Since computer memory is finite, you may run into a computational roadblock if you keep increasing the number of terms you are using. This roadblock is perfectly fine to run into and shows the differences between what we can prove and what we can compute.


