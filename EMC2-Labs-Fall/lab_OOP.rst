Lab 2319: Object Oriented Programming
=====================================

In this lab you will learn about Object Oriented Programming (OOP) in Python. You will learn about:
- classes
- objects
- inheritance
- modules

Object Oriented Programming is simply another way to organize code. So far, we have only done functional programming, where we write functions to do things. One benefit of OOP is that it is generally better than functional programming when representing real world objects. There are advantages and disadvantages to both approaches and by the end of this lab you will be able to see some of these differences.

Classes
-------

.. Important::
    In OOP, a **class** is a kind of thing, while an **object** is a specific one of those things.

In the real world, we talk about classes and objects all the time. For example, a writing utensil (the class) could be a pencil, pen, marker, chalk, etc. (which are objects of that class). Each of the objects have different properities like kind, color, and length.

We can represent the ``WritingUtensil`` class in python like this:

.. code:: python
    
    class WritingUtensil:
        def __init__(self, kind, color, length):
            self.kind = kind
            self.color = color
            self.length = length

The ``__init__`` function is called a **constructor** and it is called every time we create a new object of the class. The constructor is used to initialize the **attributes** of the object. In this case, we have three attributes: ``kind`` ``color``, and ``length``.

We can create a new object of type ``WritingUtensil`` like this (using the constructor): 

.. code:: python

    pencil = WritingUtensil("pencil", "yellow", 5)
    pen = WritingUtensil("pen", "blue", 4)
    chalk = WritingUtensil("chalk", "white", 2)

We can access attributes using dot notation:

>>> pencil.kind
'pencil'
>>> pen.color
'blue'
>>> chalk.length
2

You may have noitced that ``self`` appears a lot in our class. Whenever we use ``self`` it refers to the current object. So ``self.kind`` sets our instance of class ``WritingUtensil`` to something like ``"pen"``.

Consider another example:

.. code:: python

    class Student:
        def __init__(self, name, classes, grade, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.grade = grade
            self.intelligence = intelligence

We have **instance attributes** of ``name``, ``classes``, ``gpa``, and ``intelligence``. These attributes only apply to the specific instance of our object, but sometmies it is appropriate to have what is called a **class attribute**. Class attributes apply to the entire class. In our example, say that each student can turn in 3 late assignments, then

.. code:: python

    class Student:
        late_assignments_left = 3

        def __init__(self, name, classes, grade, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.grade = grade
            self.intelligence = intelligence

Every student object will have access to their own copy of ``late_assignments``.

>>> cosmo = Student("Cosmo", ["American Heritage", "Linear Algebra", "Math 290"], 98)
>>> cougar = Student("Cougar", ["Linear Algebra"], 97)
>>> cosmo.late_assignments_left
3
>>> cosmo.late_assignments_left = 2
>>> cosmo.late_assignments_left
2
>>> cougar.late_assignments_left
3

If we could only rely on class attributes and instance attributes, working with classes would be very limited. Fortunately, **methods** enhance the capability of classes. Methods are essentially functions that act on classes.

.. code:: python

    class Student:
        late_assignments_left = 3

        def __init__(self, name, classes, grade, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.grade = grade
            self.intelligence = intelligence

        def improve_grade(self, percentage):
            self.grade += percentage
            return self.grade # the new grade
        
        def study(self, time):
            self.intelligence += time * 0.2 # time in hours
        
``improve_grade`` is a method that takes in a percentage and increase the grade by that percentage. It then returns the new grade of the student.
``study`` is a method that takes in a time (in hours) and increases the student's intelligence by a scaled version of that time.

.. Note::
    Whenever you create a method in a class, it needs to have ``self`` as the first argument, otherwise your method won't have access to class/instance attributes, or other methods.

Task 1: Create a Class
----------------------
Create a ``Rectangle`` class that has instance variables ``length``, and ``width``. Write methods called ``area`` and ``perimeter`` that compute the area and perimeter of the rectangle.

Inheritance
-----------

Classes and objects provide a neat way of reusing code in certain cases. Imagine we want a ``Professor`` class to go with our student class.

.. code:: python

    class Professor:
        def __init__(self, name, classes, experience, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.experience = experience    # in years
            self.intelligence = intelligence
        
        def study(self, time):
            self.intelligence += time * 0.2 # time in hours

Notice how the attributes ``name``, ``classes``, and ``intelligence`` and the method ``study`` are shared between ``Student`` and ``Professor``. We can create a class called ``Person`` that contains these attributes and methods.

.. code:: python
    
    class Person:
        def __init__(self, name, classes, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.intelligence = intelligence
        
        def study(self, time):
            self.intelligence += time * 0.2 # time in hours

Then we can change the ``Student``class to look like this:

.. code:: python

    class Student(Person):  # this is saying Student inherits from Person

        late_assignments_left = 3

        def __init__(self, name, classes, grade, intelligence):
            super().__init__(name, classes, intelligence)   # calls the superclass init method
            self.grade = grade

        def improve_grade(self, percentage):
            self.grade += percentage
            return self.grade # the new grade

The line ``super().__init__(name, classes, intelligence)`` takes the parameters from ``Student``'s ``__init__`` method and passes them to the superclass ``__init__`` method. The superclass for ``Student`` is ``Person`` because that is where it inherits from. After calling the superclass's init method, ``Student`` sets the instance variables that are unique to a student.

.. Note::
    We don't need our ``study`` method in ``Student`` because it is contained in ``Person``. We can still call it the same way.

Then our ``Professor`` class would look like this:

.. code:: python

    class Professor(Person):
        def __init__(self, name, classes, experience, intelligence):
            super().__init__(name, classes, intelligence)
            self.experience = experience    # in years

Classes are an excellent way to reduce code duplication when representing real world objects.

Task 2: Squares and Rectangles
------------------------------
Create a ``Square`` class with an instance variable ``length``. ``Square`` inherits from the ``Rectangle`` class you wrote in Task 1. Make sure you can find the ``area`` and ``perimeter`` of a ``Square``!

Dunder Functions
----------------
When you first saw ``__init__``, it may have seemed like a weird way to write a function. That is because it is a special type of function called a Dunder function (Double UNDERscore). These are built in functions to all Python classes that have default behavior.

For example, ``__add__`` is a Dunder function that has a default behavior of adding things together. This works intuitively for ``int`` and ``float``. Python has also defined ``__add__`` for ``str`` where ``a + b`` is the concatenation of ``a`` and ``b``.

>>> a = "Hello"
>>> b = "World"
>>> a + b
"HelloWorld"

.. Note::
    ``int``, ``float``, and ``str`` and all other types in Python are made using classes.

Lets say we wanted the ``__add__`` behavior of our ``Person`` class to add the number to ``intelligence``. We would write that like:

.. code:: python
    
    class Person:
        def __init__(self, name, classes, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.intelligence = intelligence
        
        def study(self, time):
            self.intelligence += time * 0.2 # time in hours
        
        def __add__(self, number):  # number is whatever number we are adding to Person
            self.intelligence += number

So now we can do:

>>> student = Student("Cosmo Cougar", ["American Heritage", "Linear Algebra"], 98, 30)
>>> student.intelligence
30
>>> student + 2
>>> student.intelligence
32

.. Note::
    Now that you know about Dunder methods, it is a lot easier to explain how NumPy adds vectors together. They simply implemented the ``__add__`` Dunder method!

.. Don't worry about adding two students together.

One really important Dunder function is ``__str__``. It is used in Python any time the object needs to be represented as a string or any time ``str()`` is called. Right now, it is represented by something like

>>> print(student)
<__main__.Student object at 0x10299c790>

If we write our own ``__str__`` method, we can make this look a lot cleaner.

.. Do they know about f-strings?

.. code:: python

    def __str__(self):
        return f"Person({self.name}, {self.classes}, {self.intelligence})"

So instead of some weird print statement, we get

>>> print(student)
Student("Cosmo Cougar", ["American Heritage", "Linear Algebra"], 30)

Here are some other useful Dunder methods:
- ``__eq__``: used for ``==``
- ``__ne__``: used for ``!=``
- ``__lt__``: used for ``<``
- ``__gt__``: used for ``>``
- ``__ge__``: used for ``>=``
- ``__le__``: used for ``<=``
- ``__str__``: used for ``str()``
- ``__int__``: used for ``int()``
- ``__len__``: used for ``len()``
- ``__add__``: used for ``a + b``
- ``__sub__``: used for ``a - b``
- ``__mul__``: used for ``a * b``

Task 3: Vector
--------------
Write a class called ``Vector`` that implements vector addition and scalar multiplication.

Fill in the code below:

.. code:: python
    class Vector():
        def __init__(self, vector):
            """Takes in a list called vector"""
            self.vector = vector
            self.length = len(vector)
        
        def __add__(self, other_vector):
            """Vector addition
            
            Raises a ValueError if the vectors are different lengths

            Parameters:
            self : Vector
                The current object 
            other_vector : Vector
                The vector we are adding

            Returns:
            ret : Vector
                The result of self + other_vector
            """
            # replace pass with your code
            pass
        
        def __mul__(self, scalar):
            """Scalar multiplication
            
            Parameters:
            self : Vector
                The current object 
            scalar : int, float
                The scalar we multiply by

            Returns:
            ret : Vector
                The result of self * scalar
            """
            # replace pass with your code
            pass
        
        def __str__(self):
            return f"Vector({self.vector})"

.. Importing modules
.. -----------------
.. Another important way to reduce code duplication is to use python modules. A module is simply a collection of code in a file. So far for this class, we have been using Google Colab. Colab is nice because it is easy to learn how to use, but most programmers don't use Colab. It is much more common in Python programming to use an IDE (Integrated Development Environment, basically an app with lots of features for programming) like Visual Studio Code or Pycharm. In this demonstration, we will be using the terminal (also called the command prompt, shell, or console) to write a program.

.. Step 1: Open the Terminal
.. ~~~~~~~~~~~~~~~~~~~~~~~~~
.. Look for the "Windows Terminal" on windows, or "Terminal" on mac and open it. You should see something like:

.. .. image

.. Notice how you can see your username on the left side of the terminal. Right next to that will be a symbol (``%``, ``$`` ``>``), and after that will be a flashing cursor. This is where we can type commands. 

.. give an example

.. Task 2: Extra Credit? Do something on your filesystem
.. -----------------------------------------------------

Application: Binary
-------------------
Binary is how computers represent numbers. We are used to decimal (dec meaning ten) where there are ten symbols we use: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9. In binary, there are only two symbols we use: 0 and 1.

To represent 2319 in decimal, we have :math:`2*10^3 + 3*10^2 + 1*10^1 + 9*10^0`. To represent 2319 in binary, we write, :math:`100100001111 = 1*2^11 + 0*2^10 + 0*2^9 + 1*2^8 + 0*2^7 + 0*2^6 + 0*2^5 + 0*2^4 + 1*2^3 + 1*2^2 + 1*2^1 + 1*2^0`.

The algorithm to convert from a decimal number :math:`n` to binary goes like this:
#. Take the remainder of :math:`n/2`. This is the lowest digit of the binary number.
#. Take the quotient and set it to n.
#. Repeat this process until there are no digits left.

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

Now we write the remainders starting at the last and we get :math:`100100001111` which is what we had above.

Task 4: Binary Class
--------------------
Write a class called ``Binary`` that takes in an integer.
- When a ``Binary`` object is printed as a string, it should return the binary representation in 1's and 0's as a string.
- When a ``Binary`` object is used as an integer, it should return the decimal representation as an integer.
- ``Binary`` objects can be subtracted with one another to produce another ``Binary`` object. It should raise a ``ValueError`` if the result would be negative.
 ..   - You can do this by implementing the ``__ge__`` Dunder function which uses the ">=" operator, or you can compare the decimal representations of the binary numbers.
- ``Binary`` objects can be added with one another to produce another ``Binary`` object.
- ``Binary`` objects can be compared with one another for equality (the == operator)

.. Hint::
    It may be easiest to do all the math with the decimal representation of the number, and then just convert it to the binary representation when it needs to be printed out as a string.
