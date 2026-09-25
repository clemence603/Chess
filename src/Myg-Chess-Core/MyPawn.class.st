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
    | oneSquare twoSquares diagonals |
    
    oneSquare := self isWhite
        ifTrue: [ square up ]
        ifFalse: [ square down ].
    
    twoSquares := oneSquare hasPiece
        ifTrue: [ nil ]
        ifFalse: [
            self isWhite
                ifTrue: [ oneSquare up ]
                ifFalse: [ oneSquare down ] ].
    
    diagonals := self isWhite
        ifTrue: [ { square up left. square up right } ]
        ifFalse: [ { square down left. square down right } ].
    
    ^ ({ oneSquare. twoSquares } select: [ :s |
        s notNil and: [ s hasPiece not ] ])
        , (diagonals select: [ :s |
            s notNil and: [
                s hasPiece and: [ s contents color ~= color ] ] ])
]
