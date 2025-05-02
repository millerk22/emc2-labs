Lab 21: Least Squares Lab
=========================


In this lab you will use least squares to obtain "lines of best fit" in regression tasks.  
You will need to import the following:

>>> import numpy as np
>>> import numpy.linalg as la
>>> from sklearn.datasets import load_diabetes

In various scientific domains, experimental data is used to infer mathematical relationships between input variables and associated outputs. 
We have a set of data points :math:`\{(x_i, y_i)\}_{i=1}^n` where :math:`x_i \in \mathbb{R}^d` are the inputs and :math:`y_i \in \mathbb{R}` are the associated outputs. 
We desire a function that approximates the mapping from inputs (i.e., independent variables) to outputs (i.e., dependent variables). 
This task is referred to as **regression**; it is ubiquitous in data-driven modeling and can be solved via the method of least squares. 

=====================
Polynomial Regression
=====================

For simplicity, let's consider the degree :math:`p` **polynomial regression** in the 1D case, where :math:`x_i \in \mathbb{R}`. 

To review least squares for polynomial regression, let :math:`y := (y_1, y_2, \ldots, y_n) \in \mathbb{R}^n` be the vector of output coefficients and let :math:`X` denote the polynomial data matrix

.. math::
   X = \begin{pmatrix}
      x_1^p & x_1^{p-1} & \ldots & x_1 & 1 \\
      x_2^p & x_2^{p-1} & \ldots & x_2 & 1 \\
      \vdots & \vdots & \vdots & \vdots & \vdots \\
      x_n^p & x_n^{p-1} & \ldots & x_n & 1 \\
   \end{pmatrix} \in \mathbb{R}^{n \times (p+1)}.

Any degree :math:`p` polynomial function :math:`f_p` can be identified by a set of coefficients :math:`c_0, c_1, \ldots, c_p \in \mathbb{R}`:

.. math::
   f_p(x) = c_0  +  c_1 x + \ldots + c_{p-1}x^{p-1} + c_p x^p = \sum_{j=0}^p c_j x^j. 


Task 1
------
Write a function ``compute_data_matrix(x, p)`` that accepts an input vector ``x`` and a non-negative integer power ``p``, and returns the corresponding polynomial data matrix as a ``Numpy`` array.


Task 2
------
Use the following plotting code to be able to visualize a dataset of inputs ``x`` and outputs ``y``.::

   def visualize_data(x, y):
      assert x.size == y.size 
      fig, ax = plt.subplots()
      ax.scatter(x, y)
      ax.set_xlabel('x')
      ax.set_ylabel('y')
      plt.show()
      return

Now, load in the following data, visualize it, and **determine a reasonable power** :math:`p \in \mathbb{N}` **for this dataset** by running the following:

>>> data = np.load("polynomial_data.npz") 
>>> x, y = data['x'], data['y'] 
>>> visualize_data(x, y) 

(Here, *power* refers to the degree of the polynomial that fits the shape of the data.)


We now will compute the least squares fit for the data visualized previously.

We seek a set of coefficients :math:`c_0, c_1, \ldots, c_p \in \mathbb{R}` such that the corresponding degree polynomial **coefficient vector** :math:`c \in \mathbb{R}^{p+1}` minimizes the **residual error**:

.. math::
   \|Xc - y\|^2 \leq \|Xw - y\|^2 \text{ for all } w \in \mathbb{R}^{p+1}.

As discussed in class, the **normal equations** that characterize the **least squares solution** :math:`\hat{c}` are:

.. math::
   X^TX \hat{c} = X^T y,

which is a linear system that we can use our linear algebra skills to solve. Under certain assumptions, the matrix :math:`X^TX` is invertible, 
and so we can write the least squares solution as 

.. math::
   \hat{c} = (X^T X)^{-1} X^T y.

The least squares fit line then is defined as the degree :math:`p` polynomial 

.. math::
   \hat{f}_p(x) = \hat{c}_0 + \hat{c}_1 x + \ldots, \hat{c}_{p-1} x^{p-1} + \hat{c}_p x^p, 

which when applied to our set of inputs in the data matrix looks like :math:`f = X \hat{c} \in \mathbb{R}^n`. 


Numpy's numerical linear algebra library contains an optimized version of the least squares method, called ``numpy.linalg.lstsq`` and so we will use it. 
See `the Numpy reference here`_.

.. _the Numpy reference here: https://numpy.org/doc/stable/reference/generated/numpy.linalg.lstsq.html


