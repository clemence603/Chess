Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testPawnCanMoveTwoSquares [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e2' put: (pawn := MyPawn white).

    self assert: (pawn targetSquaresLegal: true) size = 2
]
