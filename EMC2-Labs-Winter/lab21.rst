Lab 21: K-Nearest Neighbors Classifier
======================================

In this lab you will learn how to split data into train and test sets and use the K-Nearest Neighbors (KNN) classifier to classify images of handwritten digits.

KNN Classifier
--------------

In Lab 18 we talked about the K-Means clustering algorithm which was a type of unsupervised learning.
This lab will focus on a form of **supervised learning** where the input data has a known label.
This is the equivalent of us learning how to read. 
We see hundreds and thousands of different letters when we are young, and we slowly learn how to identify them correctly.


The K-Nearest Neighbors classifier is a type of supervised learning and it is very easy to understand.
First we feed it in a set of data with known labels.
Then it receives a new data point, it looks at the k nearest neighbors to the data point and then votes on the label of the data point.
"Nearest" can be any defined distance that you choose.
We will be using the Euclidean distance for this lab.

.. math::

    d(\mathbf{x}, \mathbf{y}) = \sqrt{\sum_{i=1}^n (x_i - y_i)^2}

Scikit-learn makes it really easy to use the KNN classifier. All you need to do is import the model.

.. code:: python

    >>> from sklearn.neighbors import KNeighborsClassifier
    >>> model = KNeighborsClassifier(n_neighbors=3) # n_neighbors is the number of neighbors to consider

Then you can fit the model to the training data.

.. code:: python

    >>> model.fit(X, y) # X is the features and y is the labels

Once you have fitted the model, you can use it to predict the labels of any set of data.
For that you will use the ``predict(data)`` method which returns an array of the predicted labels.

.. code:: python

    >>> y_pred = model.predict(X_test)

The MNIST Dataset
-----------------

The MNIST dataset is a collection of 70,000 images of handwritten digits.
Each image is 28x28 pixels and is grayscale.
Each image is a single digit from 0 to 9.
Here is an example of all 10 digits.

.. image:: _static/figures/mnist_10.png
    :align: center
    :width: 80%

What makes this data set interesting is that there is a lot of variation in the handwriting.
As you can see below, here are 5 different examples of the digit "5".
This will make it interesting for our classifier to correctly identify the digit.

.. image:: _static/figures/mnist_5.png
    :align: center

Normally you will be able to load the data using ``sklearn.datasets.fetch_openml`` or ``tensorflow.keras.datasets.mnist``.
However, because of Codebuddy's lack of internet access, we will be using a subset of the data that had been loaded into a csv file.
5000 samples of the data to be exact. 
You will be given the data in a pandas dataframe with columns ``data`` and ``label``.
The ``data`` column is 28x28 pixels of the image given as a ``numpy.ndarray``.
The ``label`` column is the digit that the image represents.

.. code:: python

    >>> import pandas as pd
    >>> y = data['label']
    >>> X = data['data']

Task 1
------

Create a figure with 3 subplots, and plot the images of the dataset at indexes 13, 3145, and 4321. 
For each image, use ``plt.imshow(image, cmap='gray')`` to plot the image.
Use ``plt.title(f"Digit: {label}")`` to display the label of the image.
Set the title of the figure to ``"MNIST Digits"``.
Use ``plt.axis('off')`` to remove the axes.
Use ``plt.tight_layout()`` to adjust the spacing between the subplots.

Image Flattening and Reshaping
------------------------------

You might notice that the MNIST data is a 2D array of 28x28 pixels, and that we can't take the difference between two 2D arrays.
This is because machine learning algorithms typically expect data in a flat, tabular format rather than as 2D images.
We basically compare the slices of the image to each other.
The ``numpy.reshape()`` function allows us to change the shape of an array without changing its data.

.. code:: python

    >>> import numpy as np
    >>> arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])  # shape is (2, 4)
    >>> arr
    [[1 2 3 4]
     [5 6 7 8]]
    >>> reshaped = np.reshape(arr, (4, 2))  # change to shape (4, 2)
    >>> reshaped
    [[1 2]
     [3 4]
     [5 6]
     [7 8]]
    >>> original = np.reshape(reshaped, (2, 4))  # change back to original shape
    >>> original
    [[1 2 3 4]
     [5 6 7 8]]

Task 2
------

