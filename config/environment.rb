# Load the rails application
require File.expand_path('../application', __FILE__)

# XXX - Require an old broken yaml parser so that Rails will read its config files.
# More info here: http://pivotallabs.com/users/mkocher/blog/articles/1692-yaml-psych-and-ruby-1-9-2-p180-here-there-be-dragons
require 'yaml'
YAML::ENGINE.yamler = 'syck'

# Initialize the rails application
Angola::Application.initialize!
