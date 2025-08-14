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

Have them plot a 1x3 plot of 3 examples of the digits. 
show its plt.imshow(image, cmap='gray') for each of the 3 digits.


Explain why they need to flatten the image. Explain np.reshape 



Because Codebuddy can only take up to 10mb of data, we will be using a subset of the MNIST dataset, 5000 entries exactly. 

Train vs Test 
-------------

With supervised learning, we will always have a dataset with a known labels. 
When we train a model, we want to know how well it performs. 
If we were to train the model on all the data, and then test it on the same data, we would not know how well it performs because it was trained on that data.
Its like testing students on the practice test that we gave them all the answers for. 
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













