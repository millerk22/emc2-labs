
Lab 13: Exploring Sequences and Limit Points
============================================

Recall that a real number :math:`L` is a limit point of a sequence :math:`a = \{a_n\}` of real numbers if there exists a subsequence of :math:`a` with limit :math:`L`. Sometimes it is easy to find subsequences converging to each limit point.  For example, for the sequence with :math:`n`-th term 
:math:`a_n=(-1)^n \frac{n}{n+1} ,`
the subsequence :math:`\{a_1,a_3,a_5,a_7,... \}` converges to :math:`-1`, the subsequence :math:`\{a_0,a_2,a_4,a_6,...\}` converges to :math:`1`, and these are the only two limit points. Other sequences are much harder to understand.  For example, what are the limit points of the sequence :math:`\{\sin(n)\}`?  The purpose of this lab is to write code that will find a subsequence of a given sequence :math:`a` that converges to a desired limit point. 


Task 1a
-------

Consider the sequence ``a = lambda n: sin(n)``

Write a function, ``plot_seq_a()``, to plot the first ``1000`` terms of this sequence (starting with ``n = 0``) and make a conjecture about its limit points. Make sure to label your plot and its axes.

Can you use the theorems from Chapter 11 to prove that the sequence has a limit point? Either do so or explain why it is not possible.

.. Consider the sequence :math:`a` with :math:`n`-th term :math:`a_n = \sin(n)`. 
    
.. 1. Plot the first :math:`1000` terms and make a conjecture about its limit points.
.. 2. Can you use the theorems from Chapter 11 to prove that the sequence has a limit point? Either do so or explain why it is not possible.

Task 1b
-------

Repeat Task 1a for the sequence ``b = lambda n: sin(pi * n / 20)``, calling your function ``plot_seq_b()``.


Task 2
------

Write a function, ``limit_point_idxs(a, L, N, tol)``, that takes as input a sequence function, ``a``, a limit, ``L``, a maximum index, ``N`` (defaulting to ``10000``), and an error bound, ``tol`` (defaulting to ``0.1``), that finds all the indices, ``0 <= n < N``, such that ``|a(n) - L| < tol``.


Task 3
------

Use your code from the previous exercises to write a function, ``plot_limit_idxs(a, L, N, tol)``, that takes as input a sequence function, ``a``, a limit, ``L``, a maximum (exclusive) index, ``N`` (defaulting to ``10000``), and an error bound, ``tol`` (defaulting to ``0.1``), that plots the sequence on the indices that fall within the error bound alongside a line representing the limit. Limit the y-axis of the plot to ``[L - tol, L + tol]`` and make sure to label your axes. Test your code on ``a = lambda n: (-1) **n / (n + 1)``, ``L = 0``, ``N = 150``, ``tol = 1e-2``.

    

Task 4
------

Using your code from Task 3, further explore the sequences from Task 1a and Task 1b and modify your conjecture about the set of limit points if necessary. Test your program on values that you think may not be limit points. Try modifying ``tol`` to be smaller and see if you still find a subsequence.



Enumerating the Rationals
-------------------------

For our final problem, we are going to construct a very interesting sequence. In Math 290 you learned that the set of rationals has the same cardinality as the natural numbers, which means that we may enumerate them, or in other words that we may order them into a sequence. To each rational number, we may assign a unique index corresponding to that number. If we are smart about how we create the enumeration, we will be able to assign a unique index to every rational number.

It is possible to do this for every rational number, but we will focus on all rationals in the interval :math:`[0,1]`. We usually think of reading left to right across an interval, but what is the first rational after :math:`0`? There are infinitely many rationals in this interval and there is an infinite sequence of rationals tending to :math:`0`, so it doesn't make sense to ask this question. Thus, we don't want to order the rationals in order from least to greatest. We need some other method to assign an order to them, so we will use the size of their denominators.

For every denominator :math:`q`, there are only finitely many rationals :math:`0 \leq \frac{p}{q} \leq 1` with denominator :math:`q`, namely :math:`q+1` of them for :math:`0 \leq p \leq q`. If we only count the ones in lowest terms, there are even less of them. (In fact, there are :math:`\varphi(q)` of them, where :math:`\varphi` is the `Euler Totient Function <https://en.wikipedia.org/wiki/Euler\%27s_totient_function>`_, which is not necessary to know for this problem.) So we can start at the smallest denominator, add onto the sequence all of the rationals in lowest terms in order for that denominator, and then increase the size of the denominator. We will consider :math:`0` to be in lowest terms if it written :math:`\frac{0}{1}` so that it is only represented once. Our enumerated rationals then are 

.. math::
    \frac{0}{1},\, \frac{1}{1},\, \frac{1}{2},\, \frac{1}{3},\, \frac{2}{3},\, \frac{1}{4},\, \frac{3}{4},\, \frac{1}{5},\, \frac{2}{5},\, \frac{3}{5},\, \frac{4}{5},\, \dots



Task 5
------

Write a function ``enumerate_rationals`` that accepts an integer ``n >= 1`` and returns a list with the enumeration detailed above of the rationals with denominator less than or equal to ``n``. 

   Hint: a fraction :math:`p/q` is in lowest terms if and only if :math:`\gcd(p,q) = 1`. You may use the ``math`` library's ``gcd`` function, but you are encouraged to use the gcd function that you created last semester.


Task 6
------

Use your code from the previous tasks to find the limit points of the enumerated rationals by plotting subsequences against possible limits (Task 3) and make conjecture about what the set of limit points is for this sequence. Once again, you do not have to write a formal proof for (b), but consider if a proof is possible given the theorems that you have. Consider the following question to drive your search. Is every rational in this range, ``[0, 1]``, a limit point? What about irrational numbers?

.. Repeat Task 1 using the sequence obtained from enumerating the rationals. Use the terms obtained by running ``enumerate_rationals(100)`` (which is far more than ``100`` terms). Once again, you do not have to write a formal proof for (b), but consider if a proof is possible given the theorems that you have. You are welcome to use more terms of the sequence, but the graph will become significantly less pretty. What do you think the set of limit points is of the enumerated rationals between ``0`` and ``1``? Is every rational in this range a limit point? What about irrational numbers?
    







