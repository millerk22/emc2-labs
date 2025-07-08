Lab 6: The Caesar Cipher
========================

The Caesar (or shift) cipher takes a message and "shifts" it by a certain number of letters. Here is the entire process:

#. Translate the letter to an integer using the 26 character alphabet
	A = 00, B = 01, ..., Z = 25

#. Add ``n``

#. Reduce the result modulo 26 (take the remainder after dividing by 26)

#. Translate the result back to a letter

The effect is to shift each letter forward in the alphabet by ``n`` spaces, wrapping around at the end of the alphabet.
For example, to shift the letter ``T`` by ``n=12``, we would do the following:

#. ``T -> 19``

#. ``19 -> 19+12 = 31``

#. ``31 % 26 = 5``

#. ``5 -> F``

The Mod Operator
----------------

An important operator we haven't covered yet is the mod (modulo) operator. It is represented by the ``%`` sign. All it does is take the first operator and repeatedly subtract the second operator from it until it can't anymore, then it returns the result. You can think of this as the remainder of an integer division problem. For example,

>>> 10 % 2
0
>>> 9 % 2
1
>>> 127 % 126
1
>>> 126 % 127
126

If you want some more help understanding how mod works, open up Colab and try a few examples.

Task 1
------

Write a function ``shift_encrypt_letter(n,letter)`` that takes an integer ``n`` and a capital letter (or space character) ``letter`` and encrypts the letter using the Caesar cipher with key ``n``. 
If ``letter`` is a space character, your function should return it unchanged.


	
>>> shift_encrypt_letter(3, `C')
'F'
>>> shift_encrypt_letter(3, 'A')
'D'
>>> shift_encrypt_letter(3, 'T')
'W'
>>> shift_encrypt_letter(9, 'T')
'C'
>>> shift_encrypt_letter(5, ' ')
' '

Task 2
------

Write a function ``shift_encrypt(n,s)`` that takes an integer ``n`` and a string of capital letters (or space characters) ``s`` and encrypts the string using the Caesar cipher with key ``n``.  
Use list comprehension, then string join:

.. code-block:: python	

	L = [shift_encrypt_letter(n,let) for let in s]
	''.join(L)

>>> shift_encrypt(3, 'CAT')
'FDW'
>>> shift_encrypt(-23, 'CAT')
'FDW'
>>> shift_encrypt(7, 'CAT IN THE HAT')
'JHA PU AOL OHA'
	

Task 3
------

Write a function ``shift_decrypt(n,s)`` that takes an integer ``n`` and a string of capital letters ``s`` and decrypts the string. Can you think of a way to do this by just calling ``shift_encrypt`` with a different ``n``?


>>> shift_decrypt(3, 'FDW')
'CAT'

Task 4
------

Decrypt the coded message ``KYV TRBV ZJ R CZV`` by running your ``shift_decrypt`` function for every ``n`` in 
``1,2,3,...,25`` and reading off the only one that makes sense.




