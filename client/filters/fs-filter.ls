angular.module('parliva').filter 'fsUrl', ->
	(fileId, collection) ->
		if fileId

			window[collection].findOne(fileId).url(brokenIsFine:true)
		else
			fileId
