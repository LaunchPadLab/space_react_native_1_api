<!-- If you created this project, instructions for setting up GitHub, Heroku, and other integrations can be found in the **[Project Setup Checklist](PROJECT_SETUP_CHECKLIST.md)**. -->
<!-- # <app_name> -->

## Useful Links
<!-- add any quicklinks useful to the project -->
- [Heroku Pipeline]()
- [Sentry]()
<!-- [Documentation](link) -->

## Getting Started
### Prerequisites
<!-- TODO: update the below accordingly -->
+ Ruby ~> 3.3.3
+ Rails ~> 7.1.3
+ Postgres

### Setting Up
<!-- TODO: update the below accordingly -->
- `git clone git@github.com:LaunchPadLab/<project_name>.git`
- `cd <project_name>`
- `bundle install`
- `load_secrets`
- `bundle exec rake db:create db:migrate db:seed` or `bin/setup`

### Running in Development
<!-- TODO: update the below accordingly -->
- `rails server` or `bin/dev`
- `open localhost:3000`

If background workers are needed:
- `redis-server`
- `bundle exec sidekiq`

<!--
  TODO: Additional notes about your app
This application supports both server rendering and client rendering of react components from within `ERB` templates.
Starting the application with `foreman start -f Profile.dev` starts the rails server as well as the webpack-dev-server that will rebuild the javascript assets on change.
It's possible that a page refresh completes BEFORE webpack finishes, just refresh again or check the log to make sure the rebuild has completed if you don't see your changes right away.
If this becomes an issue we can revisit to either optimize the build or add HMR.
 -->
### Development Workflow

#### Pull Requests
Pull requests to the `dev` branch will trigger review apps in Heroku.

This repo contains a template for Pull Request (PR) descriptions to help you to give easy and consistent instructions and context to a Code Reviewer and QA Reviewer.
More information on PR best practices for both Authors and Reviewers are included in the [LPL Pull Request Guidelines](https://github.com/LaunchPadLab/opex-public/blob/master/gists/pull-request-guidelines.md).

#### Committing

- The `dev` branch will auto-deploy to the _dev_ environment on Heroku
- The `staging` branch will auto-deploy to the _staging_ environment on Heroku
- The `main` branch can then be deployed manually to _production_ after successful QA

Additionally, this codebase uses [`overcommit`](https://github.com/sds/overcommit) to automatically run git hooks:

- linting (rubocop) on pre-commit

#### Testing
All Ruby/Rails unit tests must pass for a PR to be merged. They can be run locally with:

- Ruby/Rails unit tests: `bundle exec rspec`

End-to-end testing is set up using [cypress-on-rails](https://github.com/shakacode/cypress-on-rails). To run the tests, make sure your local server is active. Then, in a new terminal window, use one of the following commands:

To launch the Cypress Test Runner: `yarn cypress open --project ./e2e`
To run Cypress tests in headless mode: `yarn run cypress run --project ./e2e`

#### Linting
The project is set up to lint ruby, <!-- javascript and scss (`TODO`) --> so it's advised that you have this integrated in your editor.
Currently, linting errors will not block a PR merge, but this may change in the future.

You can run these manually with:
- Ruby: `rubocop` (if installed globally with `gem install rubocop`)
<!-- + JavaScript: `npm run eslint` -->
