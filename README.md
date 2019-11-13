# Setup on your computer

1. Make sure Ruby 2.6.4 is installed on your computer
2. Make sure postgresql is installed on your computer
3. Make sure yarn is installed on your computer

4. Clone this repo on your local computer

5. Run the following commands to install the app
```
gem install bundler
bundle install
yarn install
rails db:create db:setup db:seed
```

6. Run `rails s` and visit the site on http://localhost:3000


# Setup using Docker

If you don't want to install a bunch of software on your computer, you can also develop using Docker

1. Make sure Docker for Desktop is installed on your computer

2. Clone this repo on your local computer

3. Run the following commands to install the app

```
docker-compose build
docker-compose run --rm web rails db:create db:migrate db:seed
```

4. Run `docker-compose up` and visit the site on http://localhost:3000


# Tasks:

### Task 1: Event fix
There is a path '/events.json' that will query all events and respond with JSON array. Right now, it's broken. You can run `rails test` OR `docker-compose run --rm web rails test` to see the JSON is returning an empty array.  This will need to be fixed in order to continue with the additional tasks.

### Task 2: Build a Form
We create a lot of info forms for our company. You can see an example of one of our forms here:(https://playerspremium.com/ticket-packages). We're currently working with grandprixevents to build a sliding form. You can see an example of their sliding form here: (https://www.grandprixevents.com/abu-dhabi-grand-prix/hospitality-vip/... On the left side, if you click the 'Enquires' button, a form will appear).

This application has a home page, with one button and one incomplete div. The button and the div are being loaded by a Vue component.

The main goal of this tasks is to create a functioning form using Rails and Vue.

#### Expectation 1: The form can slide
When I visit the page, the form should not appear. After clicking a button, the form should slide onto the screen.

#### Expectation 2: The form can successfully submit and save to the database
When I click a submission button, the form should submit information to our application, and then save the form to our database.

A form will need a name. If there is no name, the form will fail to save.  

A form will need an event_id.  If there is no event_id, the form will fail to save. The event_id must also match an event in the database.

### Additional info
There are no additional requirements beyond Expectation 1 and Expectation 2.  The task is a semi-open ended so you can choose things like styles and structure.

# Submission:
Create a new branch.

Complete the tasks listed and push your branch to GitLab.  

When you are finished making changes, create a merge request.
