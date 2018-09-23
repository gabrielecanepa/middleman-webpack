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

  task :deploy do
    puts 'Fetching origin...'
    if system 'git remote -v'
      system 'rake middleman:build'
      system 'git checkout -b gh-pages' unless system 'git checkout gh-pages'
    else
      puts '⚠️ ERROR: You must set a remote before deploying'
    end
  end
end

task default: %i[eslint rubocop]
