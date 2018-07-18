# bank-app

> Bank Application with Rails 5 + haml + API + Revealing Pattern + Command Pattern

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General info
It's a simple banking application written in Rails 5 from scratch where a user can perform withdrawals and deposit transactions. The purpose is to document the current practices in terms of organizing javascript, api code (Rails) and command patterns for business rules.

## Screenshots
![Example screenshot](./img/screenshot.png)

## Technologies
* Ruby on Rails 5
* HAML
* jQuery
* Sqlite

## Setup

 ```
 git clone https://github.com/lapinskap/bank-app
 cd bank-app
 bundle install
 rails s
 ```
 
 Add a client:
 ```
 rails console
 Client.create!(first_name: "Juan", middle_name: "Pablo", last_name: "Fernandez", client_number: "42034823") 
 client = Client.last
 exit
 ```
 > Rails model will change clients name to uppercase 
 
 Create Bank Account:
 ```
 rails console
 BankAccount.create!(client: client, account_number: "000000001")
 exit
 ```
> `client: client` <- client name defined while creating a client

> default balance is $0.00

## Code Examples
#### HAML example
```html
<div class="container">
 <div class="row">
  <div class="col-md-12"></div>
 </div>
</div>

%div.container
 %div.row
  %div.col-md-12

.container
 .row
  .col-md-12
```

## Features
List of features ready and TODOs for future development
* Awesome feature 1
* Awesome feature 2
* Awesome feature 3

To-do list:
* Wow improvement to be done 1
* Wow improvement to be done 2

## Status
Project is: _in progress_

## Inspiration
Project inspired by devlogs youtube videos

## Contact
Created by [@lapinskap](https://www.facebook.com/paulina.lapinska99) - feel free to contact me!
