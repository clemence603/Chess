Class {
	#name : 'MyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTest >> testMyKingFindsKingOnBoard [
    | board rook king |
    board := MyChessBoard empty.
    board at: 'e1' put: (king := MyKing white).
    board at: 'e2' put: (rook := MyRook white).

    self assert: rook myKing = king
]

{ #category : 'tests' }
MyPieceTest >> testMyKingFindsKingWhenOpponentRookAttacks [
    | board rook king |
    board := MyChessBoard empty.

    board at: 'e1' put: (king := MyKing white).
    board at: 'e2' put: (rook := MyRook white).
    board at: 'e8' put: MyRook black.

    self assert: rook myKing = king
]

{ #category : 'tests' }
MyPieceTest >> testMyKingReturnsKingOfSameColor [
    | board rook king |
    board := MyChessBoard empty.
    board at: 'e1' put: (king := MyKing white).
    board at: 'e2' put: (rook := MyRook white).
    board at: 'e8' put: MyKing black.

    self assert: rook myKing = king
]

{ #category : 'tests' }
MyPieceTest >> testPieceCannotExposeItsKingToCheck [
    | board rook |
    board := MyChessBoard empty.

    board at: 'e1' put: MyKing white.
    board at: 'e2' put: (rook := MyRook white).
    board at: 'e8' put: MyRook black.

    self deny: (rook legalTargetSquares
        anySatisfy: [ :s | s = (board at: 'f2') ]).
]

{ #category : 'tests' }
MyPieceTest >> testRookCannotExposeKing [
    | board rook |
    board := MyChessBoard empty.

    board at: 'e1' put: MyKing white.
    board at: 'e2' put: (rook := MyRook white).
    board at: 'e8' put: MyRook black.

    self deny: (rook legalTargetSquares
        anySatisfy: [ :s | s = (board at: 'f2') ])
]
