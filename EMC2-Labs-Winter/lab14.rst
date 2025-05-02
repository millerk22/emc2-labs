Lab 14: Riemann Sums
====================

In this lab we will study Riemann sums in higher dimensions.

Task 1
------

Write a function ``riemann_sum_1D`` which takes 5 parameters ``f``, ``xMin``, ``xMax``, ``N``, and ``method`` and returns the Riemann sum

.. math::
	\sum_{i=1}^N f(x_i^*) \Delta x,

where ``Δx = (xMax - xMin)/N`` and ``method`` determines whether we are using the lower left, upper right, or midpoints of the partition. (The options for the method should be ``"left"``, ``"right"``, ``"mid"``).


Task 2
------

Write a function ``riemann_sum_2D`` which takes 7 parameters ``f``, ``xMin``, ``xMax``, ``yMin``,
``yMax``, ``N``, and ``method`` and returns the Riemann sum

.. math::
	\sum_{j=1}^N \sum_{i=1}^N f(x_i^*, y_j^*) \Delta x \Delta y,

where ``Δx = (xMax - xMin)/N``, ``Δy = (yMax - yMin)/N`` and ``method`` determines whether we are using the lower left, upper right, or midpoints of the partition. (The options for the method should be ``"left"``, ``"right"``, ``"mid"``). (Hint: you can copy much of the code you wrote for Task 1)


.. Task 2
.. ------

.. Using your function from Task 1, use the midpoint method to calculate the Riemann sums for ``N = 10`` and ``N = 20`` for the following functions and domains:

.. a) :math:`f(x,y) = x\sin(xy)` on the rectangle :math:`[0,\pi] \times [0,\pi]` 

.. b) :math:`g(x,y) = y^2 e^{-x-y}` on the rectangle :math:`[0,1] \times [0,1]` 

.. c) :math:`h(x,y) = x^3y^2 + xy` on the rectangle :math:`[0,1] \times [1,2]` 


Task 3
------

Consider the integral of :math:`f(x, y) = x \sin(x + y)` on the rectangle :math:`[0, \pi/6] \times [0, \pi/3]`. First calculate the exact value of this integral by hand. Then make a plot that shows the error of the midpoint Riemann integral approximation as :math:`N` ranges from :math:`1` to :math:`100`.

Task 4
------

Write a function ``riemann_sum_3D`` which takes ``9`` parameters ``f``, ``xMin``, ``xMax``, ``yMin``, ``yMax``, ``zMin``, ``zMax``, ``N``, and ``method`` and returns the Riemann sum

.. math::
	\sum_{k=1}^N \sum_{j=1}^N \sum_{i=1}^N f(x_i^*, y_j^*, z_k^*) \Delta x \Delta y \Delta z,

where ``Δx = (xMax - xMin)/N``, ``Δy = (yMax - yMin)/N``, ``Δz = (zMax - zMin)/N`` and ``method`` determines whether we are using the lower left, upper right, or midpoints of the partition. (Hint: you can copy much of the code you wrote for Task 2)

.. Task 5
.. ------

.. Using your function from Task 4, use the midpoint method to calculate the Riemann sums for ``N = 10`` and ``N = 20`` for the following function and domain:

.. .. math::
.. 	f(x,y,z) = xy+z^2 \text{ on the rectangle } [0,2] \times [0,1] \times [0,3].


Task 5
------

Description: Write a function, ``riemann_sum(f, x_min, x_max, N, method)``, that takes as input a function of an n-dimensional variable (``x``), ``f``, a vector of minimum values of the components of ``x``, ``x_min``, a vector of maximum values of the components of ``x``, ``x_max``, a number of sub-intervals to compute, ``N``, and Riemann method to use, ``method`` (``"left"``, ``"right"``, ``"mid"``).


