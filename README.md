# Parliva
Platforms for freelancers to sell their services per session or per hour, via video calls.

## Technologies used
* Angular
* Meteor
* Livescript (It's like coffescript, but more functional and has lots of extra features)


## Contributor's guide

* Install Meteor ( https://www.meteor.com/ )
* Install Livescript ( http://livescript.net/ )
* Install node & npm ( https://nodejs.org/ )
* Clone this repo
* Create a dev-conf.json in the root of your project (this will be ignored by git), here's an example:


```
{
	"PAYPAL_ENDPOINT" : "https://svcs.sandbox.paypal.com/AdaptivePayments/Pay",
	"PAYPAL_SECURITY_USERID" : "...",
	"PAYPAL_SECURITY_PASSWORD" : "...",
	"PAYPAL_SECURITY_SIGNATURE" : "...",
	"PARLIVA_FEE_PERCENTAGE": 0.1
}
```

To fill the userid, password, and signature: go to https://developer.paypal.com/developer and create a sandbox user.

* Run `meteor --settings dev-conf.json`
* In another terminal window run: `./run_livescript.sh`
* Open [http://localhost:3000](http://localhost:3000)

## Conventions
* We use Livescript (unless you really really **really** need to use JavaScript)
* We put our views, the scripts and the stylesheets related to the view in the same folder.
* We use the tab character instead of spaces (you can configure the tab size you like on your favorite code editor)

We are open to suggestions to have more and better conventions :)

## Tips

Sublime Text ( [http://www.sublimetext.com/](http://www.sublimetext.com/) ) will make your life easier. You can open the file project.sublime-project in sublime, this has the recommended way to work on this project. It will ignore the "ls-compiled" and the ".meteor" folders. However, you're free to configure your favorite editor to work on this project. :)