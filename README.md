# Sequra's Coding Challenge

## Setup

1. clone the repository

2. enter repository

3. make sure you have ruby 3.2.0 and redis installed

4. run `bundle install`

5. run `bin/rails db:setup`

## Usage

Create the disbursements with the seed data

```
bin/rails disbursements:create
```

run the server `bin/rails s`


## Testing

To run tests you just need to run the following command:

```
rails test
```

**Notes**:

I decided to use `Ruby on Rails` minimal api as you guys use rails in the company and it is what I usually use on a daily basis. I tried to have the minimum libraries possible to do this challenge. Next time I would use `Roda` or `Sinatra` or even `Hanami`.

As architecture wise, I don't know if can call this an `hexagonal architecture` as I am not using repositories.

I could have used the `whenever` gem or the unix `cron` tool to process the disbursements in a rake task, but I chose `sidekiq-cron` to take care of it as `whenever` gem has not been updated recently and to have the cron job running in the server I would have to config it differently.

I spent some time with the fixtures after creating the disbursements controller and deleted them instead of wasting more time to get it to work well.

Things that I would do would if I had more time:
  - Model validations.
  - Use repositories to abstract the models.
  - Show disbursements for each merchant in the API endpoint, could be `/disbursements/merchant_id`.
  - Use `BigDecimal` or `money` gem for the money calculations.
  - Use `docker`.
