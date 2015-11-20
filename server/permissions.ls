# Examples

# Messages.allow do
# 	insert: (userId, doc) -> 
# 		doc.senderId = userId
# 		doc.date = new Date()
# 		true
# 	update: -> false
# 	remove: -> false
# Messages.before.update (userId, doc, fieldNames, modifier, options) ->
# 	modifier.$set = modifier.$set || {};
# 	modifier.$set.updated = Date.now();

# Portraits.allow do
# 	download: (userId, fileObj) -> true
# 	insert: (userId, doc) -> true
# 	update: -> true
# 	remove: -> true
