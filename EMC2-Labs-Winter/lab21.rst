Lab 21: K-Nearest Neighbors Classifier
======================================

In this lab you will be using the K-Nearest Neighbors (KNN) classifier to classify images of handwritten digits.
You will learn how to split the data into train and test sets, and how to use the KNN classifier to classify data.

Train vs Test 
-------------

If you remember, in Lab 18 we talked about the K-Means clustering algorithm which was a type of unsupervised learning.
This lab will focus on a form of **supervised learning** where the input data has a known label.
This this the equivalent of us learning how to read. 
We see hundreds and thousands of different letters when we are young, and we slowly learn how to identify them correctly.

Often times with supervised learning, we will have a dataset with a known labels. 
When we train a model, we want to know how well it performs. 
If we were to train the model on all the data, and then test it on the same data, we would not know how well it performs because it was trained on that data.
This is why we split our data into train and test sets.
We train the model on the train set, and then test it on the test set.
We can then use the test set to evaluate the performance of the model.

We will be using scikit-learn's functions for splitting the data and verifiying accuracy of the model.
Let's pretend that we want to train a fictious model to predict whether a number is even.

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

    >>> model = FictiousModel()
    >>> model.fit(X_train, y_train)

Then we can verify the accuracy of the model on the test set.
``accuracy_score`` is a function that calculates the accuracy of the model just using simple correct over incorrect. 

.. code:: python

    >>> from sklearn.metrics import accuracy_score
    >>> y_pred = model.predict(X_test)
    accuracy = accuracy_score(y_test, y_pred)
    >>> print(f"Accuracy: {accuracy}")
    Accuracy: 0.50

Task 1
------

Have Task where they split the data into train and test sets. 
.. TODO: Add Task


KNN Classifier
--------------

The K-Nearest Neighbors classifier is very easy to understand.
When it receives a new data point, it looks at the k nearest neighbors to the data point and then votes on the label of the data point.
"Nearest" can be any defined distance that you choose.
We will be using the Euclidean distance for this lab.

.. math::

    d(\mathbf{x}, \mathbf{y}) = \sqrt{\sum_{i=1}^n (x_i - y_i)^2}


The MNIST Dataset
-----------------

The MNIST dataset is a collection of 70,000 images of handwritten digits.
Each image is 28x28 pixels and is grayscale.
Each image is a single digit from 0 to 9.

.. Insert the image example of all 10 

.. Talk about decompressing the the image. 




Becuase Codebuddy can only take up to 10mb of data, we will be using a subset of the MNIST dataset, 5000 entries exactly. 







