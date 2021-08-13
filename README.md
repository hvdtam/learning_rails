# Project

I'm learning Rails on GoRails.com

## Install

### Clone the repository

```shell
git clone git@github.com:hvdtam/learning_rails.git
cd learning_rails
```

### Application version

```shell
Ruby 2.6.3
Rails 6.1.4
Bootstrap 4.6.0
Jquery
Coffee
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle install && yarn install
```

### Initialize the database

```shell
rake db:migrate
```

## Serve

```shell
rails s
```
## FEATURES
### User (Devise)
- Sign in
- Sign up
- RBAC
### Import
- Import Excel using Form
- Export Excel
### Blog
- CRUD
- Comment
### Chat rooms
- Create Room
- Direct Messages
### Roles
- CRUD Role
### Rails
- Reduces boot times through caching
### Background Job
- Sidekiq