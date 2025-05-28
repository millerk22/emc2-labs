
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
       ['Kevin', 30, 'Los Angeles'],
       ['Charles', 35, 'Chicago']
     ]
>>> df = pd.DataFrame(data, columns=['Name', 'Age', 'City'])
>>> df
     Name   Age        City
0   Alice   25     New York
1   Kevin   30  Los Angeles
2 Charles   35      Chicago

Now there a plenty of ways that you can contruct these DataFrames.

You can do it through a dictionary of lists.

>>> data = {'Name': ['Norman', 'Eli'], 'Grade': [64, 92]}
>>> df1 = pd.DataFrame(data)

You can do it from a list of dictionaries.

>>> data = [{'Name': 'Norman', 'Grade': 64}, {'Name': 'Eli', 'Grade': 92}]
>>> df2 = pd.DataFrame(data)

You can do it from a list of lists using column names.

>>> data = [['Norman', 64], ['Eli', 92]]
>>> df3 = pd.DataFrame(data, columns=['Name', 'Grade'])

You can even do it through a numpy array.

>>> import numpy as np
>>> arr = np.array([['Norman', 64], ['Eli', 92]])
>>> df4 = pd.DataFrame(arr, columns=['Name', 'Grade'])

Everyone of these DataFrames will be exactly the same. producing the result below 

>>> df1
     Name  Grade
0  Norman     64
1     Eli     92

Task 1
------

.. Add a task where they make a table of some sort


CSV Files
---------

.. What are csv files, and how to read and write to them


A CSV File (Comma-Seperated Values) is a text file that stores tabular data. 
It works like a speadsheet where each line is a row, and every value is seperated by a comma.
For example we could have the file ``animals.csv``.

.. code-block:: csv

     Animal,Weight,Type
     Elephant,12000,Mammal
     Eagle,15,Bird
     Crocodile,1000,Reptile
     Kangaroo,150,Mammal
     Penguin,30,Bird

To load this file into a pandas DataFrame we can use ``read_csv()``\.

.. code-block:: python

     import pandas as pd

     df = pd.read_csv("animals.csv")

     print(df)

          Animal  Weight     Type
     0  Elephant   12000   Mammal
     1     Eagle      15     Bird
     2 Crocodile    1000  Reptile
     3  Kangaroo     150   Mammal
     4  Penguin       30     Bird

If you want to save to a csv file use ``df.to_csv(filename, index=False)``\. 
We use ``index=False`` to avoid saving the row numbers as another column. 
Other file types that Pandas can easily read include; Excel, JSON, HTML, Parquet, SQL, and Pickle. 

Task 2
------

.. Have them read in the csv file

Accessing Data
--------------
.. Data Manipulation (accessing data loc, iloc, access column (["col_name"], .col_name))
.. df.head(), sort_values(), unique(), drop,
.. Problem 1: budget.csv problem (not all of the parts)
.. Basic Data Manipulation + Basic Stat Functions + Masks(?)

So now that we have our DataFrame we can move onto accessing the data within.
We will go through these functions using the DataFrame defined below.

>>> df
     Name     Sex  Age  Grade  Attendance (%)
0   Sarah  Female   19     87              97
1     Jed    Male   20     85              92
2   Emily  Female   21     93              99
3  Carter    Male   22     91              95
4   James    Male   23     78              88

In general the best way to access data is through ``loc`` and ``iloc``\. 
The ``loc`` index selects rows and columns based on their labels, while ``iloc`` selects them based on their integer position.
With these indexers, the first and second arguments refer to the rows and columns, respectively, just as array slicing.


.. code-block:: python

     # Use loc to select the Grade of Sarah and Emily
     >>> df.loc[[0, 2], "Grade"]
     0    87
     2    93
     Name: Grade, dtype: int64

     # Use iloc to select the Grade of Sarah and Emily
     >>> df.iloc[[0, 2], 3]
     0    87
     2    93
     Name: Grade, dtype: int64

The most efficient way to access a column is use the ``[]`` brackets and the name of the column.

.. code-block:: python

     # Create a new column title Test Score and give everyone a random score
     >>> df["Test Score"] = np.random.randint(0, 100, 6)
     >>> df["Test Score"]
     Name
     Sarah     5
     Jed       99
     Emily     25
     Carter    46
     James     73
     Name: Age, dtype: int64

     # Reset the column so everyone has 100
     >>> df["Test Score"] = 100
     >>> df
          Name     Sex  Age  Grade  Attendance (%)  Test Score
     0   Sarah  Female   19     87              97         100
     1     Jed    Male   20     85              92         100
     2   Emily  Female   21     93              99         100
     3  Carter    Male   22     91              95         100
     4   James    Male   23     78              88         100


Datasets can often be very large and thus difficult to visualize. 
Pandas has various methods to make this easier. 
The methods head and tail will show the first or last n data points, respectively, where n defaults to 5. 
The method sample will draw n random entries of the dataset, where n defaults to 1.


.. code-block:: python

     # Use head to see the first n rows
     >>> df.head(n=2)
               Sex  Age  Grade  Attendance (%)  Test Scores
     Name                                                
     Sarah  Female   19     87              97        100.0
     Jed      Male   20     85              92        100.0

     # Use sample to return a random row

     >>> df.sample()
               Sex  Age  Grade  Attendance (%)  Test Scores
     Name                                                
     Carter   Male   22     91              95        100.0

It can also be useful to re-order the columns or rows or sort according to a column


