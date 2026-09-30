Class {
	#name : 'MyKing',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyKing >> attackingSquares [

	^ self basicTargetSquares
]

{ #category : 'rendering' }
MyKing >> basicTargetSquares [

	"The king can move one square on each direction including diagonals"
	^ {
		square ifNotNil: #right.
		square up ifNotNil: #right.
		square ifNotNil: #up.
		square up ifNotNil: #left.
		square ifNotNil: #left.
		square left ifNotNil: #down.
		square ifNotNil: #down.
		square down ifNotNil: #right
	}
]

{ #category : 'rendering' }
MyKing >> castlingSquares [
    | rook |
    rook := square right right right.

    ^ (rook notNil and: [
        rook hasPiece and: [
            rook contents class = MyRook ]])
        ifTrue: [ { square right right } ]
        ifFalse: [ #() ]
]

{ #category : 'accessing' }
MyKing >> id [
	
	^ 'K'
]

{ #category : 'testing' }
MyKing >> isCheckMated [
	"We check if the opponent pieces target all my potential movements and myself"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ self legalTargetSquares isEmpty and: [
		  threatenedSquares includes: self square ]
]

{ #category : 'testing' }
MyKing >> isInCheck [
	"We check if the opponent pieces target all my potential movements and myself"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ threatenedSquares includes: self square
]

{ #category : 'testing' }
MyKing >> isKing [
	
	^ true
]

{ #category : 'rendering' }
MyKing >> moveTo: aSquare [
    | rook oldSquare |

    oldSquare := square.
    super moveTo: aSquare.

    (aSquare = (oldSquare right right)) ifTrue: [
        rook := oldSquare right right right contents.
        rook square: aSquare left.
        oldSquare right right right emptyContents.
        aSquare left contents: rook ]
]

{ #category : 'accessing' }
MyKing >> opponentPieces [

	^ self board pieces select: [ :e |
		  e notNil and: [ e color = color negated ] ]
]

{ #category : 'rendering' }
MyKing >> renderPieceOn: aSquare [

	^ aSquare renderKing: self
]

{ #category : 'rendering' }
MyKing >> targetSquaresLegal: aBoolean [

    "The king cannot move to threatened squares"

    | threatenedSquares |
    threatenedSquares := self opponentPieces flatCollect: [ :e |
                         e attackingSquares ].

    ^ (self basicTargetSquares , self castlingSquares) select: [ :s |
          s notNil and: [
              (threatenedSquares includes: s) not and: [
                  s hasPiece not or: [
                      s contents color ~= color and: [
                          threatenedSquares includes: s ] ] ] ] ]
]
