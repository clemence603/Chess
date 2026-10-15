Class {
	#name : 'MyRenderTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyRenderTests >> testRenderBlackPawnOnWhiteSquare [
    | board square pawn |
    board := MyChessBoard empty.
    square := board at: 'e4'.
    pawn := MyPawn black.

    self assert: (square renderPawn: pawn) equals: 'O'
]

{ #category : 'tests' }
MyRenderTests >> testRenderPieceWithCharacters [
    | board whiteSquare blackSquare whitePawn blackPawn |
    board := MyChessBoard empty.
    whiteSquare := board at: 'e4'.
    blackSquare := board at: 'e5'.
    whitePawn := MyPawn white.
    blackPawn := MyPawn black.

    self assert: (whiteSquare
        renderPiece: whitePawn
        whiteOnWhite: 'P'
        whiteOnBlack: 'p'
        blackOnWhite: 'O'
        blackOnBlack: 'o') equals: 'P'.

    self assert: (blackSquare
        renderPiece: whitePawn
        whiteOnWhite: 'P'
        whiteOnBlack: 'p'
        blackOnWhite: 'O'
        blackOnBlack: 'o') equals: 'p'.

    self assert: (whiteSquare
        renderPiece: blackPawn
        whiteOnWhite: 'P'
        whiteOnBlack: 'p'
        blackOnWhite: 'O'
        blackOnBlack: 'o') equals: 'O'.

    self assert: (blackSquare
        renderPiece: blackPawn
        whiteOnWhite: 'P'
        whiteOnBlack: 'p'
        blackOnWhite: 'O'
        blackOnBlack: 'o') equals: 'o'

]

{ #category : 'tests' }
MyRenderTests >> testRenderWhiteBishop [
    | board whiteSquare blackSquare bishop |
    board := MyChessBoard empty.
    whiteSquare := board at: 'e4'.
    blackSquare := board at: 'e5'.
    bishop := MyBishop white.

    self assert: (whiteSquare renderBishop: bishop) equals: 'B'.
    self assert: (blackSquare renderBishop: bishop) equals: 'b'

]

{ #category : 'tests' }
MyRenderTests >> testRenderWhiteKing [
    | board whiteSquare blackSquare king |
    board := MyChessBoard empty.
    whiteSquare := board at: 'e4'.
    blackSquare := board at: 'e5'.
    king := MyKing white.

    self assert: (whiteSquare renderKing: king) equals: 'K'.
    self assert: (blackSquare renderKing: king) equals: 'k'
]

{ #category : 'tests' }
MyRenderTests >> testRenderWhiteKnight [
    | board whiteSquare blackSquare knight |
    board := MyChessBoard empty.
    whiteSquare := board at: 'e4'.
    blackSquare := board at: 'e5'.
    knight := MyKnight white.

    self assert: (whiteSquare renderKnight: knight) equals: 'N'.
    self assert: (blackSquare renderKnight: knight) equals: 'n'
]

{ #category : 'tests' }
MyRenderTests >> testRenderWhitePawn [
    | board square pawn |
board := MyChessBoard empty.
square := board at: 'e4'.
pawn := MyPawn white.

self assert: (square renderPawn: pawn) equals: 'P'
]

{ #category : 'tests' }
MyRenderTests >> testRenderWhitePawnOnBlackSquare [
    | board square pawn |
    board := MyChessBoard empty.
    square := board at: 'e5'.
    pawn := MyPawn white.

    self assert: (square renderPawn: pawn) equals: 'p'
]

{ #category : 'tests' }
MyRenderTests >> testRenderWhiteQueen [
    | board whiteSquare blackSquare queen |
    board := MyChessBoard empty.
    whiteSquare := board at: 'e4'.
    blackSquare := board at: 'e5'.
    queen := MyQueen white.

    self assert: (whiteSquare renderQueen: queen) equals: 'Q'.
    self assert: (blackSquare renderQueen: queen) equals: 'q'
]

{ #category : 'tests' }
MyRenderTests >> testRenderWhiteRook [
    | board whiteSquare blackSquare rook |
    board := MyChessBoard empty.
    whiteSquare := board at: 'e4'.
    blackSquare := board at: 'e5'.
    rook := MyRook white.

    self assert: (whiteSquare renderRook: rook) equals: 'R'.
    self assert: (blackSquare renderRook: rook) equals: 'r'
]

{ #category : 'tests' }
MyRenderTests >> testRenderWhiteRookOnWhiteSquare [
    | board square rook |
    board := MyChessBoard empty.
    square := board at: 'e4'.
    rook := MyRook white.

    self assert: (square renderRook: rook) equals: 'R'
]
