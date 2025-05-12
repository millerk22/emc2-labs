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
Here is a simple example of how this can be useful in the real world. Say we have a pendulum and we want to calculate the period (the time it takes to complete a swing). We assume that the period (:math:`t`, time) is based on the quantities :math:`l` (length), :math:`m` (mass), and :math:`a` (acceleration).

.. image:: ./static/pendulum.jpg

    :alt: pendulum.jpg

We are assuming that our equation looks something like:
.. math::
    t = l^x * m^y * a^z

The reason :math:`x`, :math:`y`, and :math:`z` are there is because we need the units to balance out. Remember
* :math:`[t] = T`
* :math:`[l] = L`
* :math:`[m] = M`
* :math:`[a] = \frac{L}{T^2}` 

So we want to find :math:`x`, :math:`y`, and :math:`z` such that we end up with one unit of time, :math:`T`. Doesn't that sound familiar?

We begin by replacing our the variables in our equation with their units:
.. math::
    [t] = [l]^x * [m]^y * [a]^z

becomes
.. math::
    T = L^x * M^y * \frac{L^z}{T^{2z}}

Now we combine all of the units

.. math::
    T = L^{x + z} * M^y * T^{-2z}

We now go through each of the units and solve for the exponents. We see there are no :math:`L`'s or :math:`M`'s on the left, so we write :math:`x+z = 0` and :math:`y=0` respectively. We see that there is a :math:`T` on the left side, so we write :math:`-2z = 1`

Pendulum example....
Task: solve the system

Walk through GI example
Task: do this for GI.
Task: write a function to estimate the different energies for different pictures


