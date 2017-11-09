testing
isTonel: aLocation
	Smalltalk globals
		at: #IceRepositoryProperties
		ifPresent: [ :class | 
			| ref |
			ref := aLocation asFileReference / class propertiesFileName.
			ref exists
				ifFalse: [ ^ false ].
			(STON fromStream: ref readStream) at: #format ifPresent: [ :value | ^ value = #tonel ] ].
	^ false