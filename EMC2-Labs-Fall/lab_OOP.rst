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

The ``__init__`` function is called a **constructor** and it is called every time we create a new object of the class. The constructor is used to initialize the **attributes** of the object. In this case, we have two attributes: ``kind`` and ``color``.

We can create a new object of type ``WritingUtensil`` like this (using the constructor): 

.. code:: python

    pencil = WritingUtensil("pencil", "yellow")
    pen = WritingUtensil("pen", "blue")

We can access attributes using dot notation:

>>> pencil.kind
'pencil'
>>> pen.color
'blue'

You may have noitced that ``self`` appears a lot in our class. Whenever we use ``self`` it refers to the current object. So ``self.kind`` sets our instance of class ``WritingUtensil`` to something like ``"pen"``.

Consider another example:

.. code:: python

    class Student:
        def __init__(self, name, classes, grade, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.grade = grade
            self.intelligence = intelligence

We have **instance attributes** of ``name``, ``classes``, ``gpa``, and ``intelligence``. These attributes only apply to the specific instance of our object, but in some cases it is appropriate to have what is called a **class attribute**. Class attributes apply to the entire class. If every student can turn in 3 late assignments, we could say

.. code:: python

    class Student:
        late_assignments_left = 3

        def __init__(self, name, classes, grade, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.grade = grade
            self.intelligence = intelligence

Every student object will have access to ``late_assignments``, but it can still be different for each of them.

>>> cosmo = Student("Cosmo", ["American Heritage", "Linear Algebra", "Math 290"], 98)
>>> cougar = Student("Cougar", ["Linear Algebra"], 97)
>>> cosmo.late_assignments_left = 2
>>> cougar.late_assignments_left
3
>>> cosmo.late_assignments_left
2

If we could only rely on class attributes and instance attributes, working with classes would be very difficult. Fortunately, **methods** are essentially functions that act on classes.

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
        
.. Note::
    Whenever you create a method in a class, it needs to have ``self`` as the first argument, otherwise your method won't have access to class or instance attributes, or other methods.

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

Notice how the attributes ``name``, ``classes``, and ``intelligence`` and the method ``study`` are shared between ``Student`` and ``Professor``. We can create a class called ``Person`` that contains these attributes.

.. code:: python
    
    class Person:
        def __init__(self, name, classes, intelligence):
            self.name = name
            self.classes = classes  # a list
            self.intelligence = intelligence
        
        def study(self, time):
            self.intelligence += time * 0.2 # time in hours

Then we can change the ``Student`` and ``Professor`` classes to look like this:

.. code:: python

    class Student(Person):  # this is saying Student inherits from Person

        late_assignments_left = 3

        def __init__(self, name, classes, grade, intelligence):
            super().__init__(name, classes, intelligence)
            self.grade = grade

        def improve_grade(self, percentage):
            self.grade += percentage
            return self.grade # the new grade
        
        def study(self, time):
            self.intelligence += time * 0.2 # time in hours

The line ``super().__init__(name, classes, intelligence)`` takes the parameters from ``__init__`` and passes them to the superclass constructor. The superclass for ``Student`` is ``Person`` because that is where it inherits from.

.. Note::
    We don't need our ``study`` method in ``Student`` because it is contained in ``Person``. We can still call it the same way.

Being able to make classes is great, but what if we want a class like <class1> and <class2> both are very similar so there will be lots of duplicate code. Python fixes this with inheritance.

Inheritance example


Importing modules
-----------------
Reuse code

give an example

Dunder functions
----------------

Used by python

A lot in this, but __str__ is probably the most common. 

Application: 
--------------------------

