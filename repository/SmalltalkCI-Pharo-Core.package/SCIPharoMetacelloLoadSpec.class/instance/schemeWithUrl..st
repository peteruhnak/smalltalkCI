accessing
schemeWithUrl: aLocation
	| scheme |
	scheme := (self isTonel: aLocation)
		ifTrue: [ 'tonel://' ]
		ifFalse: [ 'filetree://' ].
	^ scheme , aLocation