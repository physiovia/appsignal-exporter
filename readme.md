# Appsignal Exporter

A little tool we wrote to export errors from our [AppSignal](https://appsignal.com) apps for record keeping. It reads and dumps errors as JSON files – no more, no less. We might add additional exports and options if we need them (or if you're a great person and provide pull requests that we can use).

Note that the gem doesn't have tests or any particular error handling. Use it at your own risk. ;-)

## Installation

Add the gem to your Gemfile (`gem 'appsignal-exporter'`) and run `bundle install`.

## Usage

The AppSignal API key (`APPSIGNAL_API_KEY` – found in [your personal settings](https://appsignal.com/users/edit)) and app ID (`APPSIGNAL_APP_ID` – found in the app's URL on the AppSignal dashboard) need to be passed as environment variables. You can use the [dotenv gem](https://github.com/bkeepers/dotenv) if you like.

Then run it:

`bundle exec appsignal-exporter`

Optionally pass parameters as defined in the [API docs](https://docs.appsignal.com/api/samples.html):

`bundle exec appsignal-exporter since=2017-06-01 before=2017-07-01`

## Credits

(c) 2017-2019 Temedica GmbH
