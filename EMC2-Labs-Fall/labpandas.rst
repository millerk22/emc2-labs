Lab 2.71828: Pandas 
==============================================

.. https://foundations-of-applied-mathematics.github.io/

In this lab, you will learn how to use the powerful `Pandas <https://pandas.pydata.org/>`_ library used for data analysis and manipulation.

Pandas is a useful library for data manipulation.
In 2008 the development of this package began at `AQR Capital Management <https://pandas.pydata.org/about/>`_. 
It was originally developed to perform quantitative analysis on financial data.
In fact, Pandas stands for 'panel data', an economic term.
Over the years the library has been open-sourced and developed into the library that it is today.

The purpose of this lab is to familiarize you with the Pandas library.
This is a widely used tool across industry and having experience with it can set you apart when getting internships and jobs.
While it is not necessary to memorize perfectly this library, a general understanding will be helpful for your future in coding and math.

DataFrames
----------

.. Dataframe, read_csv, to_csv (explain keyword argument)

To import Pandas we use the following import statement

>>> import pandas as pd

The core data structure of the Pandas library is the ``DataFrame``.
A DataFrame is a table with indexed rows and named columns, like an Excel spreadsheet.
The rows are labeled with integers starting at 0, and the columns are chosen by the user.
First we will examine a ``DataFrame`` and then we will learn a few ways to create them:

>>> df
     Name   Age        City
0  Norman    25    New York
1   Kevin    30 Los Angeles
2     Eli    35     Chicago

In the ``DataFrame`` above, ``"Name", "Age", "City"`` are all columns of the DataFrame.
The numbers on the left are the index.
The index always starts at 0. 
There are plenty of ways that you can construct these DataFrames.

One way you can do it is through a dictionary of lists. 
Here the keys of the dictionary represent the columns of the ``DataFrame`` and the values represent the data. 

>>> data = {'Name': ['Norman', 'Kevin', 'Eli'], 
            'Age': [25, 30, 35], 
            'City': ['New York', 'Los Angeles', 'Chicago']}
>>> df1 = pd.DataFrame(data)

You can do it from a list of dictionaries.
In this type each dictionary represents a row of the ``DataFrame``\.
The different keys in each dictionary represent a row, while the value is the actual data

>>> data = [{'Name': 'Norman', 'Age': 25, 'City': 'New York'},
            {'Name': 'Kevin', 'Age': 30, 'City': 'Los Angeles'},
            {'Name': 'Eli', 'Age': 35, 'City': 'Chicago'}]
>>> df2 = pd.DataFrame(data)

Next, you can do it from a list of lists using column names.
In this way, every list is a row, however you have to manually set the columns yourself when you initialize the ``DataFrame``\.

>>> data = [['Norman', 25, 'New York'],
            ['Kevin', 30, 'Los Angeles'],
            ['Eli', 35, 'Chicago']]
>>> df3 = pd.DataFrame(data, columns=['Name', 'Age', 'City'])

Finally, you can do it through a numpy array.
This one functions the same as a list of lists where every row is a row in the ``DataFrame`` and you must manually set the columns. 

>>> import numpy as np
>>> arr = np.array([['Norman', 25, 'New York'],
                    ['Kevin', 30, 'Los Angeles'],
                    ['Eli', 35, 'Chicago']])
>>> df4 = pd.DataFrame(arr, columns=['Name', 'Age', 'City'])

.. note::

     While each of the ``DataFrame``\s are constructed in different ways, they will all produce the exact same result.
     This means that you can take liberties when chosing how to set up your own ``DataFrame``\s.

Task 1
------

Make a Pandas ``DataFrame`` named ``basketball_games`` with columns ``["Team Name", "Game 1 Score", "Game 2 Score", "Game 3 Score"]``. 
For the ``"Team Name"`` column, use this list of names ``["Florida", "Houston", "Duke", "Texas Tech", "BYU"]``. 
For each of the scores generate a random integer between 1 and 100. 


CSV Files
---------

.. What are csv files, and how to read and write to them


A CSV file (Comma-Separated Values) is a text file that stores tabular data. 
It works like a spreadsheet where each line is a row, and every value is separated by a comma.
For example, we could have the file ``animals.csv`` ::

     Animal,Weight,Type
     Elephant,12000,Mammal
     Eagle,15,Bird
     Crocodile,1000,Reptile
     Kangaroo,150,Mammal
     Penguin,30,Bird

To load this file into a pandas DataFrame we can use ``pd.read_csv()``\.


