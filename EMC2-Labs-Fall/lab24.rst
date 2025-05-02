Lab 24: Lucas Sequences
=======================

Throughout this lab, our matrices will be ``sympy`` matrices.

If :math:`P` and :math:`Q` are integers, the Lucas sequence :math:`U_n(P,Q)` is defined as follows: 

.. math::
   U_0(P,Q)=0, \qquad U_1(P,Q)=1, 

and for :math:`n>1`,

.. math::
   U_n(P,Q) = P\cdot U_{n-1}(P,Q)-Q\cdot U_{n-2}(P,Q).


Notice that when :math:`P=1` and :math:`Q=-1`, we have that :math:`U_n(1,-1)` is the Fibonacci sequence.
The Lucas numbers can be computed efficiently using matrix multiplication. 
The recursive definition of :math:`U_n(P,Q)` means that 

.. math::
   \begin{bmatrix}U_{n+1}(P,Q)\\U_{n}(P,Q)\end{bmatrix} = \begin{bmatrix}P& -Q\\1&0\end{bmatrix}\begin{bmatrix}U_{n}(P,Q)\\U_{n-1}(P,Q)\end{bmatrix}.


Starting with :math:`U_0(P,Q)=0`, :math:`U_1(P,Q)=1`, and iterating this formula, we find

.. math::
   \begin{bmatrix}U_{n+1}(P,Q)\\U_{n}(P,Q)\end{bmatrix} = \begin{bmatrix}P& -Q\\1&0\end{bmatrix}^n\begin{bmatrix}1\\0\end{bmatrix}.





Task 1
------


Write a function ``LucasU_pow(P,Q,n)`` that calculates the value ``U_n(P,Q)`` using the matrix powers method described above.

>>> LucasU_pow(1,-1,8)
21
>>> LucasU_pow(1,-1,167)
35600075545958458963222876581316753
>>> LucasU_pow(3,4,8)
-93
>>> LucasU_pow(2,-5,50)
157629418574481317244196082

Eigenvalues
-----------

We can also give an exact formula for :math:`U_n(P,Q)` using the eigenvalues of the matrix, as long as :math:`4Q \neq P^2.` 
In this case, the matrix will have two distinct eigenvalues :math:`\lambda_1` and :math:`\lambda_2`. 
Suppose :math:`v_1` and :math:`v_2` are eigenvectors for these two eigenvalues. 
Then :math:`B = \{v_1, v_2\}` is a basis for :math:`\mathbb R^2`. 
If 

.. math::
   \left[\begin{matrix}a\\b\end{matrix}\right]=\left[ \left[\begin{matrix}1\\0\end{matrix}\right] \right]_B 

are the coordinates of 

.. math::
   \left[\begin{matrix}1\\0\end{matrix}\right] 

with respect to the basis :math:`B`, then 

.. math::
   \left[\begin{matrix}1\\0\end{matrix}\right]=a\mathbf{v_1}+b\mathbf{v_2}, 

and so 

.. math::
   \begin{bmatrix}U_{n+1}(P,Q)\\U_{n}(P,Q)\end{bmatrix} = \begin{bmatrix}P& -Q\\1&0\end{bmatrix}^n\begin{bmatrix}1\\0\end{bmatrix}=a \lambda_1^n\mathbf{v_1}+b\lambda_2^n \mathbf{v_2}.


Task 2
------


Write a function ``LucasU_eig(P,Q,n)``  that calculates the value :math:`U_n(P,Q)` using the eigenvalue method described above. You will need to think carefully about how to calculate the coordinates

.. math::
   \left[\begin{matrix}a\\b\end{matrix}\right]=\left[ \left[\begin{matrix}1\\0\end{matrix}\right] \right]_B. 

Since you are using ``sympy`` you will need to convert to floating point numbers to get a decimal expansion rather than a symbolic expression.
Also, Python doesn’t know how to convert complex numbers into floats; at the end of all the calculations, you may have a number of the form ``a + 0i`` if some eigenvectors were imaginary. This can be solved by, instead of calling ``float(result)``, calling ``float(sp.re(result))``, since ``sp.re()`` eliminates complex numbers in the output, allowing ``float()`` to do its job properly.

>>> LucasU_eig(1,-1,8)
21.0
>>> LucasU_eig(1,-1,167)
3.5600075545958458e+34
>>> LucasU_eig(3,4,8)
-93.0
>>> LucasU_eig(2,-5,50)
1.5762941857448133e+26



Challenge
---------


You can test if a number is probably prime using a Lucas sequence. 
For simplicity, we'll stick to the case ``P=1`` and ``Q=-1``. 
If ``m`` is a positive integer not divisible by ``5``, let 

.. math::
   d=\begin{cases}1 &\text{if }m\equiv \pm 1 \pmod{5}\\-1 &\text{if } m\equiv 2,3 \pmod{5}\end{cases}.


If ``m`` is prime then 

.. math::
   U_{m-d}(P,Q)\equiv 0 \pmod m.


If ``m`` is not prime, this will usually fail, so if a number passes this test we say it is probably prime. 
Write a function ``Lucas_test`` to implement this test to see if a number is probably prime. 
In order to make this test effective for large numbers, you will need to be able to compute large powers of the matrix, 

.. math::
   \left[\begin{matrix}1&1\\1&0\end{matrix}\right], 

reducing modulo ``m`` at each step. 
How can you do this effectively?






