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


Consider an arbitray matrix of size :math:`m \times n` called :math:`F`.
Recall that the singular value decomposition writes :math:`F` in the form

.. math::
   F = U\Sigma V^{T}.

The matrix :math:`U` is an :math:`m \times m` matrix with orthonormal columns, and :math:`V` is an :math:`n \times n` matrix with orthonormal columns. 
:math:`\Sigma` is a diagonal matrix whose nonzero entries are the singular values of :math:`F`. 
We can use the NumPy function ``la.svd()`` to get these matrices in python.

>>> U,S,VT = la.svd(F)

Python represents this as ``S``, a list (numpy array) of the singular values of ``F``. 
The ``np.diag`` function will turn a list into a diagonal matrix. 
Remember that one of the most useful concepts about SVD decomposition is that when we use the first ``s`` ranks of ``S``, we can obtain a relativly accurate approximation of the matrix :math:`F`\.

>>> Fapprox = U[:,:s].dot(np.diag(S[:s])).dot(VT[:s])

This becomes very useful in the context of images.
Most images are stored in matrices of the size ``(height, width, 3)`` where the 3 depths refer to red, blue, green colors represented by a number between 0 and 255.
Because space to store data is finite, performing SVD on every depth, and keeping the first ``s`` ranks of the decomposition can greatly reduce the data taken up.
For simplicity we will focus on doing this decomposition on grayscale images which are represented by 2d matrices with values inbetween 0 and 255.
For this lab we will use a grayscale image of a cat named Chelsea from the ``skimage.data`` module, which can be accessed by

>>> F = color.rgb2gray(data.chelsea())

To display the image, use the command

>>> plt.imshow(F, cmap='gray')

The command ``F.shape`` shows that the image is stored as a numpy array of dimensions ``m x n``. 
These dimensions represent the coordinates of a pixel in the image with ``(0,0)`` in the top left corner. 
The first dimension is the vertical dimension and the second is the horizontal dimension.
Each entry is an integer representing how dark a pixel is (``0=black``, ``255=white``).

.. I need to tie this back to SVD somehow

Task 1
------

Write a function ``svd_decomp(F, s)`` which takes in a 2d grayscale matrix ``F``\, and rank ``s``, and returns an SVD approximation of ``F`` up to rank ``s``.
If ``s`` is greater than the length of ``S``, raise a ``ValueError`` and say ``"s cannot be larger than legnth of S"``.


Task 2
------

How small can you make ``s`` and still have the image recognizable? Don't worry about a little graininess.

Principal Component Analysis
----------------------------

Principal component analysis is a dimensionality reduction technique used to simplify complex datasets while preserving as much information as possible.
Imagine you have a 