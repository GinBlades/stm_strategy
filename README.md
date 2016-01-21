# StmStrategy

Shamelessly copied from [Jeremy Green's so_auth gem](https://github.com/jagthedrummer/so_auth). The provider for this version is [StmAuth](https://github.com/GinBlades/stm_auth).

An example project of using this gem is [StmNotes](https://github.com/GinBlades/stm_notes)
project for an example of using this gem.

# Usage
==============

## Add `stm_strategy` to the `Gemfile`

    gem 'stm_strategy'

Run this command

    rails g stm_strategy:install

This will create the `config/initializers/omniauth.rb`

## Create a new application in your Provider instance

Go to the `/oauth/applications` endpoint on the Provider
installation that you want to integrate with.  For development this will
probably be `http://localhost:3000/oauth/applications`.

Create a new application, and set the callback URL to
`http://localhost:3001/auth/stm/callback`. Change the port if you
plan to run your client app on a different port. (See the optional
section below.)

After creating the app make note of the Application Id and the 
Secret.

## Set some environment variables for your client

In your new client project (where you installed this gem), you should
set some secrets.

    development:
        secret_key_base: rakesecret
        auth_provider_url: http://localhost:3000
        auth_provider_application_id: provider_provided
        auth_provider_secret: provider_provided

## Create a `User` model

If you haven't already done it, you should create a `User` model

    rails g model user email

Then be sure to run migrations.

    rake db:migrate

## Update `ApplicationController`

Change your `ApplicationController` to inherit from
`StmStrategy::ApplicationController`. The first line should look like this.

    class ApplicationController < StmStrategy::ApplicationController

## Protect some stuff in a controller

Use a `before_action` to protect some controller actions.

```ruby
before_action :login_required
```





## OPTIONAL : Change the default port of your new project

Since we're relying on `stm_strategy_provider` to provide authentication, we need
to run our new project on a different port in development.  Open up `config/boot.rb`
and add this to the bottom of the file.  If you want to use a port other
than `3001` just change the port as appropriate.

```ruby
# Setting default port to 3001
require 'rails/commands/server'
module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      default_options_alias.merge!(:Port => 3001)
    end    
  end
end
```

Or you could just run your development server on a different port:

```
rails s -p 3001
```

or

```
unicorn -p 3001 -c ./config/unicorn.rb
```

or whatever.

This project rocks and uses MIT-LICENSE.
