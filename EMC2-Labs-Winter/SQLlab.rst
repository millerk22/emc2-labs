
Lab 0: An Introduction to SQL
===============================

SQL is a programming language often used to work with data, 
particularly data structured as a table. 
It can be used to find all rows in a table that satisfy a condition, or "query" the table.
It's also used to manipulate a table, by inserting, modifying, or deleting rows.

Because SQL is used extensively in industry, it's useful to have been exposed to it if you're looking
for an internship working with data.

SQL acts differently to Python or other languages you may have learned before.
In Python, you tell the computer each step to take to get the result you want.
In SQL, you tell the computer the result you want and it takes the steps itself.

Suppose we have a list of items, each of which has some weight (measured in pounds). Now suppose we 
want to find all of the items that weigh more than 10 pounds.

In Python, you tend to work with one item at a time. So we might use a for loop over all the items
to check whether the weight is more than 10. We start with a list containing our items.

>>> items = [item1, item2, item3]
>>> item1.weight = 15
>>> item2.weight = 5
>>> item3.weight = 20

.. code-block:: python

   heavy_items = []
   for item in items:
      if item.weight > 10:
      heavy_items.append(item)

>>> heavy_items
[item1, item3]

SQL, however, is optimized for sets. So we would solve the problem by asking SQL to
give us the subset where the weight is more than 10. Instead of a list, SQL stores data in a table.

.. csv-table:: items
   :header: "Name", "Weight"

   "item1","15"
   "item2","5"
   "item3","20"

.. code-block:: tsql

   SELECT * FROM items WHERE Weight > 10

.. csv-table::
   :header: "Name", "Weight"

   "item1","15"
   "item3","20"

In this lab, we will give you a brief introduction to SQL.
Visit

`<https://sqlbolt.com/lesson/introduction>`_

Start by reading the instructions in the Introduction.

Task 1
------

Complete every exercise from each of the following lessons:

1. Lesson 1: SELECT queries 101
2. Lesson 2: Queries with constraints (Pt. 1)
3. Lesson 3: Queries with constraints (Pt. 2)
4. Lesson 4: Filtering and sorting Query results
5. Review: Simple SELECT Queries
6. Lesson 6: Multi-table queries with JOINs