Lab 7: Introduction to Series 
=============================

As you have learned in Math 341, a series is a formal sum of the terms of a sequence. Just as sequences can converge or diverge, series can converge or diverge as well depending on whether the sequence of partial sums converges or diverges. The purpose of this lab is to explore series, to build our intuition, and to show when our intuition fails us.

You have already seen that 

.. math::
    \sum_{n=0}^\infty \frac{1}{2^n} = 2,

or in other words that the sum converges and the sequence of partial sums has limit ``2``. Let's construct a list in Python of the first ``50`` partial sums of this series so that we can plot it. If ``S_(n-1)`` is the ``(n-1)`` th partial sum, then note that

.. math::
	S_{n} = S_{n-1} + \frac{1}{2^{n}}

Thus, if we save our partial sum into a variable at each step, then we will not have to start at the beginning of the sum every time. The following code block shows how we can get the first ``50`` partial sums of this series. (There are numerous other methods that one could use to construct the partial sums of a series. You are encouraged to come up with your own!)

.. code-block:: python

	curr_sum = 0                        # our current sum value at each step
	partial_sums = []                   # list of partial sums

	for n in range(0,50):               # first 50 partial sums
	    curr_sum += 1/2**n              # S_n = S_{n-1} + 1/2**n
	    partial_sums.append(curr_sum)
	print(partial_sums)



Task 1
------

Create a function, ``partial_sums(a, i, j, s)``, to compute the partial sums of a sequence, ``a(k)``, from index ``i`` (inclusive) to index ``j`` (exclusive) where ``i`` defaults to ``0`` and ``j`` defaults to ``10``, shifted by ``s`` (i.e. ``s`` is the initial value of the running total) where ``s`` default to ``0``.

Task 2
------

Using your function from the previous exercise, ``partial_sums(a, i, j, s)``, create a function, ``plot_partial_sums(a, i, j, s)``, that plots the partial sums of a sequence, ``a(k)``, from index ``i`` (inclusive) to index ``j`` (exclusive), where ``i`` defaults to ``0`` and ``j`` defaults to ``10``. Remember to label the axes (use ``r"$n$"`` and ``rf"$\sum_{{k={i}}}^{{n}}a_k$"``), change the marker style (use ``"."``), and set the xticks to be ten equally spaced indices of your partial sums (use ``range(i, j, (j - i) // 10)``).

Task 3
------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``50`` terms of the series for :math:`a_n = 1 / 2^n` starting with ``n = 0``. Can you see that the sequence of partial sums is converging to the correct limit?

Task 4
------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``50`` terms of the series for :math:`a_n = (-1)^n` starting with ``n = 0``. Does this series converge or diverge?

The Harmonic Series
~~~~~~~~~~~~~~~~~~~

The harmonic series

.. math::
	\sum_{n=1}^\infty \frac{1}{n} 

is a particularly important example.

Task 5a
-------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``50`` terms of the harmonic series. Does this series converge or diverge?

Task 5b
-------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``100`` terms of the harmonic series. Does this series converge or diverge?

Task 5c
-------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``1000`` terms of the harmonic series. Does this series converge or diverge?

In the last exercises, you probably knew that the harmonic series 

.. math::
	\sum_{n=1}^\infty \frac{1}{n} 

diverges even before plotting it. This series is perhaps our favorite example of a divergent series. However, from plotting it, notice that it diverged rather slowly. Just from looking at the graph we have no guarantee that it would not eventually stop increasing. Looking at the first ``1000`` partial sums, we had yet to reach ``7``, so what if the limit actually was ``7``? Or ``8``? Or ``5000``? Graphs can give us a great idea of what is going on and are excellent tools to know how to use, but they *are not a proof*. We will look at some more examples where our intuition can fail us when looking at a graph.

p-Series and logs
~~~~~~~~~~~~~~~~~

We know from the :math:`p`-series test that 
	.. math::
		\sum_{n=1}^\infty \frac{1}{n^p} 

converges if :math:`p > 1` and diverges if :math:`0 < p \leq 1`. The harmonic series is then right on the edge of converging since if we had any higher power, the series would converge. It stands to reason that the series 
	.. math::
		\sum_{n=1}^\infty \frac{1}{n \log(n+1)} 

might converge, not by the :math:`p`-series test but perhaps by some sort of comparison test. (Note that we are using :math:`\log(n+1)` instead of :math:`\log(n)` to avoid division by :math:`0`.) Before working out the details, let's try plotting the partial sums of this series.

Task 6a
-------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``100`` terms of the series for :math:`a_n = 1 / (n \log(n + 1))` starting with :math:`n = 1` and using the ``log`` function from the ``math`` library. Does this series converge or diverge?

Task 6b
-------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``1000`` terms of the series for :math:`a_n = 1 / (n \log(n + 1))` starting with :math:`n = 1`. Does this series converge or diverge?

Task 6c
-------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``10000`` terms of the series for :math:`a_n = 1 / (n \log(n + 1))` starting with :math:`n = 1`. Does this series converge or diverge?

Task 7
------

Use your code from the previous exercises, ``plot_partial_sums(a, i, j, s)``, to plot the first ``1000`` terms of the series 
	.. math::
		-\frac 1{\sqrt{3}} + \sum_{n=1}^\infty (-1)^n \frac{\lfloor \log_2(n) \rfloor}{n} 

starting with ``n = 1``, and using the ``log2``, ``sqrt``, ``floor`` functions from the ``math`` library for :math:`\log_2`, :math:`\sqrt{\phantom{x}}`, and :math:`\lfloor \phantom{x} \rfloor`, respectively. Does this series converge or diverge? If it converges, what is the limit?


Conclusion
~~~~~~~~~~


Let's look back at our answers to Tasks 6 and 7. We never saw the series 

.. math::
	\sum_{n=1}^\infty \frac{1}{n \log(n+1)} 

race off to infinity, and it certainly seemed to be tapering off. Perhaps it is bounded by :math:`5`, we reason. Plotting more and more partial sums is taking a long time and this seems to be a reasonable guess. However, this guess is wrong. The series is not bounded above by :math:`5` or by any finite number because the sum diverges. If we try to plot enough partial sums to see this, however, we will never see any kind of satisfying growth because the partial sums grow at about the order of :math:`\log(\log(n))`. Our eyes and intuition have deceived us, but the plot still was useful in making preliminary guesses.

Let's look at Task 7. This series appears to converge very obviously, and this is in fact true. We could show that the series converges by the alternating series test. The partial sums appear to be reaching a limit value of :math:`0`, which is a very nice number so we suppose that it is probably correct. However the limit is actually around :math:`-0.000134604` and is irrational. We would not be able to find this limiting value just from looking at the graph, but our intuition was correct in this case in telling us that the series converges.






