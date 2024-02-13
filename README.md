# Wedding

This is a simple wedding website.

## Dependencies

- Ruby 3.3.0
- Rails 7.1.3
- SQLite3

## Setup

1. Install Ruby 3.3.0, It's recomended to use [rbenv](https://github.com/rbenv/rbenv)

```bash
rbenv install 3.3.0
```

2. Install ruby gems and js packages

```bash
bundle install && yarn install
```


3. Create the database and run the migrations

```bash
rails db:prepare
```

4. Run the server

```bash
bin/dev
```

5. Open your browser and go to `http://localhost:3000` to see the website. If you want to test the details page use the phone number `1234567890` in the root app.
