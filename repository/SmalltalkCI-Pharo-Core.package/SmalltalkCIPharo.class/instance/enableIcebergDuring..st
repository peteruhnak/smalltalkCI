private
enableIcebergDuring: aBlock
	| integrationEnabled |
	self class environment
		at: #Iceberg
		ifPresent: [ :iceberg |
			integrationEnabled := iceberg enableMetacelloIntegration.
			iceberg enableMetacelloIntegration: true ].
	aBlock ensure: [
		self class environment
			at: #Iceberg
			ifPresent: [ :iceberg |iceberg enableMetacelloIntegration: integrationEnabled ] ]