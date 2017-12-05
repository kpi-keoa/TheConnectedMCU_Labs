Game "Life" (Game of Life) - cellular automaton (cellular automaton), invented by the English mathematician John Conway (English) in 1970.

For a basis I took the old source code on  C++ and simply modified it for PIC32:)

In the sketch, a random seeding of the playing field is realized.

Rules of the game "Life"
1. Each cell can be in one of two states: "alive" / "dead" (1/0).
2. The state of the cell at the m-th step is defined as follows:
the state of the cell itself and its neighboring cells is determined at the m-th step and, depending on this cell, one of two states is assigned.
The rules of cell life are simple:
- if the living cell at the m-th step has less than two or more than three neighbors (in the vicinity of Moore, then it dies to step m (you can say "out of boredom" or "from overpopulation"),
- in place of the dead cell, at step m, a living cell appears if it has exactly three neighbors in the vicinity of the m-1th step.