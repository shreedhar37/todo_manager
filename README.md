# Todo-Manager
##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.2](https://github.com/shreedhar37/todo_manager/blob/master/.ruby-version)
- Rails [6.1.3](https://github.com/shreedhar37/todo_manager/blob/master/Gemfile)

##### 1. Check out the repository

```bash
git clone git@github.com:shreedhar37/todo_manager
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

## Authors

- [@shreedhar37](https://github.com/shreedhar37)


## Screenshots

https://github.com/shreedhar37/todo_manager/tree/master/working-snapshots

## Demo

https://shreedhar-todomanager-saas-201.herokuapp.com/

Username : sampletest@gmail.com

Password : sampletest

## Deployment

To deploy this project run


1.Sign up for a Heroku account.

2.Install the Heroku CLI.

3.Ensure that you are able to login via the command line using

    $ heroku login

4.In the directory that contains your Rails application, run the following command to create a Heroku application. You can set any name you like, as long as it contains only letters, numbers and dashes.

    $ heroku create <applicationname>



This command will host your application in <applicationname>.herokuapp.com

It will also add a new remote to your Git configuration, so you can push your code to Heorku.

We are now ready to deploy!

    $ git push heroku master

Your application is now available at <applicationame>.herokuapp.com. Congratulations! 🎉
