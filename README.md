# Video-On-Demand Project

##### Set-up
  * Clone the Repository 
  * Go to project directory
  * Run `rake db:create`, `rake db:migrate`, `rake db:seed`
  * The command above will create sample data into the dev db to test the APIs
  * Run `rails server` to strat the server.

##### API testing
  * Use the Postman Collect to test the following APIs
    ```
    Prefix Verb URI Pattern                   Controller#Action
                movies GET  /movies(.:format)             shows#movies
               seasons GET  /seasons(.:format)            shows#seasons
    movies_and_seasons GET  /movies-and-seasons(.:format) shows#movies_and_seasons
              purchase POST /purchase(.:format)           shows#purchase
               library GET  /library(.:format)            shows#user_library

    ```
  * PostMan Collection Link: https://documenter.getpostman.com/view/8941127/SWT5hLTc?version=latest

##### Unit Testing
  * Run `rake test COVERAGE=true`
  * This command will run the unit test and provide the following code coverage:
    ```
      # Running:

      .......................

      Finished in 0.467887s, 49.1572 runs/s, 83.3535 assertions/s.
      23 runs, 39 assertions, 0 failures, 0 errors, 0 skips
      Coverage report generated for MiniTest to /Users/gaurav.malik/RubymineProjects/vod_project/coverage. 126 / 126 LOC    (100.0%) covered.
    ```
  * Image from Last run (You can find your run in /coverage/index.html)
  ![Coverage](/public/coverage.png)
