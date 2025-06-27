

Lab 10: Counterexamples
=======================

In this lab we will use a computer search to find counterexamples to some statements that seem plausible, given a handful of initial data, but are actually false.
For each "proposition" listed below, determine the smallest counterexample.


"Proposition" 1: Fermat Primes
------------------------------

**Disprove**: Every number of the form :math:`2^{2^k}+1` is prime, for :math:`k=0,1,2,3,\ldots`.

Write a function ``fermat_prime(k)`` that takes an integer ``k`` and outputs ``True`` or ``False`` depending on whether or not ``2^(2^k)+1`` is prime.


*Hint*: The SymPy package has some useful functions for primality testing and factoring:

>>> from sympy import isprime, factorint

.. note::

   `SymPy <https://www.sympy.org/en/index.html>`_ is a library created to do symbolic mathematics. 
   You can write math expressions to use in code in the way that you do on paper.
   It also provides very nice functions to do algerbra, calculus, linear algerbra, and equation solving. 

"Proposition" 2: Mersenne Primes
--------------------------------

**Disprove**: Whenever :math:`p` is a prime number, :math:`2^p-1` is also a prime number.

Write a function ``mersenne_prime(p)`` that takes a prime number ``p`` and outputs ``True`` or ``False`` depending on whether or not ``2^p-1`` is prime.


*Hint*: You can get the ``n``-th prime using ``prime(n)`` after you import ``prime`` from ``sympy``.


"Proposition" 3: Prime Number Races
-----------------------------------

Fact: Every prime number larger than :math:`2` is congruent to either :math:`1` or :math:`3` modulo :math:`4`.
Let :math:`\pi_1(x)` denote the number of primes :math:`\leq x` which are :math:`1` modulo :math:`4`, and define :math:`\pi_3(x)` likewise.
For example, :math:`\pi_1(15) = 2` (counting :math:`5` and :math:`13`) and :math:`\pi_3(15) = 3` (counting :math:`3`, :math:`7`, :math:`11`).

**Disprove**: :math:`\pi_3(x)` is always in first place (or tied for first) in the "prime number race," that is, :math:`\pi_3(x) \geq \pi_1(x)` for all :math:`x \geq 3`.

In your code, define two empty lists ``pi1=[]`` and ``pi3=[]``. Set ``p=3``.
Write a ``while`` loop that adds the prime ``p`` to the appropriate list, incrementing to the next prime with ``p=nextprime(p)``.
Exit the loop when you have found a counterexample to the "proposition", and print the value of ``p``.


*Interesting fact*: it has been proven that 

.. math::

   \lim_{x\to \infty} \frac{\pi_1(x)}{\pi_3(x)} = 1

meaning that "at infinity" the prime number race ends in a tie.

"Proposition" 4: Cyclotomic Polynomials
---------------------------------------

For each :math:`n`, factor the polynomial :math:`x^n-1` as much as possible, assuming that only integer coefficients are allowed.
For example,

.. math::
   x^2-1 = (x-1)(x+1), \quad x^3-1 = (x-1)(x^2+x+1), \quad x^4-1 = (x-1)(x+1)(x^2+1), \ldots.


The polynomials :math:`x-1`, :math:`x+1`, :math:`x^2+1`, :math:`x^2+x+1`, ..., are called *cyclotomic polynomials*.

**Disprove**: Every coefficient of every cyclotomic polynomial is in the set :math:`\{1,0,-1\}`.


Write a function ``factor_coefficients(poly)`` that takes as input a polynomial ``poly`` in the variable ``x`` and outputs a list containing the coefficients of every irreducible factor of ``poly``. Do not include repeats.


*Hint*: For this problem, you should start by running the following code:

>>> from sympy import factor_list, symbols, Poly
>>> x = symbols('x')

Then you can get a list of factors of a polynomial by running code like

>>> factor_list(x**10-1)[1]
[(x - 1, 1),
(x + 1, 1),
(x**4 - x**3 + x**2 - x + 1, 1),
(x**4 + x**3 + x**2 + x + 1, 1)]

This will output a list of ordered pairs, with the first element of each pair being a polynomial, and the second element being the exponent of that factor:

.. math::
   x^{10} - 1 = (x-1)^1(x+1)^1(x^4-x^3+x^2-x+1)^1(x^4+x^3+x^2+x+1)^1


Then for each factor you can do something like

>>> fac=(x**4 - x**3 + x**2 - x + 1,1)[0]
>>> Poly(fac).coeffs()
[1, -1, 1, -1, 1]

to get a list of the coefficients. 
If you can get all of the coefficients into one list, turn this list into a set, and then back into a list to remove duplicates.



