Lab 11: Dimensional Analysis
============================

In this lab, you will use a method called dimensional analysis to estimate the energy output of an atomic bomb.
...

Buckingham :math:`\pi` Theorem
------------------------------
The `Buckingham pi theorem<https://en.wikipedia.org/wiki/Buckingham_%CF%80_theorem>`_ states that if you have an equation in the real world that has :math:`n` variables (like velocity, distance, force, etc.), then you can rewrite it as an equation with :math:`k` physical dimensions (like distance, time, mass, etc.).

You don't need to worry about the details for this (although it is an interesting read). The important thing is that this essentially allows us to come up with any reasonable physical equation and if the units work out, we can use it.

"if the units work out"
~~~~~~~~~~~~~~~~~~~~~~~
When we put brackets around a variable, it means we are talking about the units of that variable. For example, velocity is measured in units of length (L) and time (T).

.. math::

    [v] = \frac{L}/{T}

In order for the units to balance in an equation, both sides must reduce down to the same units. We know that for work:

.. math::

    W=Fd

Where 
* :math:`W` is work
* :math:`F` is force
* :math:`d` is distance

Note the units of these quantities in M (mass), L (length), and T (time)
* :math:`[W] = M * \frac{L^2}{T^2}`
* :math:`[F] = M * \frac{L}{T^2}`
* :math:`[d] = L`

On the right side of this equation, we can simplify the units
.. math:: 
    L * M * \frac{L}{T^2} = M * \frac{L^2}{T^2}`

Which are the units of work.

A Simple Pendulum
-----------------
Here is a simple example of how this can be useful in the real world. Say we have a pendulum and we want to calculate the period (the time it takes to complete a swing). We assume that the period (:math:`t`, time) is based on the quantities :math:`m` (mass), :math:`l` (length), and :math:`a` (acceleration due to gravity).

.. image:: ./static/pendulum.jpg

    :alt: pendulum.jpg

We are assuming that our equation looks something like:
.. math::
    t = m * l * a

We can do this because of the Buckingham :math:`\pi` theorem.

But because we don't actually *know* if the units will work out in this equation, we need to raise each :math:`l`, :math:`m`, and :math:`a` to an unknown power.
.. math::
    t = m^x * l^y * a^z
    
So we want to find :math:`x`, :math:`y`, and :math:`z` such that we end up with one unit of time, :math:`T`. Doesn't that sound familiar? It is just a system of equations.

We begin by replacing our the variables in our equation with their units. Remeber,
* :math:`[t] = T`
* :math:`[m] = M`
* :math:`[l] = L`
* :math:`[a] = \frac{L}{T^2}` 

So,
.. math::
    T = M^x * L^y * \frac{L^z}{T^{2z}}

Now we simplify:
.. math::
    T = M^x * L^{y + z} *  * T^{-2z}

We now go through each of the units and solve for the exponents. We see there are no :math:`M`'s or :math:`L`'s on the left, so we write :math:`x=0` and :math:`y+z = 0` respectively. We see that there is a :math:`T` on the left side, so we write :math:`-2z = 1`.

We end up with the matrix A, where the rows represent the physical dimension (:math:`M`, :math:`L`, and :math:`T`) and the columns represent the powers (:math:`x`, :math:`y`, and :math:`z`).

.. math::
    A = 
    \begin{bmatrix}[ccc|c]
    1 & 0 & 0 & 0\\
    0 & 1 & 1 & 0\\
    0 & 0 & -2 & 1\\
    \end{bmatrix}

Task 1: Solve the system
------------------------
Using ``numpy.linalg.solve(A, b)``, find the solution to this augmented matrix.

.. note::
    ``numpy.linalg.solve`` has parameters ``A`` which is the unaugmented matrix, and ``b`` which is the augmented part of the matrix. It solves for :math:`x` in the equation :math:`Ax = b`.

With your solution, plug your values for :math:`x`, :math:`y`, and :math:`z` into our original equation. What do you get?

.. math::
    t = m^x * l^y * a^z

Now look up the equation for the period of a pendulum and see if you are right!



Walk through GI example
Task: do this for GI.
Task: write a function to estimate the different energies for different pictures


Add a constant