Lab 2319: Object Oriented Programming
=====================================

In this lab you will learn about Object Oriented Programming (OOP) in Python. This includes:

* Classes
* Objects
* Inheritance
* Dunder methods

Object Oriented Programming is simply another way to organize code. So far, we have only done functional programming, where we write functions to perform tasks. One benefit of OOP is that it is generally better than functional programming when representing real world objects. There are advantages and disadvantages to both approaches and by the end of this lab you will be able to see some of these differences.

Classes
-------

.. Important::
    In OOP, a **class** is a type of thing, while an **object** is a specific one of those things.

In the real world, we talk about classes and objects all the time. For example, a writing utensil (the class) could be a pencil, pen, marker, chalk, etc. (which are objects of that class). Each of these objects has different properities such as color and length.

We can represent the ``WritingUtensil`` class in python like this:

.. code:: python
    
    class WritingUtensil:
        def __init__(self, color, length):
            self.color = color
            self.length = length

The ``__init__`` function is called a **constructor** and it is called every time we create a new object of the class. The constructor is used to initialize the **attributes** of the object. In this case, we have two attributes: ``color`` and ``length``.

We can create new ``WritingUtensil`` objects like this (using the constructor): 

.. code:: python

    pencil = WritingUtensil("black", 5)
    pen = WritingUtensil("blue", 4)

We can access or change attributes using dot notation:

>>> pencil.color
'black'
>>> pen.color
'blue'
>>> pen.color = "black"
>>> pen.color
'black'

You may have noitced that ``self`` appears frequently in our class. Whenever we use ``self`` it refers to the current object. So ``self.color`` sets our instance of class ``WritingUtensil`` to something like ``"blue"``.

Classes can also have **class attributes**. These are very similar to instance attributes (seen in the example above), but they apply to the entire class. They are located on the same level as the constructor.

.. code:: python

    class WritingUtensil:
        brand = "bic"
        def __init__(self, color, length):
            self.color = color
            self.length = length

So if we create a ``pencil`` and ``pen`` object just like we did above, we can access the brand on any object of type ``WritingUtensil``.

>>> pencil.brand
'bic'
>>> pen.brand
'bic'

It is possible to change class attributes as well

>>> pen.brand = "uni"
>>> pen.brand
'uni'
>>> pencil.brand
'bic'

If we could only rely on class attributes and instance attributes, working with classes would be very limited. Fortunately, **methods** enhance the capability of classes. Methods are essentially functions that act on objects.

.. code:: python

    class WritingUtensil:
        brand = "bic"
        def __init__(self, color, length):
            self.color = color
            self.length = length
            
        def write(self, message):
            print(f"'{message}' written in {self.color}")
            
``write`` is a method that takes in a message and prints the message to the screen along with what color it would have been written in.

.. Note::
    Whenever you create a method in a class, it needs to have ``self`` as the first argument, otherwise your method won't have access to class/instance attributes, or other methods.

Task 1: Rectangle
-----------------
Create a ``Rectangle`` class that has instance variables ``length``, and ``width``. Write methods called ``area`` and ``perimeter`` that compute the area and perimeter of the rectangle.

Inheritance
-----------

Classes and objects provide a neat way of reusing code in certain cases. Imagine we want a way to represent a writing utensil more specifically with a ``Pen`` and ``Pencil`` class. It is important to note that the attributes in ``Pen`` and ``Pencil`` would be the same attributes in ``WritingUtensil`` with a few attributes added on. We can use **inheritance** to make these three classes without rewriting the same thing each time.

.. code:: python

    class Pen(WritingUtensil):  # this is how we show Pen inherits from WritingUtensil
        def __init__(self, color, length):
            super().__init__(color, length) # call WritingUtensil's __init__ method

    class Pencil(WritingUtensil): # this is how we show Pencil inherits from WritingUtensil
        def __init__(self, color, length):
            super().__init__(color, length) # call WritingUtensil's __init__ method

The line ``super().__init__(color, length)`` takes the parameters from ``Pen`` or ``Pencil``'s ``__init__`` method and passes them to the superclass ``__init__`` method. We know the superclass for ``Pen`` or ``Pencil`` is ``WritingUtensil`` from where we define the class ``class Pencil(WritingUtensil):``.

.. Note::
    We don't need our ``write`` method in ``Pen`` or ``Pencil`` because it is contained in ``WritingUtensil``. We can still call it the same way.