>>> import pandas as pd
>>> df = pd.read_csv("animals.csv")
>>> print(df)
     Animal  Weight     Type
0  Elephant   12000   Mammal
1     Eagle      15     Bird
2 Crocodile    1000  Reptile
3  Kangaroo     150   Mammal
4  Penguin       30     Bird

If you want to save to a CSV file use ``df.to_csv(filename, index=False)``\. 
We use ``index=False`` to avoid saving the row numbers as another column. 
Other file types that Pandas can easily read include Excel, JSON, HTML, Parquet, SQL, and Pickle. 

Task 2
------

.. Have them read the csv file

Read the CSV file named "global_air_pollution_dataset.csv" and save it as a Pandas ``DataFrame`` titled ``pollution_df``. 
.. Add a hint not to save the row numbers

Accessing Data
--------------
.. Data Manipulation (accessing data loc, iloc, access column (["col_name"], .col_name))
.. df.head(), sort_values(), unique(), drop,
.. Problem 1: budget.csv problem (not all of the parts)
.. Basic Data Manipulation + Basic Stat Functions + Masks(?)

Now that we have our DataFrame we can move on to accessing the data within.
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
For both of these methods, the first and second arguments refer to the rows and columns, respectively, just as in array slicing.


.. code-block:: python

     # Use loc to select the Grade column for Sarah and Emily
     >>> df.loc[[0, 2], "Grade"]
     0    87
     2    93
     Name: Grade, dtype: int64

     # Use iloc to also select the Grade column for Sarah and Emily
     >>> df.iloc[[0, 2], 3]
     0    87
     2    93
     Name: Grade, dtype: int64

The most efficient way to access a column is to use the ``[]`` brackets and the name of the column.

.. code-block:: python

     # Create a new column titled Test Score and give everyone a random score
     >>> df["Test Score"] = np.random.randint(0, 100, 5)
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
The methods ``head()`` and ``tail()`` will show the first or last n data points, respectively, where n defaults to 5. 
The method ``sample()`` will draw n random entries of the dataset, where n defaults to 1.


.. code-block:: python

     # Use head to see the first n rows
     >>> df.head(n=2)
         Name     Sex  Age  Grade  Attendance (%)  Test Score
     0  Sarah  Female   19     87              97         100
     1    Jed    Male   20     85              92         100

     # Use sample to return a random row
     >>> df.sample()
          Name   Sex  Age  Grade  Attendance (%)  Test Score
     3  Carter  Male   22     91              95         100

You may also want to reorder the columns or sort rows based on values.

.. code-block:: python

     # Reorder Columns
     >>> df.reindex(columns=["Name", "Attendance (%)", "Age", "Test Score"])
          Name  Attendance (%)  Age  Test Score 
     0   Sarah              97   19         100
     1     Jed              92   20         100
     2   Emily              99   21         100
     3  Carter              95   22         100
     4   James              88   23         100

     # Sort descending according to Attendance (%)
     >>> df.sort_values("Attendance (%)", ascending=False)
          Name     Sex  Age  Grade  Attendance (%)  Test Score
     2   Emily  Female   21     93              99         100
     0   Sarah  Female   19     87              97         100
     3  Carter    Male   22     91              95         100
     1     Jed    Male   20     85              92         100
     4   James    Male   23     78              88         100

Now we will go over the ``unique()`` and ``drop()`` methods.
``unique()`` allows us to find all the unique entries in a column, and their data type.
``drop()`` makes it possible to easily remove rows.

.. code-block:: python

     # Use unique() to get an array with the unique values and their data type
     >>> df["Sex"].unique()
     array(['Female', 'Male'], dtype=object)

     # Use drop() to get rid of a row
     >>> df.drop("Jed", inplace=True)
     >>> df
               Sex  Age  Grade  Attendance (%)  Test Score
     Name                                                
     Sarah  Female   19     87              97         100
     Emily  Female   21     93              99         100
     Carter   Male   22     91              95         100
     James    Male   23     78              88         100


Here is a list of other methods that are useful to be familiar with.

- ``df.shape`` - Get the (rows, columns) of the DataFrame.
- ``df.rename(columns={'old': 'new'})`` - Rename columns.
- ``df.fillna(value)`` - Replace NaNs with a specified value.
- ``df.dropna()`` - Remove rows with missing values.
- ``df.astype({'col': type})`` - Convert column data types.

.. note::

     NaN stands for "Not a Number". 
     It represents missing or undefined values in pandas DataFrames.
     When working with real-world data it is not often to have missing values.
     It is good to know functions that can work with this type of data.




