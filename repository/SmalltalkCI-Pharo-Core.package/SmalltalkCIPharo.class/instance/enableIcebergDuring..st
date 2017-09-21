private
enableIcebergDuring: aBlock
	| integrationEnabled remoteTypeSelector |
	self class environment
		at: #Iceberg
		ifPresent: [ :iceberg | 
			integrationEnabled := iceberg enableMetacelloIntegration.
			remoteTypeSelector := iceberg remoteTypeSelector.
			iceberg enableMetacelloIntegration: true.
			iceberg remoteTypeSelector: #httpsUrl ].
	aBlock
		ensure: [ self class environment
				at: #Iceberg
				ifPresent: [ :iceberg | 
					iceberg enableMetacelloIntegration: integrationEnabled.
					iceberg remoteTypeSelector: remoteTypeSelector ] ]