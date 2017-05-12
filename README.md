
# Storify
[![Code Climate](https://codeclimate.com/github/shivabhusal/storify/badges/gpa.svg)](https://codeclimate.com/github/shivabhusal/storify)
[![Test Coverage](https://codeclimate.com/github/shivabhusal/storify/badges/coverage.svg)](https://codeclimate.com/github/shivabhusal/storify/coverage)
[![Issue Count](https://codeclimate.com/github/shivabhusal/storify/badges/issue_count.svg)](https://codeclimate.com/github/shivabhusal/storify)
[![CircleCI](https://circleci.com/gh/shivabhusal/storify.svg?style=svg)](https://circleci.com/gh/shivabhusal/storify)
## Tech Stack
- Ruby Version: `2.3.1p112`
- Rails Version: `5.0.1`
- PostGreSQL: ` 9.5.5`
- Solr Engine
- Puma as App-server
- Nginx as Webserver

## Installation
### In Production
- Install Solr in `Ubuntu`
    - using lates Java runtime for `solr`
        - `$ sudo apt-get install openjdk-8-jre`
    - Install Tomcat & Solr (You can’t avoid this one)
        - `$ sudo apt-get install solr-tomcat`
    - start tomcat server
        - `$ sudo /etc/init.d/tomcat7 start`
        - `[ ok ] Starting tomcat7 (via systemctl): tomcat7.service.`
    - Ok it is done !
        - Solr server responds at `http://localhost:8080/solr`
        - and the config & index will be stored at : `/usr/share/solr/`
    - [see this for more information](https://github.com/sunspot/sunspot/wiki/Configure-Solr-on-Ubuntu,-the-quickest-way)
- Deployment
    - Capistrano script is all set and ready
    - tweak according to your need; may be details like `server IP`, `deploy branch`. etc
    - `cap production deploy IP=xx.85.xx.104`

Note: Make sure the `solr` instance is up and running for every operations like `db:reset`, `db:seed`, or running application.

## System Overview
You can find the [Enhanced Entity Relationship Diagram(ERD)](erd.pdf) here. 
## Declaration
Storify uses [Authy 2Factor Authentication](https://www.authy.com/)'s Onetouch and Softtoken scheme to authentication crutial events like payment verifications. It uses the [authy-ruby gem](https://github.com/authy/authy-ruby).

It also uses `Rails DB`, so that you can view records in production and other environment.
[http://localhost:3000/rails/db](http://localhost:3000/rails/db)

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
