Lab 6: The Caesar Cipher
========================




The Caesar (or shift) cipher with integer key ``n`` encodes a string of letters by doing the following to each letter:

1. Translate the letter to an integer using the 26 character alphabet
	A = 00, B = 01, ..., Z = 25

2. Add ``n``

3. Reduce the result modulo 26 (take the remainder after dividing by 26)

4. Translate the result back to a letter

The effect is to shift each letter forward in the alphabet by ``n`` spaces, wrapping around at the end of the alphabet.
For example, to shift the letter ``T`` by ``n=12``, we would do the following:

1. ``T -> 19``

2. ``19 -> 19+12 = 31``

3. ``31 % 26 = 5``

4. ``5 -> F``

 

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