Task 3
------

Load ``pollution_df``\.
First, reindex the columns so that ``AQI Value`` and ``AQI Category`` are the first two columns and all other columns maintain their order.
Next, sort the ``DataFrame`` in descending order based on their ``AQI Value``\.
Finally, reset all values in the ``Ozone AQI Value`` column to 0.

.. Have them do tasks 2-4 of the budget activity
.. Maybe Add task about dropping Nans


Basic Data Manipulation
-----------------------

Because the primary pandas data structures are based off of ``np.ndarray``\s, most NumPy functions work
with pandas structures. For example, basic vector operations work as would be expected:

.. code-block:: python

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

Masking
-------

*Masking* in Pandas refers to selecting or updating values based on conditions, usually using boolean indexing. 
For a quick recap, a mask is an array of truth values.
This can be useful if you want to find and edit rows given a certain condition. 

.. code-block:: python
     
     # Select students with Grade > 90
     >>> mask = df["Grade"] > 90
     >>> print(mask)
     0 False
     1 False
     2  True
     3  True
     4 False

     # We can use the mask in the dataframe, df[mask], to see students with a grade > 90
     >>> df[mask] # same as df[df["Grade"] > 90]
          Name     Sex  Age  Grade  Attendance (%)  Test Score
     2   Emily  Female   21     93              99         100
     3  Carter    Male   22     91              95         100

A mask can also be used with ``loc`` as well to modify data given certain conditions. 
You have to make sure that you pass in the arguments correctly as ``df.loc[mask, column_to_edit]``\.

.. code-block:: python

     # Set Test Score to 105 for students with Attendance > 95
     >>> df.loc[df["Attendance (%)"] > 95, "Test Score"] = 105
     >>> df
          Name     Sex  Age  Grade  Attendance (%)  Test Score
     0   Sarah  Female   19     87              97         105
     1     Jed    Male   20     85              92         100
     2   Emily  Female   21     93              99         105
     3  Carter    Male   22     91              95         100
     4   James    Male   23     78              88         100

Finally, there are a few slight differences with Pandas boolean masking syntax. 
For logical "and" they use ``&`` and for logical "or" they use ``|``. 
It is also to not that "not" is ``~``\, but "not equal" is still ``!=``\.
For these arguments make sure to surround the mask in ``()``\.

.. code-block:: python

     # Access rows where 'Sex' is 'Female' and 'Test Score' is 105
     >>> df[(df['Sex'] == 'Female') & (df['Test Score'] == 105)]
         Name     Sex  Age  Grade  Attendance (%)  Test Score
     0  Sarah  Female   19     87              97         105
     2  Emily  Female   21     93              99         105

     # Access rows where 'Sex' is 'Male' or their 'Grade' is not 87
     >>> df[(df['Sex'] == 'Male') | ~(df['Grade'] == 87)]
          Name    Sex  Age  Grade  Attendance (%)  Test Score
     1     Jed   Male   20     85              92         100
     2   Emily Female   21     93              99         105
     3  Carter   Male   22     91              95         100
     4   James   Male   23     78              88         100



Task 4
------

Load ``pollution_df``\.
Create a new column ``Combined AQI Value`` which is the sum of the ``AQI Value``\, ``CO AQI Value``\, ``Ozone AQI Value``\, ``NO2 AQI Value``\, and ``PM2.5 AQI Value`` columns.
Change the ``AQI Category`` to "terrible" where ``AQI Value`` and ``PM2.5 AQI Value`` are both greater than 100.


Basic Statistical Functions
---------------------------

The Pandas library allows us to easily calculate basic summary statistics of our data, which can be
useful when we want a quick description of the data. The ``describe()`` function outputs several
such summary statistics for each column in a DataFrame:

.. code-block:: python

     >>> df
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

Use ``rank()`` to rank the values in a data set, either within each entry or within each column. 
It assigns each element a numeric rank based on the passed in arguments. 
This function defaults ranking in ascending order: the least will be ranked 1 and the
greatest will be ranked the highest number.

.. code-block:: python

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

Here are some other useful statistical functions.

- ``std()`` - The standard deviation of the elements  
- ``nunique()`` - Number of distinct elements  
- ``pct_change()`` - Percentage change between elements  
- ``skew()`` - Sample skewness of each column  

Task 5
------

.. Have Them do problem 2

Using the ``pollution_df``\, find the country with the highest average for ``AQI Category`` and print that country.




