Lab 23: Finding Areas of Arbitrary Polygons
===========================================

Polygons
~~~~~~~~

You may remember from elementary or middle school the formulas for special polygons such as triangles, trapezoids, and regular hexagons. 
In this lab we will use the theorems of Green and Stokes to find the area of arbitrary polygons in the plane and in 3-space. 
In theory we could use Monte Carlo integration to find the area, but for an arbitrary polygon it can be hard to determine whether a point is inside or outside the polygon.
Recall Green’s Theorem which says:

**Green's Theorem**: Let :math:`C` be a positively oriented, piecewise-smooth, simple closed curve in the plane and let :math:`D` be the region bounded by :math:`C`.
If :math:`P` and :math:`Q` have continuous partial derivatives on an open region that contains :math:`D`, then

.. math::
	\int_C P \, dx + Q \, dy = \iint_D \left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\right) \, dA.

Since we know that :math:`\iint_D 1 \, dA` gives the area of a region :math:`D` if we can find a :math:`P` and :math:`Q` such that :math:`\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y} = 1` then we could use Green's theorem to find the area.
There are several ways to do this but one way would be to set :math:`P(x,y) = -\frac 12y` and :math:`Q(x,y) = \frac 12 x`, then :math:`A = \frac 12 \oint_C x \, dy - y \, dx`. 
A few moments of thought (and recalling problem 25 in Section 16.4) will show that if :math:`C` is the line segment connecting the point :math:`(x_1, y_1)` to the point :math:`(x_2,y_2)` then

.. math::
	\int_C x \, dy - y \, dx = x_1 y_2 - x_2 y_1.

Task 1
------

Write a function, ``area(x)``, that takes an array of points in :math:`\mathbb R^2` in counter-clockwise order (positively oriented), ``x``, and computes the area of the polygon they define by using Green's Theorem.


Polyhedra
~~~~~~~~~

Suppose now you wish to find the area of the face of a polyhedron in :math:`\mathbb R^3`.
One way you could accomplish this would be to rotate and translate the polyhedron so that the face lies in the :math:`xy` plane.
Alternatively you could use Stokes' theorem, which we state below.

**Stokes' Theorem**: Let :math:`S` be an oriented piecewise-smooth surface that is bounded by a simple, closed piecewise-smooth boundary curve :math:`C` with positive orientation.
Let :math:`\mathbf F` be a vector field whose components have continuous partial derivatives on an open region in :math:`\mathbb R^3` that contains :math:`S`. Then

.. math::
	\int_C \mathbf F \cdot d \mathbf R = \iint_S \mathrm{curl} \mathbf F \cdot d\mathbf S = \iint_S \mathrm{curl} \mathbf F \cdot\mathbf n dS.

Recalling that the surface area of :math:`S` is equal to :math:`\iint_S 1 \, dS`, we need only find appropriate values for :math:`\mathbf F` and :math:`\mathbf n` so that :math:`\mathrm{curl} \mathbf F \cdot \mathbf n = 1`.
Let's begin with finding an appropriate value for :math:`\mathbf n`.
Since we are interested in finding the surface area of a face of a polyhedron, we know that the face is a plane.
The normal to the plane (and hence the surface) can be determined by finding the equation of the plane.

Task 2
------

Write a function, ``plane(x)``, that takes in three points (as an array) in :math:`\mathbb R^3`, ``x``, and calculates the the coefficients defining the plane that contains all three points i.e. return ``a, b, c, d`` such that ``a * x + b * y + c * z == d`` for ``x[0, :], x[1, :], x[2, :]``.


The Anti-curl
~~~~~~~~~~~~~

Now that we have found :math:`\mathbf n = \langle a,b,c \rangle` it remains to find an appropriate value of :math:`\mathbf F` so that :math:`\mathrm{curl} \mathbf F \cdot \mathbf n = 1.` 
In general, you cannot always find the anti-curl.
That is to say, given a vector field :math:`\mathbf G` it is not always possible to find a vector field :math:`\mathbf F` such that :math:`\mathrm{curl} \mathbf F = \mathbf G.`
However, for this specific problem it can be done.

Suppose that

.. math::
	\mathbf G = \left \langle \frac{1}{3a}, \frac{1}{3b}, \frac{1}{3c} \right\rangle.

A straightforward calculation shows that :math:`\mathbf G \cdot \mathbf n = 1.`
Since :math:`\mathbf G` is divergence-free (i.e. the divergence of :math:`\mathbf G` equals zero), we can find an :math:`\mathbf F` such that :math:`\mathrm{curl} \mathbf F = \mathbf G.` 
Unsurprisingly, this :math:`\mathbf F` is not unique and one such example of an :math:`\mathbf F` is

.. math::
	\mathbf F = \frac 16 \left\langle \frac zb - \frac yc, \frac xc - \frac za, \frac ya - \frac xb \right\rangle.

(Check this! It's good practice for your final exam.)

If :math:`C` is the line segment connection the point :math:`(x_1, y_1, z_1)` to the point :math:`(x_2, y_2, z_2)` then

.. math::
	\int_C \mathbf F \cdot d\mathbf r = \frac 16 \left( \frac{x_1y_2-x_2y_1}{c} + \frac{x_2z_1-x_1z_2}{b} + \frac{y_1z_2-y_2z_1}{a} \right).


Task 3
------

Use your code from the previous exercises to write a function, ``oriented_area(x)``, that takes an array of points in :math:`\mathbb R^3` in counter-clockwise order (positively oriented), ``x``, and computes the area of the polygon they define by using Stokes' Theorem. Make sure to first verify that all points lie in the same plane (by finding the plane and using ``np.isclose`` or ``np.allclose`` to verify each point satisfies the plane equation) and ``raise ValueError("all points must lie in the same plane")`` otherwise.



Equation of a plane
~~~~~~~~~~~~~~~~~~~

Suppose we want to find the equation of the plane that passes through the points :math:`A = (3, 0, -1)`, :math:`B = (-2, -2, 3)` and :math:`C = (7,1,-4)`.
The first thing is to create two vectors from the points.
We determine the vectors :math:`\mathbf{AB} = \langle -5, -2, 4\rangle` and :math:`\mathbf{AC} = \langle 4, 2, -3\rangle`.
These are two vectors that lie on the plane. 
The next step is to find a vector orthogonal to these two vectors, which can be done by finding the cross product.
Hence :math:`\langle a,b,c \rangle = \mathbf n = \mathbf{AB} \times \mathbf{AC} = \langle -2, 1, -2\rangle.`
Once we have found this normal vector we can use the equation of the plane

.. math::
	a(x-x_0) + b(y-y_0) + c(z-z_0) = 0,

where :math:`(x_0, y_0, z_0)` is a point on the plane.
Hence the equation of our example plane is

.. math::
	-2(x-3) + 1(y-0) - 2(z-(-1)) = 0, \quad \text{ i.e. } \quad 2x - y + 2z = 4.






