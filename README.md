Setup on Computer

1. Make sure Ruby 2.6.4 is installed on your computer
2. Make sure postgresql is installed on your computer
3. Make sure yarn is installed on your computer


```
gem install bundler
bundle install
yarn install
rails db:create db:setup db:seed
```

Setup using Docker

If don't want to install a bunch of software on your computer, you can also develop using Docker

1. Make sure Docker for Desktop is installed on your computer

```
docker-compose build
docker-compose run --rm web rails db:create db:migrate db:seed
docker-compose up
```
