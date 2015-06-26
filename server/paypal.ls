Meteor.methods do
	pay: (userId) ->
		user = Meteor.users.findOne(userId)
		if user && user.profile && user.profile.paypalEmail && user.profile.ratePerSession > 0
			amount = user.profile.ratePerSession
			paidToParliva = amount * Meteor.settings.PARLIVA_FEE_PERCENTAGE
			paidToUser = amount - paidToParliva
			
			res = HTTP.call "POST", Meteor.settings.PAYPAL_ENDPOINT, do
				headers:
					# Sandbox API credentials for the API Caller account
					"X-PAYPAL-SECURITY-USERID" : Meteor.settings.PAYPAL_SECURITY_USERID
					"X-PAYPAL-SECURITY-PASSWORD" : Meteor.settings.PAYPAL_SECURITY_PASSWORD
					"X-PAYPAL-SECURITY-SIGNATURE" : Meteor.settings.PAYPAL_SECURITY_SIGNATURE

					# Global Sandbox Application ID
					"X-PAYPAL-APPLICATION-ID" : "APP-80W284485P519543T"

					# Input and output formats
					"X-PAYPAL-REQUEST-DATA-FORMAT" : "JSON"
					"X-PAYPAL-RESPONSE-DATA-FORMAT" : "JSON"

				data:
					"actionType":"PAY"   
					"currencyCode":"USD"
					"applicationId": "APP-80W284485P519543T"
					# "feesPayer": "EACHRECEIVER"
					# "memo": "Example"
					# "ipAddress": "127.0.0.1"
					"receiverList":
						"receiver":[
							{
								"amount": amount
								"email": "parliva@gmail.com"
								"primary": true
							}
							{
								"amount": paidToUser
								"email": user.profile.paypalEmail
								"primary": false
							}
						]
					"returnUrl": "http://parliva.com/paypal/success"
					"cancelUrl": "http://parliva.com/paypal/cancel"
					"requestEnvelope":
						"errorLanguage":"en_US"
						"detailLevel":"ReturnAll"
			
			console.debug res
			payKey = res.data.payKey
			if payKey
				return "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_ap-payment&paykey=#payKey"
			else
				return false
		else
			return false