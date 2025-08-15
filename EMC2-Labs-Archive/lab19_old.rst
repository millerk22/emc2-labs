Lab 19: Image Compression with SVD
==================================


In this lab you will perform image compression using singular value decomposition. 
You will need to import the following:

>>> import numpy as np
>>> import numpy.linalg as la
>>> import imageio as io 
>>> import matplotlib.pyplot as plt
>>> import scipy.misc


For this lab we will use a grayscale image of a racoon from the ``scipy.misc`` module, which can be accessed by

>>> F = scipy.misc.face(gray=True)


To display the image, use the command

>>> plt.imshow(F, cmap='gray')

The command ``F.shape`` shows that the image is stored as a numpy array of dimensions ``m x n``. 
These dimensions represent the coordinates of a pixel in the image with ``(0,0)`` in the top left corner. 
The first dimension is the vertical dimension and the second is the horizontal dimension.
We can take a part of the image by using a command like

>>> F1 = F[200:400, 500:700]
>>> plt.imshow(F1, cmap='gray')

Each entry is an integer representing how dark a pixel is (``0=black``, ``255=white``).
Since ``F`` is a two-dimensional array we can treat it as a matrix and perform a singular value decomposition:

>>> U,S,VT = la.svd(F)


Recall that the singular value decomposition writes :math:`F` in the form

.. math::
   F = U\Sigma V^{T}.

The matrix :math:`U` is an :math:`m \times m` matrix with orthonormal columns, and :math:`V` is an :math:`n \times n` matrix with orthonormal columns. 
:math:`\Sigma` is a diagonal matrix whose nonzero entries are the singular values of :math:`F`. 
Python represents this as ``S``, a list (numpy array) of the singular values of ``F``. 
The ``np.diag`` function will turn a list into a diagonal matrix. 
If ``r`` is the length of ``S``, the command

>>> Ftest = U[:,:r].dot(np.diag(S[:r])).dot(VT[:r])

will create a matrix ``Ftest`` that is the same as ``F`` (up to Python precision issues). 
If you display this as an image it will look indistinguishable from the original picture. 
Python may complain about a potential loss of precision, but you may ignore this. 
Now try using the command

>>> Ftest = U[:,:s].dot(np.diag(S[:s])).dot(VT[:s])

for some ``s<r``. 
This is the rank ``s`` approximation of ``F``.

Task 1
------

Display the rank ``s`` approximation of the image for several values of ``s``. What happens when ``s=500``? 
What about ``s=100``? What about ``s=1``?

Task 2
------


How small can you make ``s`` and still have the image recognizable? Don't worry about a little graininess.

Task 3
------

We can store a grayscale image as a list of integers of length ``u+r+v``, where ``u`` (or ``v``) is the number of entries 
in ``U`` (or ``V``). Stored that way, the amount of memory that the image takes up is proportional to that number ``u+r+v``.
When we reduce ``r`` to the smaller number ``s``, this reduces ``u`` and ``v`` as well to numbers ``u(s)`` and ``v(s)``. 
How does your choice of ``s`` in part (b) affect the amount of memory required to store the image? Compute the number 
``u(s)+s+v(s)`` for the SVD of ``Ftest`` for each choice of ``s`` as a percentage of ``u+r+v``.

