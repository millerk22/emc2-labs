Lab 15: The Euclidean Algorithm
===============================


Task 1: Iterative GCD
---------------------


Write a function ``gcd_it(a,b)`` that computes the GCD of ``a`` and ``b`` using a ``while`` loop. 
See Algorithm 17.20 in the Math 290 textbook. 
Your function should raise a ``ValueError`` if ``a`` and ``b`` are both zero. 


>>> gcd_it(12345,67890)
15
>>> gcd_it(-56,98)
14



Task 2: Recursive GCD
---------------------



Write a function ``gcd(a,b)`` that computes the GCD of ``a`` and ``b`` recursively. See Algorithm 17.21 in the Math 290 textbook. Your function should raise a ``ValueError`` if ``a`` and ``b`` are both zero. 


>>> gcd(112233,445566)
33



Task 3: The Extended GCD, nonnegative inputs
--------------------------------------------



In addition to computing the GCD :math:`d` of two integers :math:`a` and :math:`b`, the extended Euclidean algorithm also computes integers :math:`x` and :math:`y` such that :math:`d` can be written as the linear combination :math:`d = ax+by`. 

How does this work recursively? 
Suppose that we start with nonnegative integers :math:`a` and :math:`b` where :math:`a \leq b`. 
Then we know that :math:`d = gcd(a,b) = gcd(r,a)`, where :math:`b = qa+r` with :math:`0 \leq r < a`. 
If we have some way of computing integers :math:`e` and :math:`f` such that :math:`d = re+af` then we can work backwards as follows:

.. math::
   re + af &= d \qquad \qquad \text{plug in } r=b-qa, \\
   (b-qa)e + af &= d \qquad \qquad \text{do algebra} \\
   a(f-qe) + be &= d.

Now we have :math:`x` and :math:`y` such that :math:`ax+by=d`, namely :math:`x=f-qe` and :math:`y=e`.
(We can get :math:`q` by using integer division: :math:`q=b//a`)

It remains to find :math:`x, y` such that :math:`d = ax+by` in some simple base case. If :math:`a = 0` then we know that :math:`d = b` and therefore we can take :math:`x = 0` and :math:`y=1` to get :math:`b = a*0+b*1`.


Write a recursive function ``xgcd_pos(a,b)`` that performs the extended Euclidean Algorithm on the pair ``a, b``, assuming that ``a`` and ``b`` are nonnegative integers, not both zero. Do not do any error checking at this point.
Your function should return a list of three integers ``[d,x,y]`` such that ``d = gcd(a,b)`` and ``d = ax+by``. 
See Section 18.B in the Math 290 textbook. 

Here is some pseudocode to get you started.


.. code-block:: python

   def xgcd_pos(a,b):
      if a > b:
         return the result of xgcd_pos(b,a) after swapping x and y
      elif a==0:
         return [b, 0, 1]
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