At this point, we have created classes that inherit from another class, but it isn't all that useful to us because our sub-classes are the exact same as our superclass. We can make ``Pen`` and ``Pencil`` more useful by adding methods or attributes directly to their definitions.

Let's say we we want to add an attribute to the ``Pencil`` class to indicate whether it's a mechanical or a regural pencil, along with an ``erase`` method.

.. code:: python

    class Pencil(WritingUtensil):
        def __init__(self, color, length, kind):
            super().__init__(color, length, kind)
            self.type = kind    # "mechanical" or "regular"

        def erase():
            print("Erased last line")

Let's say we want to add an attribute to the ``Pen`` class to represent how much ink is left.

.. code:: python

    class Pen(WritingUtensil):
        def __init__(self, color, length):
            super().__init__(color, length)
            self.percent_of_ink_left = 100  # if we assume it always starts at 100%, then we can set it without passing in a value

>>> mechanical_pencil = Pencil("black", 5, "mechanical")
>>> mechanical_pencil.write("Hello World")
'Hello World' written in black
>>> mechanical_pencil.erase()
Erased last line
>>> pencil = Pencil("grey", 6, "regular")
>>> pencil.write("Hello BYU")
'Hello BYU' written in grey
>>> pencil.erase()
Erased last line
>>> pen = Pen("blue", 4)
>>> pen.write("Hello EMC2")
'Hello EMC2' written in blue
>>> pen.percent_of_ink_left
100

This was an introduction to what classes can do and there is a lot of functionality we didn't cover. What is important to understand right now is that classes are an excellent way to reduce code duplication when representing real world objects.

Task 2: Square
--------------
Create a ``Square`` class with an instance variable ``length``. ``Square`` inherits from the ``Rectangle`` class you wrote in Task 1. Make sure you can find the ``area`` and ``perimeter`` of a ``Square``!

.. Hint::
    You don't need to write ``area`` and ``perimeter`` again.

Dunder Methods
--------------

When you first saw ``__init__``, it may have seemed like a weird way to write a method. That's because it is a special type of method called a **Dunder method** (short for "double underscore"). These are built-in methods to all Python classes that have default behavior.

For example, ``__add__`` is a Dunder method that has a default behavior of adding things together. This works intuitively for ``int`` and ``float``. Python has also defined ``__add__`` for ``str`` where ``a + b`` is the concatenation of ``a`` and ``b``.

>>> a = "Hello"
>>> b = "World"
>>> a + b
"HelloWorld"

.. Note::
    ``int``, ``float``, ``str`` and all other types in Python are made using classes.

Consider this class:

.. code:: python

    class Sandwich:
        def __init__(self, length: int, toppings: list)
            """Creates a Sandwich class with a length in inches and a list of toppings like ['bacon', 'lettuce', 'tomato']
            """
            self.toppings = toppings
            self.length = length

Let's say we wanted the ``__add__`` behavior of our ``Sandwich`` class to add a topping to our sandwich.

.. code:: python
    
    class Sandwich:
        def __init__(self, length: int, toppings: list):
            self.toppings = toppings
            self.length = length

        def __add__(self, topping: str):
            self.toppings.append(topping)

So now, we can do the following

>>> blt = Sandwich(6, ['bacon', 'lettuce', 'tomato'])
>>> blt.toppings
['bacon', 'lettuce', 'tomato']
>>> blt + 'mayo'
>>> blt.toppings
['bacon', 'lettuce', 'tomato', 'mayo']

.. Note::
    Now that you know about Dunder methods, it is a lot easier to explain how NumPy adds vectors together. They simply implemented the ``__add__`` Dunder method!

One really important Dunder method is ``__str__``. It is used in Python any time the object needs to be represented as a string (like when using ``print()``) or any time ``str()`` is called. Right now, our ``Sandwich`` object is represented by something like

>>> print(blt)
<__main__.Sandwich object at 0x10299c790>

If we write our own ``__str__`` method, we can make this look a lot cleaner.

.. code:: python

    def __str__(self):
        return f"{self.length} inch sandwich with toppings: {', '.join(self.toppings)}"

So instead of some a confusing print statement, we get:

>>> print(student)
6 inch sandwich with toppings: bacon, lettuce, tomato, mayo

Python provides many other Dunder methods that allow you to customize many other built-in operations:

