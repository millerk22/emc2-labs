Lab 18: Modular Arithmetic
==========================


Task 1
------

An *elliptic curve* is an equation of the form

.. math::
   E(a,b): y^2 = x^3 + ax + b

for fixed integers ``a,b``. 
For example, when we set ``a=b=1`` we get the elliptic curve 

.. math::
   E(1,1): y^2=x^3+x+1.

In cryptography, it is helpful to count the number of points on ``E(a,b)`` modulo some prime number ``p``.
This means that we want to count the number of ordered pairs ``(x,y)`` with ``0 <= x,y <= p-1`` such that

.. math::
   y^2 \equiv x^3 + ax + b \pmod{p}.



Write a function ``num_points(a,b,p)`` that takes as input two integers ``a`` and ``b`` and a prime ``p``, and returns the number of points on ``E(a,b)`` modulo ``p``.


>>> num_points(1,1,5)
8
>>> num_points(0,1,97)
83



Task 2
------

The textbook for Math 687R (a graduate number theory course at BYU) in Fall 2018 was *Auxiliary Polynomials in Number Theory* by David Masser.
One of the exercises in that book states: do there exist integers ``a,b,c,d,e,f`` such that ``a != 0`` and

.. math::
   y^2 = ax^5+bx^4+cx^3+dx^2+ex+f

has no solutions modulo ``11``?
The author states that he does not know the answer to this question.

Write a function ``has_sol(a,b,c,d,e,f)`` that takes in integers ``a,b,c,d,e,f`` and returns ``True`` if the equation has a solution modulo ``11``, and ``False`` otherwise.


Find some ``a,b,c,d,e,f``, all nonzero, such the equation above has no solutions modulo ``11``.



Task 3
------


Write a program that finds every ``n`` in ``[3,4,...,500]`` that satisfies the congruence

.. math::
   2^{n-1} \equiv 1\pmod{n}.

Save your list in a variable named ``pseudoprimes``.


What do you notice about these ``n``? 
Is your observation true about *every* ``n`` in your list?


Task 4
------

Suppose that ``p`` is a prime number.
In this task you will write a program that does the following.
For every ``n`` in ``[1,2,...,p-1]`` find the smallest positive ``k`` such that

.. math::
   n^k \equiv 1 \pmod{p},

if such a ``k`` exists. 

Write a program ``allk(p)`` that takes a prime number ``p`` and outputs a list of length ``p-1`` consisting of all the ``k`` values asked for in this problem for the prime ``p``. 

Then, run the following code.

.. code-block:: python

   for p in range(20,100):
     if isprime(p):
        print(p,': ', allk(p))


What do you notice about these values of ``k``? 
Formulate a conjecture (guess).



