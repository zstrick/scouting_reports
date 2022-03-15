# Scouting Reports

Scouting reports is a baseball scouting report application that allows a user to create reports for pitchers and position players.

## Getting Started
#### Requirements

You'll need the following installed to run the application successfully:

* Ruby 3.0 or higher
* bundler - `gem install bundler`
* Yarn - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)

#### Initial Setup

Install the application with:

    $bundle install

Seed development DB with data by running:

    $rake db:seed

 Run the test suite with:

    $bin/rspec

#### Running the application

To start the server:

    $rails server

Open app in the browser at URI http://localhost:3000

## Discussion

To model reports, I used a newer Rails feature that was introduced in Rails 6 called `Delegated Types`. Delegated Types provides an alternative to Single Table Inheritance for modeling inheritance in Rails. It allows for the `reports` table to hold the shared data that `position_reports` and `pitcher_reports` have in common and allows the child models to have their own DB tables with their specific data attributes. This way there will not be a large shared table with many `null` values as there would be when using STI.

For more information on Delegated Types:

https://api.rubyonrails.org/classes/ActiveRecord/DelegatedType.html


For adding pitches on the fly in the pitcher report, I used Stimulus.js and wired up the `Add Pitch` button to a Stimulus controller called `javascript/controllers/nested_form_controller.js`.

For more information on Stimulus.js:

https://stimulus.hotwired.dev/


If I had more time, I would find a more elegant way to handle creating a new report in the UI. The way it is now, there are two buttons `Create Pitcher Report` and `Create Position Report`. The links for the buttons pass a query param for the report type to the reports controller to determine which report form to render.

Ideally, there would be one `Create Report` button and the correct report form fields could be generated dynamically with Javascript based on the report type select field.

I would also make the UI design look better and use Hotwire and Stimulus.js to improve the views with things like inline editing, autocomplete search fields, etc

