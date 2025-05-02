Lab 10: A Very Basic Program
============================

In Chapter 10 of the Math 341 textbook, you saw several examples of finding the base ``b`` representation of a rational number. This lab will be an extended version of the Programming Project at the end of the chapter.

Suppose that we want to find the base ``b`` representation of a rational number :math:`x`, where :math:`0 \leq x < 1`. To do so, we define two sequences, :math:`(y_n)` and :math:`(a_n)`. For each :math:`n \in \mathbb N`, we let :math:`y_n` be the largest integer with :math:`y_n \leq b^n x`. Then we let :math:`a_n = y_n - b y_{n-1}`. The integers :math:`a_n` are the digits in the base :math:`b` representation of :math:`x`. We may decrease the number of comparisons we need to make by using the fact that :math:`y_n \geq b y_{n-1}`.


Task 1
------

Write a function ``to_base_b_frac(b,num,den,l)`` that accepts a base ``b`` and the numerator and denominator (written in base ``10``) of a rational number ``x`` and returns a list of the first ``l`` digits of the base ``b`` representation of ``x``. In other words, if

.. math::
    x = \frac{\texttt{num}}{\texttt{den}} = 0.a_1 a_2 a_3 \ldots

in base ``b``, then ``to_base_b_frac(b,num,den,l)`` returns ``[a_1, a_2, a_3, ..., a_l]``. 
Where necessary, use that ``a_0 = 0`` and ``y_0 = 0``, but do not return ``a_0`` as part of the list. 
If ``x`` does not satisfy ``0 <= x < 1``, then raise a ``ValueError`` because this algorithm only works for ``0 <= x < 1`` (use the error message ``f"Error: num / den ({num / den}) must be in [0,1)"``. Similarly, if ``l<0``, raise a ``ValueError`` (use the error message ``f"Error: l ({l}) must be non-negative"``).

>>> to_base_b_frac(3,1,4) #the base 3 rep of 1/4
[0, 2, 0, 2, 0, 2, 0, 2]
>>> to_base_b_frac(4,3,7) #the base 4 rep of 3/7
[1, 0, 2, 1, 2, 0, 1, 0]



.. Task 2
.. ------

.. 1. Find the base ``3`` representations of ``1/4`` and ``8/13``.

.. 2. Find the base ``4`` representations of ``3/7`` and ``19/21``.

.. 3. Try to find the base ``5`` representations of ``1``, ``5/4``, and ``-1/2`` using your code. (It is entirely possible to find these, but we would have to modify the algorithm that we are using, some of which we will do below.)
    

Integers
--------


The algorithm above works for all :math:`0 \leq x < 1`. 
We want to be able to find the base :math:`b` representation of any nonnegative rational number. 
All nonnegative rational numbers :math:`y` can be written as :math:`y = \lfloor y\rfloor + x` where :math:`0 \leq x < 1` and :math:`\lfloor y \rfloor` denotes the "floor" of :math:`y`, i.e. largest integer less than or equal to :math:`y`. By this decomposition, we need only write an algorithm that can handle integers, and then we can combine the two algorithms into one algorithm that accepts any nonnegative rational number.

To see how this algorithm works, we will work out an example by finding the base ``5`` representation of ``123``.

.. admonition:: 123 in base 5

    To find the first digit of the base :math:`10` representation of a number :math:`n`, we ask: what is the biggest :math:`k` so that :math:`n - 10^k \geq 0`; then, how many times can we subtract that power of :math:`10`? 
    For example, we have :math:`123 - 10^2 \geq 0` but :math:`123 - 10^3 < 0`, so :math:`k=2`.
    Then, we see that we can only subtract :math:`10^2` once, so the first digit is :math:`1` and it is in the hundreds (:math:`10^2`) place.
    
    In base :math:`5`, we proceed the same way.
    First, we ask: what is the largest :math:`k` such that :math:`123 - 5^k \geq 0`? 
    Note that :math:`123 - 5^2 \geq 0` but :math:`123 - 5^3 < 0`. 
    Furthermore, :math:`123 - 4\cdot 5^2 = 23 \geq 0`, so the first digit is :math:`4` and it is in the :math:`5^2` place. 
    Continuing on with the remaining piece :math:`23`, we see that :math:`23 - 4 \cdot 5^1 = 3` and :math:`3 - 3\cdot 5^0 = 0`, so :math:`123 = 443_5`.



Task 2
------

Write a function ``to_base_b_int(b,n)`` that accepts a base ``b`` and a nonnegative integer ``n`` and returns a list of the digits of the base ``b`` representation of ``n``. Raise an ``ValueError`` if ``n`` is not a nonnegative integer.

>>> to_base_b_int(5, 495)
[3, 4, 4, 0]
>>> to_base_b_int(10, 31020302201)
[3, 1, 0, 2, 0, 3, 0, 2, 2, 0, 1]

.. 1. Find the base ``5`` representations of ``123``, ``495``, and ``31415926``. Find the base ``7`` representations of these numbers as well.

.. 2. Try to find the base ``8`` representations of ``1/2`` and ``-2``.


Task 3
------

Write a function ``to_base_b(b,num,den,l)`` that accepts a base ``b`` and the numerator and denominator of a rational number ``y`` and returns a tuple of the integer part and the fractional part (truncated to the first ``l`` digits, defaulting to ``8``). Recall that ``y = ⌊y⌋ + x``. The integer part refers to ``⌊y⌋`` and the fractional part refers to ``x`` such that ``0 <= x < 1``.

>>> to_base_b(2,19,5)
([1, 1], [0, 0, 1, 0, 1, 0, 0, 0])

.. Find the base ``8`` representations of ``1/2``, ``123``, ``22/7``, ``0``, ``1``, ``90/1``, and ``495/290``.
    



Challenge
---------

So far, we have been returning two lists of digits. Create a new function ``to_base_b_str(b,num,den,l)`` with the same inputs as ``to_base_b`` that now returns a string that looks like a floating point value ``c_1 c_2 ... c_k . a_1 a_2 ... a_l``. This function should be able to handle negative values. Then, run ``to_base_b_string`` on the values given in Problem 2. You may find the following functions useful:

    1. ``str(thing)`` accepts as input an int or float type and will return a string version of the number.
    2. ``float(thing)`` accepts as input an int or string type and will return a floating point number. (This only works for strings that already look like floats. For example, ``float("0.1")`` is valid, but ``float("ab")`` will raise an exception.)
    3. ``int(thing)`` will accept as input a float or string type and will return an integer. If the input is a float, ``int`` will return the floor of this number. Similar to ``float``, any string passed into ``int`` must already look like an integer, so ``int("5")`` is valid but ``int("ab")`` and ``int("0.1")`` are not.
    4. The ``+`` operator can add two numbers, but can also concatenate two strings (meaning stick them together end-to-end). For example, ``"a" + "b"`` will be the string ``"ab"``. Both inputs must be strings for this to work.

You may find it useful to write a separate function that takes as input any list of integers ``[1,2,3,...]`` and returns a string of them concatenated together ``"123..."``. It is also better coding practice to write separate functions to perform separate tasks.

*Important question and answer*: Why aren't we instead turning our result into a floating point number? Because a floating point number is *always* in base ``10`` in Python. So if we turned our result into a floating point number, Python's math operations wouldn't make sense anymore for our number since they would treat it as a base ``10`` number. Thus, we keep the base ``b`` number as a string.





