
Meteor.publish 'portraits', ->
	Portraits.find()

Meteor.publish 'users', ->
	Meteor.users.find({}, {fields: {"emails": 1, "profile": 1, "username": 1} })

Meteor.publish 'consultors', ->
	Meteor.users.find {
		'profile.isConsultor': true
		'profile.ratePerSession': {$gt: 0}
	}, {
		fields: {"emails": 1, "profile": 1, "username": 1} 
	}

Meteor.publish 'chat_messages', (userId) ->
	Messages.find do
		roomUserIds: 
			$all: [@userId, userId]

Meteor.publish 'messages', ->
	Messages.find {
		senderId: 
			$ne: @userId
	}, {
		sort: {date: -1} 
	}
		
			
Meteor.publish 'chat_partners', (userId) ->
	Meteor.users.find({_id:userId}, {fields: {"emails": 1, "profile": 1, "username": 1} })

Meteor.publish 'chat', (contactId, limit) ->
	if contactId
		Messages.find {userIds: {$all:[@userId, contactId]}}, {limit:limit}