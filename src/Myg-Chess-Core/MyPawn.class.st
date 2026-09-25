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
    | oneSquare twoSquares |
    oneSquare := self isWhite
        ifTrue: [ square up ]
        ifFalse: [ square down ].

    twoSquares := oneSquare hasPiece
        ifTrue: [ nil ]
        ifFalse: [
            self isWhite
                ifTrue: [ oneSquare up ]
                ifFalse: [ oneSquare down ] ].

    ^ { oneSquare. twoSquares } select: [ :s |
        s notNil and: [ s hasPiece not ] ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
    ^ self forwardSquares , self captureSquares
]
