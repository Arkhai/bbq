# BBQ-everyday

## Demo

[bbq-everyday.ru](https://bbq-everyday.ru)

## Description

BBQ-everyday is an application for event management. One can create events for all users or with restricted access (pin-code access), edit and delete events, which were created by him.

Every event has description with Yandex.map point, possibility to comment event, attach photos to event, subscribe on new photos and comments. Subscribers receive e-mails about every comment and photo, which were added by other person.

One can authentificate to the application by e-mail, Vkontakte or Facebook.

Application language is Russian.

Implemented in Ruby 2.7.3, Rails 6.1.4.


## Launching

* Download or clone repo
```
git clone git@github.com:Arkhai/bbq.git
```

* Install gems

```
bundle install
```

* Install nodejs dependences

```
yarn
```

* Create database and run migrations

```
rails db:create db:migrate
```
* Create credentials as in the description below


* Start server 
```
rails s
```

* Open web-page

[http://localhost:3000/](http://localhost:3000/)



## Credentials

* Create credentials as in example in .env file
```
S3_ACCESS_KEY=<value>
S3_SECRET_KEY=<value>
S3_REGION=<value>
S3_BUCKET_NAME=<value>
YANDEX_MAP=<value>
MAILJET_API_KEY=<value>
MAILJET_SECRET_KEY=<value>
MAILJET_SENDER=<value>
```

* Create credentials as in example in secrets.yaml file
```
production:
    secret_key_base=<value>
    omniauth_facebook_id=<value>
    omniauth_facebook_secret=<value>
    omniauth_vkontakte_id=<value>
    omniauth_vkontakte_secret=<value>
```
To create the bunch of credentials one would need to visit:
* [Facebook for developers](https://developers.facebook.com/)
* [Vkontakte for developers](https://dev.vk.com/)
* [Amazon S3](https://aws.amazon.com/)
* [Yandex map](https://yandex.ru/dev/maps/?p=realty)
* [Mailjet](https://www.mailjet.com/)