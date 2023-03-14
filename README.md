# Implentation of computational methods | C1
> Professor: Enrique Garcia Ceja

## Sets and functions

### Operations: Cartesian product

A x B is the set of all pairs such that a is in A and b is in B.

> What's cardinality?
> It's the numeber of elements in the set

### Partitions
A partition P is aset of non empty subsets of A such that every element is in exactly one subset.

### Operations: Power set
Is the set of all possible subsets of A.

### Distance between two sets A and B 

- It's useful for machine learning
- The Jaccard index between two sets is defined by:
  - $J(A, B) = |A у B| / |A U B|$
  - $J_1 = 1 - J(A,B)$

### Relation

- A relation is symmetric if $(a,b) \in R \And (b,a) \in R$


# C2

## Symbol
- The most basic unit of a language is a symbol
## Alphabet
- It is denoted with $\sum$
- English alphabet is $\sum{a, b, ..., z}$

## Length
- Is denoted with $|x|$

## Prefix
- $p$ is a prefix of $w$ if there exist a string $y$ such that $w=py$

# Language
## Power
- The power of a language L is:
- $L^n=$

### Chomsky Hierarchy

# Deterministic Finite Automata | C3


## Accepted words (languages)
- Finite automatons can be used to recognize words
- A wprd


$\sigma = {
    ((q_0,0),q_1),((q_0,1),q_2),
    ((q_1,0),q_3),((q_1,1),q_0),
    ((q_1,0),q_0),((q_1,1),q_0),
    ((q_1,0),q_0),((q_1,1),q_0)
}$

0010