* ``__eq__`` used for ``==``
* ``__ne__`` used for ``!=``
* ``__lt__`` used for ``<``
* ``__gt__`` used for ``>``
* ``__ge__`` used for ``>=``
* ``__le__`` used for ``<=``
* ``__str__`` used for ``str()``
* ``__int__`` used for ``int()``
* ``__len__`` used for ``len()``
* ``__add__`` used for ``a + b``
* ``__sub__`` used for ``a - b``
* ``__mul__`` used for ``a * b``

Task 3: Vector
--------------
Write a class called ``Vector`` that takes in a python list. ``Vector`` will implement vector addition and scalar multiplication using ``__add__`` and ``__mul__`` which should return a new ``Vector`` as the result.

Source code will be given on CodeBuddy.

.. .. code:: python

..     class Vector():
..         def __init__(self, vector):
..             """Takes in a list called vector"""
..             self.vector = vector
..             self.length = len(vector)
        
..         def __add__(self, other_vector):
..             """Vector addition
            
..             Raises a ValueError if the vectors are different lengths

..             Parameters:
..             self : Vector
..                 The current object 
..             other_vector : Vector
..                 The vector we are adding

..             Returns:
..             ret : Vector
..                 The result of self + other_vector
..             """
..             # replace pass with your code
..             pass
        
..         def __mul__(self, scalar):
..             """Scalar multiplication
            
..             Parameters:
..             self : Vector
..                 The current object 
..             scalar : int, float
..                 The scalar we multiply by

..             Returns:
..             ret : Vector
..                 The result of self * scalar
..             """
..             # replace pass with your code
..             pass
        
..         def __str__(self):
..             return f"Vector of {self.vector}"

Application: Binary
-------------------
Binary is how computers represent numbers. We are used to a decimal ("dec" meaning ten) representation where there are ten symbols: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9. In binary, there are only two symbols: 0 and 1.

To represent 2319 in decimal, we have :math:`2\cdot 10^3 + 3\cdot 10^2 + 1 \cdot 10^1 + 9 \cdot 10^0`. To represent 2319 in binary, we write, :math:`100100001111 = 1 \cdot 2^{11} + 0 \cdot 2^{10} + 0 \cdot 2^9 + 1\cdot 2^8 + 0 \cdot 2^7 + 0 \cdot 2^6 + 0 \cdot 2^5 + 0 \cdot 2^4 + 1 \cdot 2^3 + 1 \cdot 2^2 + 1 \cdot 2^1 + 1 \cdot 2^0 = 2319`.

The formula is

.. math::

    \text{binary} = n \cdot 2^d

Where :math:`n` is the :math:`1` or :math:`0` and :math:`d` is the digit index (starting where the least significant bit is 0).

The algorithm to convert from a decimal number :math:`n` to binary goes like this:

#. Take the remainder of :math:`n/2` using integer division. It becomes the new most significant digit of our binary number.
#. Set :math:`n` to the the quotient of :math:`n/2`
#. Repeat this process until there are no digits left.

.. Note::

    It is helpful to use the modulo operator ``%`` to get the remainder and the floor division operator ``//`` to get the quotient.

So to convert 2319 to binary we do:

.. list-table:: Algorithm
   :widths: 50 25 25
   :header-rows: 1

   * - Operation
     - Quotient
     - Remainder
   * - 2319/2
     - 1159
     - 1
   * - 1159/2
     - 579
     - 1
   * - 579/2
     - 289
     - 1
   * - 289/2
     - 144
     - 1
   * - 144/2
     - 72
     - 0
   * - 72/2
     - 36
     - 0
   * - 36/2
     - 18
     - 0
   * - 18/2
     - 9
     - 0
   * - 9/2
     - 4
     - 1
   * - 4/2
     - 2
     - 0
   * - 2/2
     - 1
     - 0
   * - 1/2
     - 0
     - 1

Now we write the remainders starting from the bottom up, and we get :math:`100100001111` which is what we had above.

Task 4: Binary Class
--------------------
Write a class called ``Binary`` that takes in an integer.

* When a ``Binary`` object is printed, it should display the binary representation as a string of 1's and 0's.
* When `int()` is called on a  ``Binary`` object, it should return the original number in base 10.
* ``Binary`` objects can be subtracted with one another to produce another ``Binary`` object. It should raise a ``ValueError`` if the result would be negative.
* ``Binary`` objects can be added with one another to produce another ``Binary`` object.
* ``Binary`` objects can be compared with one another for equality (the ``==`` operator)

.. Hint::
    It may be easiest to do all the math with the decimal representation of the number, and then just convert it to the binary representation when it needs to be printed out as a string.