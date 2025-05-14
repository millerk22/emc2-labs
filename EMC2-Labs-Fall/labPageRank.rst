
Lab 24601: Networks and Eigenvector Centrality
==============================================

In this lab you will learn how to model real world networks as mathematical networks and adjacency matrices. 
You will need to import the following library.

>>> import numpy as np

A network is a collection of nodes. 
Nodes are objects that are connected by edges. 
You can think about it like houses (nodes) being connected to other houses by roads (edges) in a neighborhood (network).
This can be used to model everything from friends in social media to alliances between countries.
There are also directed networks, where each edge has a direction.
An example of this could be a supply chain where products are always sent from one firm to another.

Directed networks have become very important in modeling the internet.
We let websites/pages be the nodes, connected by various hyperlinks acting as directed edges.
Networks like this allow search engines such as Google and Microsoft Edge to rank pages based on importance or relevance.
In this lab we will walk you through this process of finding the importance of links.


Adjacency Matrices
------------------

Throughout this lab we will be building up to work with a network with 499 nodes and 12560 directed edges. 
This will be our *internet*.
You will be given the directed edges information in a vector where each row contains a directed edge with starting page on the left and ending page on the right.
It will be a :math:`12650 \times 2` matrix appearing like,

.. math::

    \left[
    \begin{matrix} 
    76 & 109 \\
    76 & 4 \\ 
    76 & 78 \\
    \vdots & \vdots
    \end{matrix}
    \right]

For example, this small snippet shows us that page 76, has hyperlinks to page 109, 4, and 78 respectively.
Now, we can take this vector and transform it into a much more useful form of data called an adjacency matrix.
This matrix is :math:`n \times n` with :math:`n` nodes.
In this matrix each row corresponnds to a starting page, and each column corresponds to an ending page.
So every :math:`(i,j)`\th position of the adjacency matrix will be a directed edge from node :math:`v_i` to node :math:`v_j`

.. image:: _static/directed_network.PNG
    :align: center

Consider the directed network above. It contains 5 nodes, and can be represented by the following :math:`5 \times 5` adjacency matrix,

.. math::
    A = 
    \left[
    \begin{matrix} 
    0 & 1 & 1 & 0 & 1 \\
    0 & 0 & 0 & 1 & 1 \\
    1 & 0 & 0 & 0 & 1 \\
    0 & 0 & 2 & 0 & 1 \\
    0 & 0 & 0 & 0 & 0 \\ 
    \end{matrix}
    \right]

.. Definitely directly copied this below from the lab haha

Notice the 2 in the 4th row, 3rd column, since there are two edges traveling from vertex 3 to vertex 2. 
Also, notice that there are no nonzero entries in the last row, which corresponds to the fact that vertex 4 does not have any edges which start from it.

Task 1
------
Define a function ``adj_matrix(edge_array)``\. 
This function will take a :math:`m \times 2`  ``np.array`` and return the respective adjacency matrix.
Because each node will be a natural number or 0 use ``np.max()`` and add 1 to find the amount of nodes.
Then use ``np.zeros((n, n))`` to generate a matrix of 0s of the correct size.
Finally, iterate through each row of ``edge_array`` to correctly fill in the matrix. 
It is important to remember that in ``edge_array``\, the rows corresponds to the node that is pointing, and the columns to the node being pointed to.
If you are confused on how to set up the adjacency matrix, refer to the notes above.


.. There was a part of the original lab where you take 
.. It talks about explaining that you could add up the amount of nodes points to a node to determine its importance but that would be stupid
.. So if they think that adding more of it would be useless them I'm not going to do it, unless we feel it's needed

PageRank Centrality
-------------------

For the next part of the lab we are going to explore how Google and other companies actually determine the importance of pages through PageRank Centrality.
Consider, the network below that we will define as network B.

.. image:: _static/directed_network_gprime.png
        :align: center

The adjacency matrix for this network is defined by

.. math::

   B = \left[
   \begin{array}{cccccccc}
   0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 \\
   0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 \\
   1 & 0 & 0 & 1 & 0 & 1 & 1 & 0 \\
   0 & 0 & 0 & 0 & 1 & 1 & 0 & 0 \\
   1 & 0 & 1 & 0 & 0 & 0 & 0 & 0 \\
   1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
   0 & 0 & 0 & 0 & 0 & 1 & 0 & 1 \\
   1 & 0 & 0 & 0 & 0 & 0 & 0 & 0
   \end{array}
   \right]

The basis of PageRank Centrality is that the importance of every node, :math:`x_i`\, is determined by the nodes pointing towards it.
Consider node :math:`1`. Only node :math:`0` is pointing towards it, and this node only points towards to one node. 
So :math:`x_1 = x_0`, or the importance of node :math:`1` is equal to the importance of node :math:`0`.
Now look at node :math:`7`. Only node :math:`6` is pointing there, but node :math:`6` is pointing to 2 different nodes. 
Hence :math:`x_7 = \frac{1}{2} x_6`. 
If we continue this for all of the nodes in our network we get the following set of equations.

