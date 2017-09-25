executing
loadRepositoryFor: aSmalltalkCI
	^ self repository
		ifNil: [ 'gitlocal://', aSmalltalkCI projectDirectory, SmalltalkCI pathNameDelimiter, self directory ]