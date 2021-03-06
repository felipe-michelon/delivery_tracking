# Delivery Tracking

This app will help you track your packages, without needing to check any website every 5 minutes

## Setup

We **strongly** recommend using [RVM](https://rvm.io) to run the following commands.

### Install dependencies
Using [Bundler](https://bundler.io) (should be installed if you are using RVM), run:
```
bundler install
```

### Environment variables

For that, we have a `.env.sample` file. To create a local file, create a `.env` file with:
```
cp .env.sample .env
```
You can fill each variable with the following:

#### `DATABASE_URL`
Url to connect with database.

Template: postgres://user:password@host:port
Example: postgres://postgres:root@localhost:5432

NOTE: **Do not** write a database name on the url, the file `config/database.yml` will create the database with the right name.

#### `EMAIL_DEFAULT_SENDER`
Default sender for all mailing

#### `NOTIFICATION_REQUEST_UPDATE_PUBLISHER_ARN`
Topic's arn to publish messages when a `NotificationRequest` needs to re-checked to update its status

#### `SENDGRID_API_KEY`
[Sendgrid](https://sendgrid.com) API key to send emails

#### `SHARED_SECRET`
Token to protect endpoints that can create/destroy essential resources

### Database Setup

To create and setup both development and test databases, run:

```
rake db:create db:migrate
```

NOTE: Make sure the `DATABASE_URL` is set correctly.

## Running the app

Just run:

```
ruby ./app.rb
```

## Code Maintenance

### Code styles

We use [Rubocop](https://github.com/rubocop-hq/rubocop) as a linter. To check your code, run:

```
rubocop
```

### Debugging

When you need to debug something, use [pry](https://github.com/pry/pry) as the following example:

```ruby
class Foo
  def bar
    puts 'I need to debug the next line'
    binding.pry #code will stop here
  end
end
```

### Tests

We use [RSpec](https://github.com/rspec/rspec) as a test framework. To run all tests, run the following command:
```
rspec
```

If you want to run a single file, or a group of files, you can specify a path:

```
rspec spec/requests
rspec spec/requests/base_spec.rb
```

## Infrastructure

To maintain our infra, we use [Terraform](https://terraform.io). All files related to that, can be found on [terraform](terraform/) directory.

For running **any** terraform commands, you should have three environment variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION`. We recommend using [aws-vault](https://github.com/99designs/aws-vault) to manage your AWS credentials

### Deploying lambdas

Each lambda on [lambdas directory](infra/lambdas) has a Makefile. To generate it's zip, just run the following command on every directory:

```bash
make
```

After that, run terraform plan/apply to deploy all lambdas at once.

NOTE: If there is a change on a lambda function, just rerun the `make` command on it's directory. Terraform will notice that the zip file changed its hashcode and, when you redeploy the function, it will have the changes.

## License

[MIT-LICENSE](LICENSE)
