// Generated by LiveScript 1.3.1
Router.options.autoStart = false;
AccountsEntry.config({
  passwordSignupFields: 'USERNAME_AND_OPTIONAL_EMAIL'
});
Accounts.ui.config({
  passwordSignupFields: "USERNAME_AND_EMAIL"
});
Meteor.subscribe('portraits');
T9n.map("en", {
  passwordRegexValidation: "Username should only contain letters and numbers."
});