.. math::
    
    \begin{array}{cc}
    x_0 = \frac{1}{2}x_4  + \frac{1}{4}x_2 + x_5 + x_7 & x_4 = \frac{1}{2} x_3 \\
    x_1 = x_0 & x_5 =  \frac{1}{2}x_6 + \frac{1}{4}x_2 + \frac{1}{2}x_3 \\
    x_2 = x_1 + \frac{1}{2}x_4 & x_6 = \frac{1}{4}x_2 \\
    x_3 = \frac{1}{4}x_2 & x_7 = \frac{1}{2} x_6
    \end{array}

Now we can take these equations and put them into a system of equations to solve for the importance of each node. Doing that we get

.. math::
    \left[
    \begin{array}{c}
    x_0\\ x_1\\ x_2\\ x_3\\ x_4\\ x_5\\ x_6\\ x_7
    \end{array}
    \right]
    =
    \left[
    \begin{array}{cccccccc}
    0 & 0 & \frac{1}{4} & 0 & \frac{1}{2} & 1 & 0 & 1 \\
    1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
    0 & 1 & 0 & 0 & \frac{1}{2} & 0 & 0 & 0 \\
    0 & 0 & \frac{1}{4} & 0 & 0 & 0 & 0 & 0 \\
    0 & 0 & 0 & \frac{1}{2} & 0 & 0 & 0 & 0 \\
    0 & 0 & \frac{1}{4} & \frac{1}{2} & 0 & 0 & \frac{1}{2} & 0 \\
    0 & 0 & \frac{1}{4} & 0 & 0 & 0 & 0 & 0 \\
    0 & 0 & 0 & 0 & 0 & 0 & \frac{1}{2} & 0
    \end{array}
    \right]
    \left[
    \begin{array}{c}
    x_0\\ x_1\\ x_2\\ x_3\\ x_4\\ x_5\\ x_6\\ x_7
    \end{array}
    \right]
    .

Now with we have a matrix of the form :math:`x=Px` or :math:`Px=x` where :math:`x` is the importance of each vector. 
As you can begin to see, we are solving for an eigenvector whose corresponding :math:`\lambda` is 1.

.. note::
    This matrix is a stochastic matrix. 
    This is because all of the columns of the matrix add up to one. 
    We are guaranteed with these matrices that the greatest eigenvalue will always be one.

If you remember back to lab 9, we used iterative methods to solve for the eigenvectors of systems of equations.
We can use iterative methods here as well.
For this method you start with an vector that sums of to 1. 
For example we could start with

.. math::
    x_0 = 
    \left[
    \begin{array}{c}
    1/8 \\
    1/8 \\
    1/8 \\
    1/8 \\
    1/8 \\
    1/8 \\
    1/8 \\
    1/8
    \end{array}
    \right].

The rules for the method is that :math:`x_{k+1} = Px_k`. 
Hence, :math:`x_{100} = P^{100}x_0`.
Like all iterative methods, as we increase the amount of iterations, the iterate becomes more and more accurate. 

Task 2
------

Define a function ``stoch_mat(A)`` which will take an adjacency matrix ``A`` and returns the corresponding stochastic matrix. 
You can calculate the stochastic matrix by dividing each row of the matrix by the sum of the row, and then taking the transpose using ``A.T``.

Task 3
------

Define a function ``stoch_eig(P, k)`` which takes a ``n x n`` stochastic matrix ``P`` and number of iterations ``k`` 
and returns the dominant eigenvector of ``P`` after ``k`` iterations.
You will need to start with ``x_0 = [1/n, 1/n, ... , 1/n]`` with ``n`` entries.
remember the equation :math:`x_{k+1} = Px_k`.

Task 4
------

Define a function ``PageRank_cent(edge_array, k)``.
You will need to combine all of your past functions to take ``edge_array`` and convert it to an adjacency matrix using the ``adj_matrix`` function.
Then convert the adjacency to a stochastic matrix using the ``stoch_mat`` function.
You will then need to use the ``stoch_eig`` function to return the dominant eigenvector after ``k`` iterations. 

Task 5
------

Use your recently created ``PageRank_cent`` to find the index of the most important node of 499 node network.
You can use ``np.argmax()`` to find the index of the largest element in an array. 

Conclusion
----------

Larry Page and Sergey Brin are the original developers of this algorithm
They developed this algorithm to sort pages by importance.
The PageRank algorithm is known to converge quite quickly. 
In their original paper, Brin and Page reported that on a network with 322 million edges the algorithm converged to usable values within 52 iterations.

Finally, as a historical note, the patent for the PageRank algorithm is owned by Stanford University (where Brin and Page were students at the time they developed it). 
Stanford granted Google exclusive license rights to use the algorithm, in exchange for 1.8 million shares of Google which Stanford sold in 2005 for $336 million. 
Today those shares would be worth approximately $3.8 billion, all for an algorithm which computes an eigenvector!
