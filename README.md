# Surveyor

[![Code Climate](https://codeclimate.com/github/SurveyorTeam/Surveyor/badges/gpa.svg)](https://codeclimate.com/github/SurveyorTeam/Surveyor)

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Devise Setup

Some setup you must do manually if you haven't yet:

1. In production, :host should be set to the actual host of your application. Ensure you have defined default url options in your environments files. Here is an example of default_url_options appropriate for a development environment in config/environments/development.rb:

    ```ruby
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    ```

2. Ensure you have defined root_url to *something* in your config/routes.rb. For example:

    ```ruby
    root to: "home#index"
    ```

3. Ensure you have flash messages in app/views/layouts/application.html.erb. For example:

    ```erb
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
    ```

4. On config/application.rb forcing your application to not access the DB or load models when precompiling your assets. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

    ```ruby
    config.assets.initialize_on_precompile = false
    ```

5. You can copy Devise views (for customization) to your app by running:

    ```ruby
    rails g devise:views
    ```
