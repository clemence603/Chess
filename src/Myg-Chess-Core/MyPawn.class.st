Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

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
    | oneSquare twoSquares |
    
    oneSquare := self isWhite
        ifTrue: [ square up ]
        ifFalse: [ square down ].
    
    twoSquares := (self isWhite
    ifTrue: [ square up ]
    ifFalse: [ square down ]).
    
	 twoSquares := twoSquares hasPiece
    ifTrue: [ nil ]
    ifFalse: [
        self isWhite
            ifTrue: [ twoSquares up ]
            ifFalse: [ twoSquares down ] ].
    
    ^ { oneSquare. twoSquares } select: [ :s |
        s notNil and: [ s hasPiece not ]]
]
