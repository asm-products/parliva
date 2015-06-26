angular.module('parliva').factory 'plCategories', ->
	# Will be persisted on the DB later
	categories = [
		{
			key: 'health',
			label: "Health"
		}
		{
			key: 'software',
			label: "Software"
		}
		{
			key: 'other',
			label: "Other"
		}
	]

	{
		get: -> categories
	}