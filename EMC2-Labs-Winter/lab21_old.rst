
Lab 21: Iterating Functions
===========================

We have seen many types of sequences so far, and in this lab we will introduce another: the sequence of iterates of a function :math:`f` for some fixed :math:`x \in \mathbb{R}`. We have often been concerned about whether a sequence converges or diverges. For the sequences that we will consider in this lab, we will ask the related question of whether the sequence is bounded or whether it diverges to infinity. 

First, we define an iterate. Let :math:`f: \mathbb{R} \to \mathbb{R}`. Define :math:`f^2 = f \circ f`, :math:`f^3 = f \circ f \circ f`, and so on, so that :math:`f^n = f\circ f \circ \dots \circ f` is the composition involving :math:`n` copies of :math:`f`. We call :math:`f^n` the :math:`n`-th *iterate* of :math:`f`. Recall that :math:`\circ` denotes function composition, so :math:`f^2(x) = (f \circ f) (x) = f(f(x))`.


Task 1
------

Let :math:`f(x) = x^2 - 1`. By hand, compute at least the first four terms of the sequence of iterates of :math:`f` (starting at :math:`x`) for :math:`x = 0` and :math:`x = 1`.

Task 2
------

Write a function, ``iterate(f, x, n)``, that computes the first ``n`` iterates of ``f`` evaluated at ``x``. You should consider doing this using bottom-up dynamic programming, i.e. create a list of terms and use the terms you have already computed to compute the next term.

Task 3
------

Use your code from the previous exercise to write a function, ``plot_iterates(f, x, n)``, that plots the first ``n`` terms of the sequence of iterates evaluated at ``x``. Use ``plt.plot(a, ".")`` where ``a`` is the terms of your sequence. Remember to label the axes of your plots (use ``plt.xlabel("$n$")`` and ``plt.ylabel("$f_n(x)$")``).

Task 4a
-------

Use your code from the previous exercises to study the sequences of iterates of :math:`f(x)=x^2-1` for the fixed input of ``x in [1 + i / 10 for i in range(1, 8)]`` and describe your results.

Task 4b
-------

Further explore the sequence from the previous exercise for different positive values of ``x`` and make a conjecture of what the largest value ``x`` can take such that this sequence of iterates is bounded.

Task 4c
-------

Further explore the sequence from the previous exercise for different negative values of ``x`` and make a conjecture of what the smallest value ``x`` can take such that this sequence of iterates is bounded.

Task 5
------

A fixed point of a function, :math:`f`, is some input, :math:`x`, such that :math:`f(x)=x`. Find all fixed points of :math:`f(x)=x^2-1`. How does the sequence of iterates of ``f`` behave if we take the initial input, :math:`x`, to be a fixed point of :math:`f`? With this new information, modify your conjectures from the previous exercises (if necessary).

Complex Numbers
---------------


In the problems above, we observed that there appears to be an interval :math:`I` on the real line with the property that for all :math:`x \in I`, :math:`\{f^n(x)\}` remains bounded and for all :math:`x \notin I`, :math:`\{f^n(x)\}` is unbounded. The endpoints of this interval are interesting numbers, but the problem is just one-dimensional and so not really that interesting. If we extend this idea to the complex plane, then we can get far more interesting sets. First, we make a few comments about complex numbers and graphing.

A *complex number* is an object of the form :math:`a + bi` where :math:`a,b\in \mathbb{R}` and :math:`i^2 = -1`. If :math:`b = 0`, then :math:`a + bi` is real. We often identify the complex number :math:`a+bi` with the ordered pair :math:`(a,b)` and plot it the same way we plot a point in :math:`\mathbb{R}^2`. We then often refer to the :math:`xy`-plane as the  *complex plane*, the :math:`x`-axis as the *real axis* and the :math:`y`-axis as the *imaginary axis*. For example, :math:`2 + 3i` is plotted as :math:`(2,3)`. We let :math:`\mathbb{C} = \{a + bi: a,b \in \mathbb{R}\}` be the set of all complex numbers and we consider functions :math:`f : \mathbb{C} \to \mathbb{C}`.  We often write the domain variable as :math:`z=x+iy`. Thus the function defined by :math:`f(z) = z^2` takes as input a complex number and returns its square.  You should check that :math:`f(2)=4`, :math:`f(2i)=-4`, and :math:`f(1+i)=2i`. One can extend the definitions of continuity, differentiability, and integrability to functions of a complex variable.  The branch of mathematics concerned with these ideas is *complex analysis*. 

When graphing a function :math:`f: \mathbb{R} \to \mathbb{R}`, we consider the :math:`x`-axis to represent the domain and the :math:`y`-axis to represent the codomain. However, for functions :math:`f: \mathbb{C} \to \mathbb{C}`, the domain and codomain are best represented by a plane instead of a line. Thus, we can't plot graphs of complex functions in the same way that we plot graphs of real functions because it would require :math:`4` dimensions. We often use other tricks to discover information about complex functions, such as using colors to tell us how near the output is to :math:`0`, plotting only the real or the imaginary part of the output, or only plotting the values that satisfy certain criteria, as we will do below.

To extend the idea of iterates to the complex plane, we introduce the *Mandelbrot set*. For any :math:`c=a+bi \in \mathbb{C}`, consider :math:`f_c: \mathbb{C} \to \mathbb{C}` defined by :math:`f_c(z) = z^2 + c`. Then the Mandelbrot set is the set of all :math:`c \in \mathbb{C}` for which the sequence :math:`\{f_c(0), f_c^2(0), f_c^3(0), \ldots\}` is bounded in absolute value, where the absolute value of a complex number is its distance from :math:`0`. In other words, the Mandelbrot set is the set of all complex :math:`c` such that the iterates of :math:`f_c` are bounded in absolute value for :math:`z = 0`. You have probably seen this set before; it is very beautiful and the boundary is a fractal curve.

