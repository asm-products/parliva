Meteor.methods do
	getKandyData: ->
		console.log Meteor.user!.kandyData
		Meteor.user!.kandyData
