Lab 22: The Lean Theorem Prover Part I
======================================

From the Lean Theorem Prover community website:
   A proof assistant is a piece of software that provides a language for defining objects, specifying properties of these objects, and proving that these specifications hold. The system checks that these proofs are correct down to their logical foundation.

   These tools are often used to verify the correctness of programs. But they can also be used for abstract mathematics.... In a formalization, all definitions are precisely specified and all proofs are virtually guaranteed to be correct.

In this lab, we will get a sense of how a theorem prover works by proving basic properties of the natural numbers in the interactive theorem prover Lean.
Visit

`<https://adam.math.hhu.de/#/g/leanprover-community/nng4>`_

Start by reading the instructions on the left-hand side of the page, under "Welcome to the Natural Number Game." 

Successor Function
------------------

In order to rigorously define the natural numbers through the Lean theorem prover, we start with two concepts: the number :math:`0`, and the **successor function** on a natural number :math:`n`, :math:`s(n)`. 
Think of :math:`s(n)` as the number that comes “after” :math:`n`, whatever that means. 

Note that we haven’t defined addition yet (we don’t even know what the numbers are!) so :math:`s(n)` doesn’t mean :math:`n` “plus” :math:`1`.
Yet. Informally (but less informally than before), we will define the natural numbers as the
set containing :math:`0`, the successor :math:`s(0)`, the successor :math:`s(s(0))`, the successor :math:`s(s(s(0)))`, etc. This
leads to two axioms used for constructing the natural numbers.

* **Axiom 1:** :math:`0` is a natural number.
* **Axiom 2:** If :math:`n` is a natural number, then :math:`s(0)` is a natural number.

By Axioms 1 and 2, we see that :math:`s(s(s(s(s(s(s(0)))))))` is a natural number. Don’t worry, we won’t write numbers like this; instead we’ll use the
notation we’re all familiar with. So the number above is called :math:`7`. But for now, the symbol
:math:`7` means nothing other than a shorthand notation for the successor of the successor of the
successor of the successor of the successor of the successor of the successor of :math:`0`.

It may seem like this is enough to define the natural numbers, but through this lab (and the subsequent Lean Lab), we will see that we need a few more axioms.

Task 1
------

Complete every level from each of the following worlds:

#. Tutorial World
#. Addition World
#. Multiplication World

In the next 290 lab, (:doc:`lab24`), you will complete worlds 4-6.