
Lab 24601: Networks and Eigenvector Centrality
====================================


In this lab you will learn how to model real world networks as mathematical networks and adjacency matrices. 
You will need to import the following library.

>>> import numpy as np

A network is a collection of nodes connected by edges. Nodes are objects that are connected by edges. 
You can think about it like a houses, nodes, being connected to other houses by roads, edges, in a neighborhood, network.
This can be used to model everything from friends in social media to alliances between countries.
There are also directed networks, where each edge has a direction.
An example of this could be a supply chain where products are always sent from one firm to another.

Directed networks become very important in modeling the internet.
We can model with nodes being websites, connected by various hyperlinks acting as edges with direction.
Networks like this allow search engines such as Google and Microsoft Edge to rank pages based on importance or relevance.
The question then becomes how to they deciede the importantacne of pages.


Adjacency Matrices
------------------

Throughout this whole lab we will be looking at a network with 499 nodes and 12560 directed edges. 
This will be our *internet*.
You will be given this information in a vector where each row contains a directed edge with starting page on the left and ending page on the right.
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

For example, this small snipet shows us that page 76, has hyper links to page 109, 4, and 78 respectfully.
Now, we can take this vector and transform it into a much more useful form of data called an adjacency matrix.
This matrix is :math:`n \times n` with :math:`n` nodes.
In this matrix each row coresponnds to a starting page, and each coresponnds to an ending page.
So every :math:`(i,j)`\th position of the adjacency matrix will be a directed edge from node :math:`n_i` to node :math:`n_j`

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

.. Definatily directly copied this below from the lab haha
Notice the 2 in the 4th row, 3rd column, since there are two edges traveling from vertex 3 to vertex 2. 
Also, notice that there are no nonzero entries in the last row, which corresponds to the fact that vertex 4 does not have any edges which start from it.

Task 1
------
define a function ``adj_matrix(edge_array)``\. 
This function will take a :math:`m \times 2`  ``np.array`` and return the respective adjacency matrix.
It will be useful to use ``np.max()`` and ``np.min()`` of the array to find the min and max value to calculate the amount of nodes.
Then use ``np.zeros((n, n))`` to generate the approriate matrix.
Finally, iterate through each row of ``edge_array`` to correctly fill in the matrix. 
It is important to remember that in ``edge_array``\, the first column coresponds to the node that is point, and the second column to the node being pointed to.
If you are confused on how to set up the adjacency matrix, refer to the notes above.


.. There was a part of the orignal lab where you take 
.. It talks abouts explaining that you could add up the amount of nodes points to a node to deterime its importance but that would be stupid
.. So if they think that adding more of it would be useles them I'm not going to do it, unnless we feel lits needed

PageRank Centrality
-------------------

For the next part of the lab we are going to explore Google and other companies actually deterime the importance of pages through PageRank Centrality.
Consider, the net work below that we will define as network B.

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

The basis of PageRank Centrality is that the importance of every node :math:`x_i` is determined by the nodes pointing towards it.
Consider node :math:`1`. Only node :math:`0` is pointing towards it, and this node only points towards to one node. 
So :math:`x_1 = x_0`, or the importance of node :math:`1` is equal to the importance of node :math:`0`.
Now look at node :math:`7`. Only node :math:`6` is pointing there, but node :math:`6` is pointing to 2 different nodes. 
Hence :math:`x_7 = \frac{1}{2} x_6`. 
If we continue this for all of the nodes in our network we get the follow set of equations.

.. math::
    
    \begin{array}{cc}
    x_0 = \frac{1}{2}x_4  + \frac{1}{4}x_2 + x_5 + x_7 & x_4 = \frac{1}{2} x_3 \\
    x_1 = x_0 & x_5 =  \frac{1}{2}x_6 + \frac{1}{4}x_2 + \frac{1}{2}x_3 \\
    x_2 = x_1 + \frac{1}{2}x_4 & x_6 = \frac{1}{4}x_2 \\
    x_3 = \frac{1}{4}x_2 & x_7 = \frac{1}{2} x_6
    \end{array}

.. Transform this to a matrix
.. Show what a stochastic matrix is
.. Transform into one of those
.. Show what ierativite method does

.. Tasks
.. Define a function to make stochasstic matrix through speical way
.. Define function to estimate to certain level
.. Maybe arg max to return the most important 

Task 3
------




Conclusion
----------
