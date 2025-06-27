Lab 19: Applications of SVD
==================================


In this lab you will learn about applications of SVD in image compression and in principal component analysis (PCA). 

Image compression
-----------------

For this part of the lab you will perform image compression using singular value decomposition. 
You will need to import the following:

>>> import numpy as np
>>> import numpy.linalg as la
>>> import matplotlib.pyplot as plt
>>> from skimage import data, color

First, we will do a quick review of SVD decomposition.
Consider an arbitrary matrix of size :math:`m \times n` called :math:`F`.
Recall that the singular value decomposition writes :math:`F` in the form

.. math::
   F = U\Sigma V^{T}.

The matrix :math:`U` is an :math:`m \times m` matrix with orthonormal columns, and :math:`V` is an :math:`n \times n` matrix with orthonormal columns. 
:math:`\Sigma` is a diagonal matrix whose nonzero entries are the singular values of :math:`F`. 
We can use the NumPy function ``la.svd()`` to get these matrices in Python.

>>> U,S,VT = la.svd(F)

Python represents :math:`\Sigma` as ``S``, a list (NumPy array) of the singular values of ``F``. 
The ``np.diag()`` function will turn a list into a diagonal matrix. 
Remember that one of the most useful concepts about SVD decomposition is that when we use the first ``s`` ranks of ``S``, we can obtain a relatively accurate approximation of the matrix :math:`F`\.

>>> F_approx = U[:,:s].dot(np.diag(S[:s])).dot(VT[:s])

This becomes very useful in the context of images.
Most images are stored in matrices of the size ``(height, width, 3)`` where the 3 depths refer to red, blue, green colors represented by a number between 0 and 255.
Because space to store data is finite, performing SVD on every depth, and keeping the first ``s`` ranks of the decomposition can greatly reduce the data taken up while still preserving much of the image quality.
For simplicity we will focus on doing this decomposition on grayscale images which are represented by 2-D matrices with values between 0 and 255.
For this lab we will use a grayscale image of a cat named *Chelsea* from the ``skimage.data`` module, which can be accessed by
this
>>> F = color.rgb2gray(data.chelsea())

To display the image, use the command

>>> plt.imshow(F, cmap='gray')

The command ``F.shape`` shows that the image is stored as a NumPy array of dimensions ``m x n``. 
These dimensions represent the coordinates of a pixel in the image with ``(0,0)`` in the top left corner. 
The first dimension is the vertical dimension and the second is the horizontal dimension.
Each entry is an integer representing how dark a pixel is (``0=black``, ``255=white``).

.. I need to tie this back to SVD somehow

Task 1
------

Write a function ``svd_decomp(F, s)`` which takes in a 2-D grayscale matrix ``F``\, and rank ``s``, and returns an SVD approximation of ``F`` up to rank ``s``.
If ``s`` is greater than the length of ``S``, raise a ``ValueError`` and print ``"s cannot be larger than length of S"``.


Task 2
------

How small can you make ``s`` and still have the image recognizable? Don't worry about a little graininess.


Principal Component Analysis
----------------------------

Principal component analysis is a dimensionality reduction technique used to simplify complex datasets while preserving as much information as possible.
In other words, we want to project the data onto a 2-D plane where the most variance exists.
Let's do an example
Let's start with and :math:`m \times n` matrix :math:`X` where :math:`m` is the number of data points and :math:`n` is the number of features for each data point.
In the context of star's, you can think of :math:`m` being different stars and :math:`n` being each stars temperature, luminosity, radius, and absolute magnitude.
The first step is to center the data over each column. 
After this you perform SVD decomposition to obtain :math:`V^T`. 
You then truncate :math:`V` to the amount of principal components you desire :math:`k`\.
You then take the truncated version :math:`V_k`\, and project :math:`X` onto it through :math:`XV_k` to obtain your PCA reduction of :math:`X` into a :math:`m \times k` matrix which you can plot.

.. note::

   We say principal component in PCA, because the axis of these projections hold no metric (they don't mean anything interpretable in context of the features). 
   So while PCA can be really effective to visualize groupings and relations among the data in data sets, it is limited in producing actual conclusions about the features relation to the data.

We will use the NASA Star-Type Dataset which includes data about various stars. 
It has the same features as the example up above.

.. image:: _static/pca.png
        :align: center

As you can see above the PCA works very well because we can see almost distinct groupings for each star type.
Now just so you can understand more of how the variance is preserved through the first two features take a look at the two graphs below. 
On the left we have PCA done with the first 2 columns of :math:`V`, and on the right we have it done with columns 3 and 4.
It is clear to see how so much more variance, and accuracy, is preserved in columns 1 and 2 compared with 3 and 4.


.. image:: _static/pca_vs.png
        :align: center

Task 3
------
Write a function called ``PCA(X, k)`` which takes in a matrix ``X``, and number of principal components ``k`` and returns an ``m x k`` ``numpy.array`` using the PCA algorithm defined above.


Task 4
------

Use your newly defined ``PCA(X, k)`` function to perfrom PCA on the Palmer Penguins Dataset, and then print out which two groups are the most similar according to the analysis. 
