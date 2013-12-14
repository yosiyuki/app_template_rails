repo = 'https://raw.github.com/yosiyuki/app_template_rails/master'

gem 'thin'
gem 'slim'
gem 'exception_notification'

gem_group :development, :test do
  gem 'sqlite3'
  gem 'slim-rails'
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'pry-rails'
  gem 'pry-byebug'
end

gem_group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end


gem_group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'pg'
  gem 'dalli'
end

remove_file "public/index.html"
remove_file "app/views/layouts/application.html.erb"
get "#{repo}/app/views/layouts/application.html.slim", "app/views/layouts/application.html.slim"

file 'Procfile', <<-CODE
  web: bundle exec thin start -p $PORT -e $RACK_ENV
CODE

file '.env', <<-CODE
  PORT=3333
  RACK_ENV=development
CODE

run_bundle

git :init
git add: '.'
git commit: "-m 'initial commit'"

generate 'rspec:install'

git add: '.'
git commit: "-m 'rspec install'"
