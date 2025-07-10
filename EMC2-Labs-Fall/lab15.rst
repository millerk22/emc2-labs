Lab 15: The Euclidean Algorithm
===============================


Task 1: Iterative GCD
---------------------


Write a function ``gcd_it(a,b)`` that computes the GCD of ``a`` and ``b`` using a ``while`` loop. 
See Algorithm 17.20 in the Math 290 textbook. 
Your function should raise a ``ValueError`` if ``a`` and ``b`` are both zero. 


>>> gcd_it(12345, 67890)
15
>>> gcd_it(-56, 98)
14



Task 2: Recursive GCD
---------------------



Write a function ``gcd(a, b)`` that computes the GCD of ``a`` and ``b`` recursively. See Algorithm 17.21 in the Math 290 textbook. Your function should raise a ``ValueError`` if ``a`` and ``b`` are both zero. 


>>> gcd(112233, 445566)
33



The Extended GCD Algoirthm
--------------------------

In addition to computing the GCD :math:`d` of two integers :math:`a` and :math:`b`, the extended Euclidean algorithm also computes integers :math:`x` and :math:`y` such that :math:`d` can be written as the linear combination :math:`d = ax+by`. 

In order to make this algorithm work recursively, we will always assume the first argument is always less than or equal to the second (:math:`a \leq b`). Keep in mind that :math:`gcd(a, b) = gcd(b, a)`.

We will need three separate cases, the recursive case, the base case, and the switch case.

Recursive Case
**************

Normally when doing a extended GCD algorithm problem, we care about the coefficients :math:`x` and :math:`y` in :math:`gcd(a,b) = d = ax + by`. To understand the recursive case (we can also think of this as the inductive step), we want to understand what happens after one more iteration of the GCD algorithm. We already know :math:`gcd(a,b)=d` and :math:`b=aq + r`. One more iteration takes us to :math:`gcd(r,a) = d` (note that :math:`r=b%a`). This gets us some different coefficients :math:`e` and :math:`f` in :math:`gcd(r,a) = d = re + af`. These coefficients represent the coefficients of the recursive case (sub-problem). Lets assume that the algoirthm will figure out these coefficients for us. All we have to do now is figure out how :math:`e` and :math:`f` relate to :math:`x` and :math:`y`.

.. math::
   re + af &= d\\
   (b-aq)e + af &= d \qquad \qquad \text{from } b=aq+r\\
   a(f-eq) + be &= d \qquad \qquad \text{simplify.}\\

This is in the form :math:`d = ax + by`. So our coefficients are

.. math::
   x &= f-eq\\
   y &= e\\
   q &= b//a \qquad \qquad \text{from } b=aq+r.\\

Remember that :math:`f` and :math:`e` are the coefficients for the recursive call (subproblem), while :math:`x` and :math:`y` are the coefficients for the current problem which are calculated from :math:`f` and :math:`e`.

Base and Switch Cases
*********************

The base case (what to return when we want to stop recursing) will be when :math:`a=0`. At that point we have :math:`gcd(a, b) = d = ax + by` so :math:`x=0`, :math:`y=1`, and :math:`d=b`.

The switch case will occur when :math:`a > b`. When that happens, we just need to switch :math:`a` and :math:`b` and :math:`x` and :math:`y`.

Task 3: The Extended GCD, nonnegative inputs
--------------------------------------------

Write a recursive function ``xgcd_pos(a,b)`` that performs the extended Euclidean Algorithm on the pair ``a, b``, assuming that ``a`` and ``b`` are nonnegative integers, not both zero. Do not do any error checking at this point.
Your function should return a list of three integers ``[d,x,y]`` such that ``d = gcd(a,b)`` and ``d = ax+by``. 
See Section 18.B in the Math 290 textbook. 

Here is some pseudocode to get you started.


.. code-block:: console

   def xgcd_pos(a,b):
      if a > b:
         return the result of xgcd_pos(b,a) after swapping x and y
      elif a==0:
         return the values for the base case
      else:
         get d, e, f from recursively calling xgcd_pos(b%a, a)
         set x = f-qe and y = e
         return [d, x, y]

>>> xgcd_pos(57,89)
[1, 25, -16]
>>> xgcd_pos(112233,445566)
[33, -4633, 1167]



Task 4: The Extended GCD, general inputs
----------------------------------------

Write a function ``xgcd(a,b)`` that takes in any integers ``a`` and ``b`` and returns ``[d,x,y]`` such that ``d=ax+by`` (unless ``a=0`` and ``b=0``).
Your function should raise an exception if ``a`` and ``b`` are both zero. 

The simplest way to do this is to call your ``xgcd_pos`` function from the previous task with ``abs(a)`` and ``abs(b)`` and modify the signs of ``x`` and ``y`` appropriately. 

>>> xgcd_pos(12, 53)
[1, -22, 5]
>>> xgcd(12,-53)
[1, -22, -5]

Task 5
------


Write a function ``sl2mat(a,b)`` that takes as input two relatively prime integers ``a`` and ``b`` (i.e. ``gcd(a,b)=1``) and returns a matrix ``[[a,b],[c,d]]`` such that ``c`` and ``d`` are integers and the matrix has determinant ``1`` (recall that the determinant is ``ad-bc``). 
Your function should raise a ``ValueError`` if ``a`` and ``b`` are not relatively prime.


>>> sl2mat(1,7)
[[1,7],[0,1]]
>>> sl2mat(17,-89)
[[17, -89], [-4, 21]]