Create a function ``flatten_data(X)`` which takes in a pandas dataframe with a column ``data`` and returns a numpy array of the flattened data.


Train vs Test 
-------------

With supervised learning, we will always have a dataset with known labels. 
When we train a model, we want to know how well it performs. 
If we were to train the model on all the data, and then test it on the same data, we would not know how well it performs because it was trained on that data.
It's like testing students on the practice test that we gave them all the answers for. 
This is why we split our data into train and test sets.
We train the model on the train set, and then test it on the test set.
We can then use the test set to evaluate the performance of the model.

We will be using scikit-learn's functions for splitting the data and verifying accuracy of the model.
Let's pretend that we want to train a fictitious model to predict whether a number is even. First we want to split the data into train and test sets.

.. code:: python

    >>> from sklearn.model_selection import train_test_split
    >>> X = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] # Features
    >>> y = [True, False, True, False, True, False, True, False, True, False, True] # Labels

    # we split the data into train and test sets
    # test_size is the percentage of the data that we want to use for the test set
    >>> X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    >>> X_train
    [1, 2, 3, 4, 5, 6, 7, 8]
    >>> X_test
    [9, 10]
    >>> y_train
    [False, True, False, True, False, True, False, True]
    >>> y_test
    [False, True]

Once we have split the data, we can train the model on the train set and test it on the test set.

.. code:: python

    >>> model = FictitiousModel()
    >>> model.fit(X_train, y_train)
    >>> y_pred = model.predict(X_test)

Then we can verify the accuracy of the model on the test set.
``accuracy_score`` is a function that calculates the accuracy of the model just using simple correct over incorrect. 

.. code:: python

    >>> from sklearn.metrics import accuracy_score
    >>> accuracy = accuracy_score(y_test, y_pred)
    >>> print(f"The accuracy of the model is {accuracy}")
    The accuracy of the model is 0.80

Task 3
------

Using your ``flatten_data`` function, create a new dataframe ``X_flat`` with the flattened data.
Then split the data into train and test sets using ``train_test_split``.
Use 20% of the data for the test set.
Use a random state of 42.
Finally fit a KNN classifier with 3 neighbors to the data, and print the accuracy of the model on the test set.


Ablation Study
--------------

An ablation study is a systematic approach to understanding how different components or parameters of a model affect its performance. 
The term "ablation" comes from the medical field, where it means removing or modifying parts to study their effects.
In machine learning, we systematically change one parameter at a time while keeping everything else constant to isolate its impact.

For KNN, the most important parameter to study is **k** (the number of neighbors), as it fundamentally changes how the algorithm makes decisions.

**Common Effects of the Number of Neighbors (k)**

1. **k = 1 (Single Neighbor)**
   - Makes decisions based on only the closest training example
   - Very sensitive to noise and outliers
   - Can lead to overfitting (memorizing the training data)
   - Creates complex, irregular decision boundaries

2. **k = 3-5 (Small k)**
   - Balances local patterns with some noise reduction
   - Often provides good performance for many datasets
   - Decision boundaries are still relatively complex

3. **k = 7-15 (Medium k)**
   - More robust to noise
   - Smoother decision boundaries
   - May lose some fine-grained local patterns

4. **k > 15 (Large k)**
   - Very smooth decision boundaries
   - Less sensitive to noise but may miss important local patterns
   - Can lead to underfitting (oversimplifying the problem)

Task 4
------

Create a function ``ablate_k(X, y, k_values, test_size, random_state)`` which takes in the unflattened data, the labels, a list of k values, test size, and random state.
Flatten the data, split the data into train and test sets, and fit a KNN classifier for each k value.
For each k value, record the accuracy of the model on the test set.
Finally, return a list of the k values and the accuracies of the form ``[(k1, accuracy1), (k2, accuracy2), ...]``.


Task 5
------

Using your function from task 4, plot the k values (x-axis) and the accuracies (y-axis).
Title the plot ``"KNN Classifier Accuracy vs k Value"``.
Label the x-axis ``"k (Number of Neighbors)"`` and the y-axis ``"Accuracy"``.
for the plotting, pass in the arguments ``['-bo', linewidth=2, markersize=8]``.
Make sure to use ``plt.tight_layout()`` to adjust the spacing between the subplots.
Make sure to use ``plt.show()`` to display the plot.