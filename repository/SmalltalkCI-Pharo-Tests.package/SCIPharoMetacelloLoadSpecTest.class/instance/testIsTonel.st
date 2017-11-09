tests
testIsTonel
	| store |
	(store := FileSystem memory / 'project' / 'repository') ensureCreateDirectory.
	self deny: (self spec isTonel: store).
	Smalltalk globals
		at: #IceRepositoryProperties
		ifPresent: [ :class | 
			store / class propertiesFileName
				writeStreamDo: [ :stream | (STONWriter on: stream) nextPut: (Dictionary with: #format -> #tonel) ].
			self assert: (self spec isTonel: store) ]