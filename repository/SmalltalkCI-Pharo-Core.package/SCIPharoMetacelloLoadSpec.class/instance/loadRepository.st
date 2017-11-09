executing
loadRepository
	^ self repository
		ifNil: [ self
				schemeWithUrl: SmalltalkCI projectDirectory , SmalltalkCI pathNameDelimiter , self directory ]