Then, we will define the related *Julia set*. Once again, we will let :math:`f_c(z) = z^2 + c`, but in this case we will fix :math:`c \in \mathbb{C}`. Then the filled Julia set for this :math:`c` is the set of all :math:`z \in \mathbb{C}` such that :math:`\{f_c(z), f_c^2(z), f_c^3(z), \dots\}` is bounded in absolute value. The Julia set for this :math:`c` is the boundary of the filled Julia set.

Task 6
------


Use `this online tool <https://marksmath.org/visualization/julia2.html>`_ to explore Julia sets for different values of :math:`c`. On the left is the Mandelbrot set. Select a point somewhere in the plane on the left side of the screen, whether within the Mandelbrot set (the black region) or outside of it (the gray and white regions). On the right, the Julia set for that :math:`c` will be drawn. You can then select a point :math:`z` on the right side of the screen and it will show the sequence :math:`\{f_c(z), f_c^2(z), f_c^3(z), \dots\}`. Choose a point within the Julia set (this is easier to do if you choose a :math:`c` within the Mandelbrot set) and observe where the values of the sequence :math:`\{f_c(z), f_c^2(z), f_c^3(z), \dots\}` are. Now choose a point outside the Julia set. Comment on which sequences appear to be bounded in absolute value and which do not. Press the clear button, and keep playing around with this tool and see what beautiful Julia sets you can create!

 
.. Description: `Visit this link <https://www.dynamicmath.xyz/complex/mandelbrotjulia/>`_ to explore the Julia sets of the Mandelbrot set for different initial values of ``c``. The Mandelbrot set is on the left. Scroll your mouse over the plane on the left (inside or outside the Mandelbrot set) and the corresponding Julia set will appear on the right. Double click on the left plane to fix your initial value of ``c``. Notice that the black regions represent values of ``c`` where the corresponding sequence of iterates converges. Make a conjecture about which regions of the Mandelbrot set and Julia sets yield bounded sequences of iterates.




.. Task 1
.. ------

.. 1. Let :math:`f(x) = x^2 - 1`. Find the terms of the sequence :math:`\{x, f(x), f^2(x), f^3(x), \dots \}` by hand for :math:`x = 0` and :math:`x = 1`.

.. 2. Write a program that takes as input a value :math:`x` and plots the first :math:`50` terms of the sequence :math:`\{x, f(x), f^2(x), f^3(x), \dots \}`. Check your program against the computed values from Problem 1. *Comment*: While it may be tempting to use recursion for this problem, it may actually be more straightforward and efficient to not use recursion. Note that if we computed :math:`f^3(x)` recursively, the computations of :math:`f(x)` and :math:`f^2(x)` would get repeated in the process.

.. 3. Use your program to study the sequence :math:`\{x, f(x), f^2(x), f^3(x), \dots \}` for :math:`x = 1.1, 1.2, 1.3, \\ 1.4, 1.5, 1.6, 1.7.` Describe your results. If you get any errors, describe what errors you are getting and why. There may be some errors that show up that do not mean that your code is written poorly.

.. 4. By further exploration with different values of :math:`x`, make a conjecture about the largest value of :math:`x` for which :math:`\{f^n(x)\}` remains bounded.

.. 5. Now use your program with some negative values of :math:`x` to make a conjecture about the smallest value of :math:`x` for which :math:`\{f^n(x)\}` remains bounded. 

.. 6. A real number :math:`x` is a \textit{fixed point} of :math:`f` if :math:`f(x) = x`. Find all fixed points of :math:`f(x) = x^2 - 1`. What can you say about :math:`\{x, f(x), f^2(x), f^3(x), \dots \}` if :math:`x` is a fixed point? Consider again your conjecture from Problem 4 with this new information and modify the conjecture you made if necessary.

.. Challenge
.. ---------

.. We mentioned above that recursion may not be the best solution to this problem, but if we use memoization then we can avoid the re-computation problem. Using the :math:`functools` library, write a function that accepts an integer :math:`n` and a real number :math:`x` and computes :math:`f^n(x)` recursively. If you want to make your code nicely generalizable, you may want to consider writing the function :math:`f` as a separate function that is used within the recursive function instead of hard-coding in that :math:`f(x) = x^2 - 1`. For a review of memoization, look back over your recursion and Fibonacci numbers code from last semester.





.. Task 6
.. ------

.. Use `this online tool <https://marksmath.org/visualization/julia_sets/>`_ to explore Julia sets for different values of :math:`c`. On the left is the Mandelbrot set. Select a point somewhere in the plane on the left side of the screen, whether within the Mandelbrot set (the black region) or outside of it (the gray and white regions). On the right, the Julia set for that :math:`c` will be drawn. You can then select a point :math:`z` on the right side of the screen and it will show the sequence :math:`\{f_c(z), f_c^2(z), f_c^3(z), \dots\}`. Choose a point within the Julia set (this is easier to do if you choose a :math:`c` within the Mandelbrot set) and observe where the values of the sequence :math:`\{f_c(z), f_c^2(z), f_c^3(z), \dots\}` are. Now choose a point outside the Julia set. Comment on which sequences appear to be bounded in absolute value and which do not. Press the clear button, and keep playing around with this tool and see what beautiful Julia sets you can create!