.. code-block:: python

     # Re-order Columns
     >>> df.reindex(columns=["Attendance (%)", "Age", "Test Scores"])
               Attendance (%)  Age  Test Scores
     Name                                        
     Sarah                   97   19        100.0
     Jed                     92   20        100.0
     Emily                   99   21        100.0
     Carter                  95   22        100.0
     James                   88   23        100.0

     # Sort descending according to Attendance (%)
     >>> df.sort_values("Attendance (%)", ascending=False)
                    Sex  Age  Grade  Attendance (%)  Test Scores
     Name                                                    
     Emily      Female   21     93              99        100.0
     Sarah      Female   19     87              97        100.0
     Carter       Male   22     91              95        100.0
     Jed          Male   20     85              92        100.0
     James        Male   23     78              88        100.0

Here is an example of using the very useful ``unique`` and ``drop`` method.

.. code-block:: python

     # Use unique() to get an array with the unique values and their data type
     >>> df["Sex"].unique()
     array(['Female', 'Male'], dtype=object)

     # Use drop() to get rid of row
     >>> df.drop("Jed", inplace=True)
     >>> df
               Sex  Age  Grade  Attendance (%)  Test Scores
     Name                                                
     Sarah  Female   19     87              97        100.0
     Emily  Female   21     93              99        100.0
     Carter   Male   22     91              95        100.0
     James    Male   23     78              88        100.0


There are many other methods that you can use, here is a list of other methods to be familar with.

- ``df.shape`` - Get the (rows, columns) of the DataFrame.
- ``df.rename(columns={'old': 'new'})`` - Rename columns.
- ``df.fillna(value)`` - Replace NaNs with a specified value.
- ``df.dropna()`` - Remove rows with missing values.
- ``df.astype({'col': type})`` - Convert column data types.

.. note::

     NaN stands for "Not a Number". 
     It represents missing or undefined values in pandas DataFrames.
     When working with real world data it is not often to have missing values.
     It is good to know functions that can work with this type of data.




Task 3
------

.. Have them do tasks 2-4 of the budget activity
.. Maybe Add task about dropping Nans


Basic Data Manipulation
-----------------------

Because the primary pandas data structures are based off of ndarray, most NumPy functions work
with pandas structures. For example, basic vector operations work as would be expected:

.. code-block::python

     # Sum Grade and Attendance (%) of all students
     >>> df["Grade"] + df["Attendance (%)"]
     Name
     Sarah     140.5
     Jed       134.5
     Emily     145.5
     Carter    140.5
     James     127.0
     dtype: float64

     # Halve all Grade values
     >>> df["Grade"] / 2
     Name
     Sarah     21.75
     Jed       21.25
     Emily     23.25
     Carter    22.75
     James     19.50
     Name: Grade, dtype: float64

Here is a variety of other operations that work well on DataFrames.

- ``abs()`` - Object with absolute values taken (of numerical data)
- ``idxmax()`` - The index label of the maximum value
- ``idxmin()`` - The index label of the minimum value
- ``count()`` - The number of non-null entries
- ``cumprod()`` - The cumulative product over an axis
- ``cumsum()`` - The cumulative sum over an axis
- ``max()`` - The maximum of the entries
- ``mean()`` - The average of the entries
- ``median()`` - The median of the entries
- ``min()`` - The minimum of the entries
- ``mode()`` - The most common element(s)
- ``prod()`` - The product of the elements
- ``sum()`` - The sum of the elements
- ``var()`` - The variance of the elements

Basic Statistical Functions
---------------------------

The pandas library allows us to easily calculate basic summary statistics of our data, which can be
useful when we want a quick description of the data. The ``describe()`` function outputs several
such summary statistics for each column in a DataFrame:

.. code-block::python

     >>>df
            Math 290  Math 213  Math 495R
     Ben          84        87         84
     Kate         87        94         97
     Trent        75        98         60
     Bryce        67        75         94
     Megan        89        67         66


     >>> df.describe()
             Math 290    Math 213   Math 495R
     count   5.000000    5.000000    5.000000
     mean   80.400000   84.200000   80.200000
     std     9.600520   13.014604   15.711697
     min    67.000000   67.000000   60.000000
     25%    75.000000   75.000000   66.000000
     50%    84.000000   87.000000   84.000000
     75%    87.000000   94.000000   94.000000
     max    89.000000   98.000000   97.000000

Functions for other basic statics are also include

.. code-block::python

     # Find the average grade per student 
     >>> df.mean(axis=1)
     Ben      85.000000
     Kate     92.666667
     Trent    77.666667
     Bryce    78.666667
     Megan    74.000000
     dtype: float64

The method ``rank()`` can be used to rank the values in a data set, either within each entry or with
each column. This function defaults ranking in ascending order: the least will be ranked 1 and the
greatest will be ranked the highest number.

.. code-block::python
     # Rank each student's performance in their classes in descending order
     # (best to worst)
     # The method keyword specifies what rank to use when ties occur.
     >>> df.rank(axis=1, method="max", ascending=False)
               Math 290  Math 213  Math 495R
     Ben           2.0       1.0       2.0
     Kate          3.0       2.0       1.0
     Trent         2.0       1.0       3.0
     Bryce         3.0       2.0       1.0
     Megan         1.0       3.0       2.0

Here are some other useful statiscal functions.

- ``std()`` - The standard deviation of the elements  
- ``nunique()`` - Number of distinct elements  
- ``pct_change()`` - Percentage change between elements  
- ``skew()`` - Sample skewness of each column  

Task $
------

.. Have Them do problem 2

Purpose 
-------

.. Purpose: a basic intro to pandas so that simple coding interview thing isn't crazy (edited) 


