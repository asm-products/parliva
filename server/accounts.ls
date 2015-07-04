usernameRegex = new RegExp("^[a-zA-Z0-9]+$")

validateUserFunc = (user) ->
	if usernameRegex.test(user.username)
		return true
	throw new Meteor.Error(403, "passwordRegexValidation")

Accounts.validateNewUser validateUserFunc
