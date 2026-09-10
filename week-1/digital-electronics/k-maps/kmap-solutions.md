# K-Map Solutions

## Example 1: 2-Variable AND Function

Function:

Y = A · B

Truth table:

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

Minterm:

Y = Σm(3)

2-variable K-map:

| A\B | 0 | 1 |
|-----|---|---|
| 0   | 0 | 0 |
| 1   | 0 | 1 |

The only 1 occurs at A=1, B=1.

Simplified result:

Y = A · B


## Example 2: 2-Variable OR Function

Function:

Y = A + B

Truth table:

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

Minterms:

Y = Σm(1,2,3)

K-map:

| A\B | 0 | 1 |
|-----|---|---|
| 0   | 0 | 1 |
| 1   | 1 | 1 |

Grouping the three 1s gives:

Y = A + B


## Example 3: XOR Function

Function:

Y = A ⊕ B

Truth table:

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

Minterms:

Y = Σm(1,2)

Simplified Boolean expression:

Y = A'B + AB'
