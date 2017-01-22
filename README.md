
# Storify
[![Code Climate](https://codeclimate.com/github/shivabhusal/storify/badges/gpa.svg)](https://codeclimate.com/github/shivabhusal/storify)
[![Test Coverage](https://codeclimate.com/github/shivabhusal/storify/badges/coverage.svg)](https://codeclimate.com/github/shivabhusal/storify/coverage)
[![Issue Count](https://codeclimate.com/github/shivabhusal/storify/badges/issue_count.svg)](https://codeclimate.com/github/shivabhusal/storify)
[![CircleCI](https://circleci.com/gh/shivabhusal/storify.svg?style=svg)](https://circleci.com/gh/shivabhusal/storify)
## Tech Stack
- Ruby Version: `2.3.1p112`
- Rails Version: `5.0.1`
- PostGreSQL: ` 9.5.5`
## Installation
 [TODO] to be updated soon
 
Note: Make sure the `solr` instance is up and running for every operations like `db:reset`, `db:seed`, or running application.
## Hacks
If you wish to do the following jobs with single command then see below 
  - Droping DB
  - Creating DB
  - Migration
  - Seed

#### Solution:
execute this command
```bash
$ echo "alias hard_reset_db='rails db:drop && rake db:create && rake db:migrate && rake db:reset'"  >> ~/.bash_aliases
```

or open the file `~/.bash_aliases` and put the following content.
```bash
alias hard_reset='(echo "Dropping DB ..")&&(rails db:drop) && (rake db:create) && (rake db:migrate) && (echo "Seeding..")&&(rake db:seed)&&(echo "Done!")'

```
This will update your system's alias list. Now whenever you wish you can use it like
```bash
$ hard_reset_db
```
## Contribute
### Bug fixes

- Fix the issue in a branch of your own fork of Storify.
- Rebase your branch to include the latest changes from master. We do not accept pull requests with merge commits.
- Open a pull request from your fork to master.
- Make sure all the tests pass.
- Update CHANGELOG.md

## Architecture

<img src="./doc/initial_architecture.png" alt="Drawing" style="width: 200px;"/>
<img src="./doc/schema.png" alt="Drawing" style="width: 200px;"/>

## Release
See RELEASE.md for information about how to make a new release.
## Translation
As of now, Storify is only available in English.
## Known issues
- No known issues for now.
## Documentation
Please refer the wiki page for documentations.

## License

Storify is open source under the MIT license. See [LICENSE](LICENSE) for details.
