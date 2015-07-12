# Exampels

# Meteor.publish 'portraits', ->
# 	Portraits.find()

# Meteor.publish 'messages', ->
# 	Messages.find {
# 		senderId: 
# 			$ne: @userId
# 	}, {
# 		sort: {date: -1} 
# 	}

# Meteor.publish 'users', ->
# 	Meteor.users.find({}, {fields: {"emails": 1, "profile": 1, "username": 1} })
