Class {
	#name : 'MyQueenTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyQueenTests >> testQueenCanCapture [
    | queen board |
    board := MyChessBoard empty.
    board at: 'e4' put: (queen := MyQueen white).
    board at: 'h4' put: MyPawn black.

    self assert: ((queen targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'h4') ])
]

{ #category : 'tests' }
MyQueenTests >> testQueenCannotCaptureSameColor [
    | queen board |
    board := MyChessBoard empty.
    board at: 'e4' put: (queen := MyQueen white).
    board at: 'h4' put: MyPawn white.

    self deny: ((queen targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'h4') ])
]

{ #category : 'tests' }
MyQueenTests >> testQueenCannotMoveBeyondAdjacentPiece [
    | queen board |
    board := MyChessBoard empty.
    board at: 'e4' put: (queen := MyQueen white).
    board at: 'f4' put: MyPawn white.

    self deny: ((queen targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'g4') ])
]

{ #category : 'tests' }
MyQueenTests >> testQueenCannotMoveThroughPiece [
    | queen board |
    board := MyChessBoard empty.
    board at: 'e4' put: (queen := MyQueen white).
    board at: 'g4' put: MyPawn black.

    self deny: ((queen targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'h4') ])
]

{ #category : 'tests' }
MyQueenTests >> testQueenMovesDiagonally [
    | queen board |
    board := MyChessBoard empty.
    board at: 'e4' put: (queen := MyQueen white).

    self assert: ((queen targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'h7') ])
]

{ #category : 'tests' }
MyQueenTests >> testQueenMovesHorizontally [
    | queen board |
    board := MyChessBoard empty.
    board at: 'e4' put: (queen := MyQueen white).

    self assert: ((queen targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'h4') ])
]

{ #category : 'tests' }
MyQueenTests >> testQueenMovesVertically [
    | queen board |
    board := MyChessBoard empty.
    board at: 'e4' put: (queen := MyQueen white).

    self assert: ((queen targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'e7') ])
]
