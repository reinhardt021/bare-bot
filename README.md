# BARE BOT

A command-line application 
that represents a robot moving on a table represented by a 6 by 6 square grid
that reads in the following commands:

* PLACE X, Y, O (West to East, South to North, Orientation)
* MOVE
* LEFT
* RIGHT
* REPORT

```
ex:
[ 0,5 ][ 1,5 ][ 2,5 ][ 3,5 ][ 4,5 ][ 5,5 ]
[ 0,4 ][ 1,4 ][ 2,4 ][ 3,4 ][ 4,4 ][ 5,4 ]
[ 0,3 ][ 1,3 ][ 2,3 ][ 3,3 ][ 4,3 ][ 5,3 ]
[ 0,2 ][ 1,2 ][ 2,2 ][ 3,2 ][ 4,2 ][ 5,2 ]
[ 0,1 ][ 1,1 ][ 2,1 ][ 3,1 ][ 4,1 ][ 5,1 ]
[ 0,0 ][ 1,0 ][ 2,0 ][ 3,0 ][ 4,0 ][ 5,0 ]
  N
W   E
  S
```

## Dependencies

* Ruby 3.0 or later
* bundler version 2.2.22 or later
* rubocop 1.26.1 or later

## Setup

```
// run in the command line
$ bundle install

// to run the program in the command line
$ ruby main.rb


Development:
// to run rubocop static analysis
$ rubocop
```

