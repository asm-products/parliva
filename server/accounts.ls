usernameRegex = new RegExp("^[a-zA-Z0-9]+$")

validateUserFunc = (user) ->
	if usernameRegex.test(user.username)
		return true
	throw new Meteor.Error(403, "passwordRegexValidation")

Accounts.validateNewUser validateUserFunc

Accounts.onCreateUser (options, user) ->
	if validateUserFunc user
		ret = HTTP.call 'POST', 'https://api.kandy.io/v1.2/domains/users/user_id?key='+Meteor.settings.PARLIVA_KANDY_ACCESS_TOKEN, data: {"user_id": user.username}
		if ret.data.status == 0
			user.kandyData = ret.data.result
			return user
		else
			console.error ret 
	user