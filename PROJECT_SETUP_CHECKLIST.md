# Project Setup Checklist
Checklist for setting up the Github repository, Heroku, and other integrations when starting a new project.

This checklist assumes that the new repo was created using `rails_template`.

## GitHub
- [ ] Create a new repo in GitHub under the LaunchPad organization (do not initialize with a README)
- [ ] Add the repo as origin (following [GitHub's instructions](https://help.github.com/en/articles/adding-a-remote)) and push the initial commit from the template

### Security
- [ ] Under "Settings" for the repo navigate to "Code security and analysis":
  - [ ] Disable "Dependabot security updates" to prevent Dependabot from opening PRs (can leave "Dependabot alerts" to see the warnings for security vulnerabilities)
    - This is recommended to encourage a more intentional focus on resolving security alerts

### Settings

#### Options
  - [ ] Default to squash and merge behavior: Uncheck "allow merge commits" and "allow rebase merging"
  - [ ] Check "automatically delete head branches"

#### Branches
  - [ ] Set up `main`, `staging`, and `dev` branches
  - [ ] Set default branch to `dev`
  - [ ] Protect `main`, `staging`, and `dev` branches:
    - [ ] Require pull request reviews before merging
    - [ ] Require status checks to pass before merging
    - [ ] Require branches to be up to date before merging

#### Collaborators
  - [ ] Grant the `LPL` team write access to the repository
  - [ ] Grant your project team admin access to the repository

## Integrations

### Sentry
  - [ ] Sentry is a platform that provides error and performance monitoring. See the [Sentry configuration documentation](https://www.notion.so/launchpadlab/Adding-a-Project-to-Sentry-0750dbc7fd854e5d9ff49515f8c19f7e) to configure Sentry for your project.

### Travis
  - [ ] Confirm that repo has been added to [Travis CI](https://travis-ci.com/)
  - [ ] Add any required env vars to travis (as defined in `figaro.rb` initializer)
  - [ ] Under "More Options" > "Settings", **uncheck** "Build pushed pull requests" (leave "Build pushed branches" checked)

### Asana
  - [ ] Follow the [instructions from Asana](https://asana.com/guide/help/api/github) to add the GitHub app to your project
  - [ ] Complete steps 1 and 2 in the [Usage section](https://github.com/Asana/create-app-attachment-github-action#usage) of the GitHub Actions documentation to generate and set your repo's secret token
  - [ ] Optional: The workflow files already exist in your new repo, but feel free to modify them. If you'd like to take advantage of the Ready for Review comment, make sure your repo has an "internal review" label available to avoid duplicate comments on review re-requests.

## Heroku

### Create New Pipeline
  - [ ] Create pipeline
  - [ ] Add `<APP_NAME>-dev` app to pipeline in `development` stage (creating this stage requires an [extra step](https://devcenter.heroku.com/articles/pipelines#i-don-t-see-a-development-stage-how-do-i-add-a-development-app))
    - [ ] Set to automatically deploy on push to `dev` branch
  - [ ] Add `<APP_NAME>-staging` environment app to pipeline
    - [ ] Set `staging` to automatically deploy on push to `staging`
  - [ ] Add `<APP_NAME>-production` environment app to pipeline `production` stage

  - [ ] Optional: Add remotes to local (`git remote add dev <https:…>`)

### Review Apps
- [ ] Enable Review Apps for pipeline
- [ ] Opt to destroy stale review apps after 5 days
- [ ] Under "Configure" > "More settings":
  - [ ] Update the [url pattern](https://devcenter.heroku.com/articles/github-integration-review-apps#selecting-the-url-pattern) to be predictable using the app (pipeline) name as the unique identifier
  - [ ] Add required environment variables from the `app.json` that do not have values provided

### Add-ons
  - [ ] Add [New Relic](https://elements.heroku.com/addons/newrelic) add-on to staging and production apps
  - [ ] Add [Papertrail](https://elements.heroku.com/addons/papertrail) add-on to staging and production apps

### Access
  - [ ] Add admins and collaborators to Heroku pipeline as needed

### Settings
  - [ ] Add config vars from `application.yml` to each environment app (`figaro` provides [built-in functionality](https://github.com/laserlemon/figaro#heroku) for this)
