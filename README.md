Myfreecomm - Desafio de Programação I
=====================================

Project Overview
----------------

This is a sample rails application, which uses devise for authentication, multipart ajax for file upload and mysql as database. It's styled by bootstrap-sass.
This application goal is to provide a form which the user will provide a file with a pre-defined format, then after the form submission, this application is going to parse the file data, and if it could be normalized the application is going to store the data on a custom table.


Configuration Step  
-------------------

0.1. - Make sure you have `Ruby 2.0.0` or above installed.
0.2.- Make sure you have a `MySQL / MariaDB` instance running.
0.3. - This application assumes a standard instalation of ` MySQL / MariaDB ` so it is configured for a `root` user with `blank password`. If your database instance has another `user / password / host` please configure it at: `config/database.yml`  


1. Clone this repository: `git clone git@github.com:antoniosb/desafio-programacao-1.git`
2. From the root folder of the application run: `bundle install`
3. After the bundle suceeds, run: `rake db:create`, `rake db:migrate` and then `rake db:test:prepare` 
4. Run the application with `rails server`  
  
5. You can run the specs with: `rspec spec` 