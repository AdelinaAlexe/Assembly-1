ALEXE ADELINA MARIA - 312CC
TEMA 2

For the assignment solution, I implemented the following tasks:

Task 1:
Firstly, I stored the ant's ID in ecx, calculated by right-shifting the initial
number by 24 bits (obtaining the first 8 most significant bits) and applied an
'AND' operation between the remaining bits and a mask to ensure that the bits
from positions 8 to 31 are 0.
To obtain the desired room list stored in edx, I performed a left shift and
then a right shift by 8 bits to cancel out the bits from position 24 to 31.
I accessed the number from the ant_permissions vector at the position stored in
ecx and iterated through the number bit by bit to verify if all desired rooms
are accessible.

Task 2:

Subtask 1:
I traversed the structures using two indices stored in esi and edi, where esi
represents the current structure, and edi iterates through the next structures
until the end.
Firstly, I compared in descending order by admin, and if the two structures
needed to be swapped, I jumped to the switch label, where I performed the
field-by-field swap, and in the case of the username, character by character.
If they have the same admin, I sorted in ascending order by priority, and if
the priority is identical, I sorted in ascending order, character by character,
by username.

Subtask 2:
I traversed the structures with an index stored in esi.
In edx, I stored the current passkey and initially checked if its first or last
bit is 0, in which case it skips the rest of the code, as it's not a hacker.
Otherwise, I counted the number of '1' bits in the first half and then in the
second half, checked if they meet the conditions, and set the value 1 in eax
if it's a hacker.

Task 3:

Encryption function:
I stored a counter in eax that counts the rounds.
In each round, I applied the encryption algorithm described in the statement to
each element from 0 to 7, handling overflow in 1 byte accordingly, and modified
the value at the next address.

Decryption function:
I used the same resolution method, but for the decryption algorithm, I started
each time from position 7 to position 0 and handled underflow.

Task 4:

I initialized variables for the current row and column, as well as for the last
row and last column.
Starting from position (0, 0), marking the current element with '1' to avoid
retracing steps, I checked in the four directions: up, right, down, left if the
element is '0', and if it finds a '0' element, it modifies the row and column
indices accordingly until it reaches the last row or last column.