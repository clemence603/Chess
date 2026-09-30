Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e1' put: MyRook black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColorRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an same color rook on e column"
	board at: 'e1' put: MyRook white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testKingCanCastleKingside [
    | king board |
    board := MyChessBoard empty.
    board at: 'e1' put: (king := MyKing white).
    board at: 'h1' put: MyRook white.

    self assert: ((king targetSquaresLegal: true) anySatisfy: [ :s |
        s = (board at: 'g1') ])
]

{ #category : 'tests' }
MyKingTest >> testKingsideCastlingMovesRook [
    | king board |
    board := MyChessBoard empty.
    board at: 'e1' put: (king := MyKing white).
    board at: 'h1' put: MyRook white.

    king moveTo: (board at: 'g1').

    self assert: ((board at: 'g1') contents = king).
    self assert: ((board at: 'f1') contents class = MyRook).
    self assert: (board at: 'h1') hasPiece not
]
