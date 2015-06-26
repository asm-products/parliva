Messages.allow do
	insert: (userId, doc) -> 
		doc.senderId = userId
		doc.date = new Date()
		true
	update: -> false
	remove: -> false

Portraits.allow do
	download: (userId, fileObj) -> true
	insert: (userId, doc) -> true
	update: -> true
	remove: -> true