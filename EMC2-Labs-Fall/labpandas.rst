
Lab 2.71828: Pandas 
==============================================
.. https://foundations-of-applied-mathematics.github.io/
In this lab, you will learn how to use the very powerful Pandas library used for data analyzing and manupulation.

Pandas is an amazing library for data manupulation.
In 2008 the devolpment of this package began at `AQR Capital Management <https://pandas.pydata.org/about/>`_. 
It was originally devolped to perform quantitive analysis on financial data.
In fact, Pandas stands for Panel data, and economic term.
Then over the years the library was open sourced, and has been devolped into the library that it is today.

Dataframes
----------

.. Dataframe, read_csv, to_csv (explain keyword argument)

To import Pandas we use the following import statement

>>> import pandas as pd

The core data structure of the Pandas library is the DataFrame.
A DataFrame is a table with indexed rows and named columns, like an Excel spreadsheets.
Here is an example. 

>>> data = [
       ['Alice', 25, 'New York'],
       ['Bob', 30, 'Los Angeles'],
       ['Charles', 35, 'Chicago']
   ]
>>> df = pd.DataFrame(data, columns=['Name', 'Age', 'City'])
>>> print(df)
     Name   Age        City
0   Alice   25     New York
1     Bob   30  Los Angeles
2 Charles   35      Chicago

Now there a plenty of ways that you can contruct these DataFrames.


Data Manipulation
-----------------

.. Data Manipulation (accessing data loc, iloc, access column (["col_name"], .col_name))
.. df.head(), sort_values(), unique(), drop,
.. Problem 1: budget.csv problem (not all of the parts)
.. Basic Data Manipulation + Basic Stat Functions + Masks(?)

CSV Files
---------

.. What are csv files, and how to read and write to them

Purpose 
-------

.. Purpose: a basic intro to pandas so that simple coding interview thing isn't crazy (edited) 


