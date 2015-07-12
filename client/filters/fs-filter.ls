angular.module('angularMeteor').filter 'fsUrl', ->
	(fileId, collection) ->
		if fileId
			window[collection].findOne(fileId).url(brokenIsFine:true)
		else
			fileId
