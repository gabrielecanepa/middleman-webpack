task :eslint do
  system 'node_modules/.bin/eslint source/assets/javascripts/*.js'
end

task :rubocop do
  system 'rubocop'
end

namespace :middleman do
  task :build do
    system 'bundle exec middleman build'
  end
end

task default: %i[eslint rubocop]
