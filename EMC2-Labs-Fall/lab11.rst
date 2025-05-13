Lab 11: Dimensional Analysis
============================

In this lab, you will use a method called dimensional analysis to estimate the energy output of an atomic bomb.
...

Buckingham :math:`\pi` Theorem
------------------------------
The `Buckingham pi theorem <https://en.wikipedia.org/wiki/Buckingham_%CF%80_theorem>`_ states that if you have an equation in the real world that has :math:`n` variables (like velocity, distance, force, etc.), then you can rewrite it as an equation with :math:`k` physical dimensions (like distance, time, mass, etc.).

You don't need to worry about the details for this (although it is an interesting read). The important thing is that this essentially allows us to come up with any reasonable physical equation and if the units work out, we can use it.

"if the units work out"
~~~~~~~~~~~~~~~~~~~~~~~
When we put brackets around a variable, it means we are talking about the units of that variable. For example, velocity is measured in units of length (:math:`L`) and time (:math:`T`).

.. math::

    [v] = \frac{L}{T}

In order for the units to balance in an equation, both sides must reduce down to the same units. We know that for work:

.. math::

    W=Fd

Where 

* :math:`W` is work
* :math:`F` is force
* :math:`d` is distance

Note the units of these quantities in :math:`M` (mass), :math:`L` (length), and :math:`T` (time)

* :math:`[W] = M \frac{L^2}{T^2}`
* :math:`[F] = M \frac{L}{T^2}`
* :math:`[d] = L`

On the right side of this equation, we can simplify the units

.. math:: 

    L M \frac{L}{T^2} = M \frac{L^2}{T^2}

Which are the units of work.

A Simple Pendulum
-----------------
Here is a simple example of how this can be useful in the real world. Say we have a pendulum and we want to calculate the period (the time it takes to complete a swing). We assume that the period (:math:`t`, time) is based on the quantities :math:`m` (mass), :math:`l` (length), and :math:`g` (acceleration due to gravity).

.. image:: ./_static/pendulum.png
    :width: 40%
    
We are assuming that our equation looks something like:

.. math::

    t = m l g

We can do this because of the Buckingham :math:`\pi` theorem.

But because we don't actually *know* if the units will work out in this equation, we need to raise each :math:`m`, :math:`l`, and :math:`g` to an unknown power.

.. math::

    t = m^x l^y g^z
    
So we want to find :math:`x`, :math:`y`, and :math:`z` such that we end up with one unit of time, :math:`T`. Doesn't that sound familiar? It is just a system of equations.

We begin by replacing our the variables in our equation with their units. Remeber,

* :math:`[t] = T`
* :math:`[m] = M`
* :math:`[l] = L`
* :math:`[a] = \frac{L}{T^2}` 

So,

.. math::

    T = M^x L^y \frac{L^z}{T^{2z}}

Now we simplify:

.. math::

    T = M^x L^{y + z} T^{-2z}

We now go through each of the units and solve for the exponents. We see there are no :math:`M`'s or :math:`L`'s on the left, so we write :math:`x=0` and :math:`y+z = 0` respectively. We see that there is a :math:`T` on the left side, so we write :math:`-2z = 1`.

We end up with the matrix A, where the rows represent the physical dimension (:math:`M`, :math:`L`, and :math:`T`) and the columns represent the powers (:math:`x`, :math:`y`, and :math:`z`).

.. math::

    \begin{bmatrix}
    1 & 0 & 0\\
    0 & 1 & 1\\
    0 & 0 & -2\\
    \end{bmatrix}
    \begin{bmatrix} x \\ y \\ z \end{bmatrix}
    =
    \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}

It is interesting to note that :math:`x = 0`, means that mass does not play a significant role in the period of a pendulum.

Task 1: Solve the system
------------------------
Using ``numpy.linalg.solve(A, b)``, find the solution to this augmented matrix.

.. note::

    ``numpy.linalg.solve`` has parameters ``A`` which is the unaugmented matrix, and ``b`` which is the augmented part of the matrix. It solves for :math:`\vec{x}` in the equation :math:`A\vec{x} = b`.

With your solution, plug your values for :math:`x`, :math:`y`, and :math:`z` into our original equation. What do you get?

.. math::

    t = m^x l^y g^z

Now look up the equation for the period of a pendulum and see if you are right!

It is interesting to note that the modern estimated value for the energy yield is around 18 to 20 kilotons of TNT (1 Joule is about 2.3901e-13 kilotons of TNT). How close were your estimates?

Add a constant
Can they figure out everything just by looking ahead?