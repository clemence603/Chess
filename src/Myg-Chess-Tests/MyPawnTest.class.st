Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnMovesDown [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e7' put: (pawn := MyPawn black).

    self assert: pawn oneSquare = (board at: 'e6').
    self assert: pawn twoSquares = (board at: 'e5')
]

{ #category : 'tests' }
MyPawnTest >> testPawnCanCaptureDiagonally [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e4' put: (pawn := MyPawn white).
    board at: 'd5' put: MyPawn black.

    self assert: ((pawn targetSquaresLegal: true) anySatisfy: [ :square |
        square = (board at: 'd5') ])
]

{ #category : 'tests' }
MyPawnTest >> testPawnCanMoveTwoSquares [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e2' put: (pawn := MyPawn white).

    self assert: (pawn targetSquaresLegal: true) size = 2
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotCaptureForward [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e4' put: (pawn := MyPawn white).
    board at: 'e5' put: MyPawn black.

    self deny: ((pawn targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'e5') ])
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotMoveDiagonallyToEmptySquare [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e4' put: (pawn := MyPawn white).

    self deny: ((pawn targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'd5') ])
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotMoveForwardIfBlocked [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e2' put: (pawn := MyPawn white).
    board at: 'e3' put: MyPawn black.

    self deny: ((pawn targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'e3') ])
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotMoveTwoSquaresAfterLeavingStartingRank [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e4' put: (pawn := MyPawn white).

    self deny: ((pawn targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'e6') ])
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotMoveTwoSquaresIfBlocked [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e2' put: (pawn := MyPawn white).
    board at: 'e3' put: MyPawn black.

    self deny: ((pawn targetSquaresLegal: true) anySatisfy: [ :square |
        square = (board at: 'e4') ])
]

{ #category : 'tests' }
MyPawnTest >> testPawnForwardSquares [
    | pawn board |
    board := MyChessBoard empty.
    board at: 'e2' put: (pawn := MyPawn white).

    self assert: pawn oneSquare = (board at: 'e3').
    self assert: pawn twoSquares = (board at: 'e4')
]
