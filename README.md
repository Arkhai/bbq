_**````# BBQ-everyday

## Description

BBQ-everyday is an application for event management. One can create events for all users or with restricted access (pin-code access), edit and delete events, which were created by him.

Every event has description with Yandex.map point, possibility to comment event, attach photos to event, subscribe on new photos and comments. Subscribers receive e-mails about every comment and photo, which were added by other person.

One can authentificate to the application by e-mail, Vkontakte or Facebook.

Application language is Russian.

Implemented in Ruby 2.7.3, Rails 6.1.4.

## Demo

https://bbq-everyday.ru

## Launching

* Download or clone repo

* Create credentials as in example
```azure
S3_ACCESS_KEY='SGJHRADGJHCEUV'
S3_SECRET_KEY='6546DZGDR5HD4HR5F'
S3_REGION='eu-north-1'
S3_BUCKET_NAME='bbq-everyday-bucket'
export YANDEX_MAP='6464HEDHR4TDFH5D5T'
export MAILJET_API_KEY='ZTG5GT45H4TYF5XK4JF5Y'
export MAILJET_SECRET_KEY='g5xjg5fxn4f5hbfd'
export MAILJET_SENDER='name@bbq-everyday.ru'
```

* Use bundler

```
bundle install
```

* Create database

```
rails db:create
```

* Run database migrations

```
rails db:migrate
```_**
````