Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyPawn >> captureSquares [
    | diagonals |
    diagonals := self isWhite
        ifTrue: [ { square up left. square up right } ]
        ifFalse: [ { square down left. square down right } ].

    ^ diagonals select: [ :s |
        s notNil and: [
            s hasPiece and: [ s contents color ~= color ] ] ]
]

{ #category : 'rendering' }
MyPawn >> forwardSquares [
    ^ { self oneSquare. self twoSquares } select: [ :s |
        s notNil and: [ s hasPiece not ] ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> oneSquare [
    ^ self isWhite
        ifTrue: [ square up ]
        ifFalse: [ square down ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
    ^ self forwardSquares , self captureSquares
]

{ #category : 'rendering' }
MyPawn >> twoSquares [
    | one |
    one := self oneSquare.

    ^ one hasPiece
        ifTrue: [ nil ]
        ifFalse: [
            self isWhite
                ifTrue: [ one up ]
                ifFalse: [ one down ] ]
]
