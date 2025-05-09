
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


Task 2
------

.. Define function tocaluclate how many indices are pointing to each. Have it return the order of impportance  us ing array.argosrt()
.. 


PageRank Centrality
-------------------



Task 3
------




Conclusion
----------
