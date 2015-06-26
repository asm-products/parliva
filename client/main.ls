Router.options.autoStart = false


AccountsEntry.config do
	passwordSignupFields: 'USERNAME_AND_OPTIONAL_EMAIL'

Accounts.ui.config do
	passwordSignupFields: "USERNAME_AND_EMAIL"

Meteor.subscribe('portraits')

T9n.map "en", do
	passwordRegexValidation: "Username should only contain letters and numbers."