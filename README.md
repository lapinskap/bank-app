# bank-app

>  Ruby on Rails 5 Application with HAML and PostgreSQL

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
Simple banking application written in Rails 5 where a user can perform withdrawals and deposit transactions. The purpose is to document the current practices in terms of organizing javascript, api code (Rails) and command patterns for business rules.

Bank account belongs to a client, a client can have many bank accounts.

I was learning how to create CRUD in Rails.

## Screenshots

![Example screenshot](https://raw.githubusercontent.com/lapinskap/bank-app/master/img/screen4.jpg)

When we click "Add new transaction" a charming Modal appears to our eyes:

![Example screenshot](https://raw.githubusercontent.com/lapinskap/bank-app/master/img/screen2.jpg)

![Example screenshot](https://raw.githubusercontent.com/lapinskap/bank-app/master/img/screen3.jpg)

## Technologies
* Ruby on Rails 5
* HAML
* jQuery
* PostgreSQL database

## Setup

 ```
 $ git clone https://github.com/lapinskap/bank-app
 $ cd bank-app
 $ bundle install
 $ rails s
 ```
 ### Operations in terminal
 
 #### Add a client:
 ```
 $ rails console
 $ Client.create!(first_name: "Juan", middle_name: "Pablo", last_name: "Fernandez", client_number: "42034823") 
 $ client = Client.last
 $ exit
 ```
 > Rails model will change clients name to uppercase letters
 
 #### Create Bank Account:
 ```
 $ rails console
 $ BankAccount.create!(client: client, account_number: "000000001")
 $ exit
 ```
> `client: client` <- client name defined while creating a client

> default balance is $0.00

#### Delete history of transactions: 
```
$ rails console
$ AccountTransaction.destroy_all
```
or delete last transaction:

```
$ AccountTransaction.last.destroy!
$ exit

$ rails s
```

## Code Examples

#### Module example
app/models/account_transaction.rb
```ruby
class AccountTransaction < ApplicationRecord
  belongs_to :bank_account

  TRANSACTION_TYPES = ["withdraw","deposit"]

  validates :bank_account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES}

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end
  end
end
```

#### Validate new transaction 
app/operations/bank_accounts/validate_new_transaction.rb
```ruby
module BankAccounts
    class ValidateNewTransaction
        def initialize(amount: , transaction_type: , bank_account_id: )
            @amount = amount.try(:to_i) 
            @transaction_type = transaction_type
            @bank_account_id = bank_account_id
            @bank_account = BankAccount.where(id: @bank_account_id).first
            @errors = []
        end

        def execute!
            validate_existence_of_account!

            if @transaction_type == "withdraw" and @bank_account.present?
                validate_withdrawal!
            end
            @errors
        end

        private

        def validate_withdrawal!
            if @bank_account.balance - @amount < 0.00
                @errors << "Not enough money"
            end
        end

        def validate_existence_of_account!
            if @bank_account.blank?
                @errors << "Account not found"
            end

        end
    end
end
```
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
* HAML files
* Ajax calls 

To-do list:
* Add styles!
* Solve the problem with the lack of javascript precompile in heroku server

## Status
Project is: _in progress_

## Inspiration
An idea for an application that I liked very much - Inspired by devlogs youtube videos - I decided that I want to do my own version of "simple banking app". It seems easy for me to expand in the future. 

## Contact
Created by [@lapinskap](https://www.facebook.com/paulina.lapinska99) - feel free to contact me!