Task 3
------
Complete the following function ``plot_least_squares(x, y, p)`` to compute the least squares solution line and plot it against the data.::

   def plot_least_squares(x, y, p):
      assert x.size == y.size
      X = ...      # Compute data matrix with inputs x and polynomial power p 
      c_hat =  ...  # Compute the least squares solution using X and y
      f = ...      # Compute the least squares output, f = X \hat{c}
      fig, ax = plt.subplots()
      ax.scatter(x, y, label='orig data')  # this scatter plots the original data
      ax.plot(x, f, 'k--', label='LS fit') # this plots the least squares fit line 
      ax.set_xlabel('x')
      ax.set_ylabel('y')
      ax.legend()
      ax.set_title(f"Least Squares Polynomial fit with degree = {p}")
      plt.show()
      return

Description of inputs:

* input vector ``x``
* output vector ``y``
* desired polynomial power ``p``


Using the data from Task 2, run your ``plot_least_squares`` function, trying different values of the polynomial power, :math:`p`. 
For example, try :math:`p = 1, 2, 3, 5, 15`.

* What happens if you use a power :math:`p<P`, where :math:`P` is the degree determined in Task 2? 
* What happens if you use a *much larger* power than :math:`P`?


=============================================
Computing Linear Regression for Diabetes Data
=============================================

We now turn to a "real-world" regression task of predicting diabetes progression based on patient information and medical measurements. 
Let's compute a **linear regression** fit to the data in order to predict the disease progression; that is, we will identify coefficients 
:math:`\beta_0, \beta_1, \ldots, \beta_d \in \mathbb{R}` to approximate the mapping :math:`x_i \mapsto y_i`

.. math::
   y_i \approx \beta_0 + \beta_1 x_{i,1} + \beta_2 x_{i,2} + \ldots + \beta_d x_{i,d} = \beta^T \begin{pmatrix} x_i \\ 1 \\ \end{pmatrix}.

Thus, with a set of data :math:`\{x_i, y_i\}_{i=1}^n \subset \mathbb{R}^d \times \mathbb{R}`, we are computing the least squares fit with data matrix 

.. math::
   X = \begin{pmatrix}
      x_{1,1} & x_{1,2} & \ldots & x_{1,d} & 1 \\
      x_{2,1} & x_{2,2} & \ldots & x_{2,d} & 1\\
      \vdots & \vdots & \vdots & \vdots & \vdots \\
      x_{n,1} & x_{n,2} & \ldots & x_{n,d} & 1\\
   \end{pmatrix} \in \mathbb{R}^{n \times (d+1)}

and output vector :math:`y = (y_1, y_2, \ldots, y_n) \in \mathbb{R}^n`.


Task 4
------
Write a function ``compute_diabetes_fit()`` that computes the least squares fit coefficient vector :math:`\hat{\beta} \in \mathbb{R}^{d+1}` that is computed by ``linalg.lstsq()``. 
You may find the following code and guidelines to be useful:

>>> diabetes_data = load_diabetes()       # download the diabetes dataset
>>> X, y = diabetes_data.data, diabetes_data.target  # extract the data matrix (X) and targets (outputs) vector y 

- Extend the data matrix with a column of ones to model the offset. **Hint:** `See the numpy function`_ ``numpy.hstack``.
- Compute the least squares fit coefficient vector  via ``numpy.linalg.lstsq`` on this data. 

.. _See the numpy function: https://numpy.org/doc/stable/reference/generated/numpy.hstack.html

To conclude, we now analyze the linear regression coefficient result vector, :math:`\hat{\beta}`. The sign of an entry 
of this coefficient vector indicates the whether or not there is a **positive** or **negative** correlation between the 
corresponding input variable and the output data, conditioned on the other data. For example, if :math:`\hat{\beta}_j >0` and is **large**, then 
holding all else equal, a small change in the :math:`j^{th}` feature will lead to a large, positive change in the output. 

Task 5
------
Extend the capability of your previous function ``compute_diabetes_fit()`` to perform the following:

1. Extract the feature names of this dataset (``feature_names = diabetes_data.feature_names``)
2. Print out the feature names of the **most positive** and **most negative** regression coefficients. Record the names and values of those coefficients in CodeBuddy.

**NOTE: Be careful to account for indexing of the offset column in the data matrix** ``X``. **This is not accounted for in the** ``feature_names`` **list.**

You can check out the description of all the different features (independent variables) in this diabetes dataset by 
printing out 

>>> print(diabetes_data.DESCR)
