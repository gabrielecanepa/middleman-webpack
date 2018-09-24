desc 'Check style in your JavaScript files with ESLint'
task :eslint do
  system 'node_modules/.bin/eslint source/assets/javascripts/*.js'
end

desc 'Check style in your Ruby files with RuboCop'
task :rubocop do
  system 'rubocop'
end

namespace :middleman do
  desc 'Run `middleman build` with bundler'
  task :build do
    system 'bundle exec middleman build'
  end

  desc 'Deploy Middleman application on GitHub Pages'
  task :deploy do
    if system 'git remote -v &>/dev/null'
      remote = `git config --get remote.origin.url`
      # system 'rake middleman:build'
      `git branch -f gh-pages`
      `git add .`
      `git commit -m 'Automated Middleman deploy commit #{Time.now.strftime 'on %-d %b %Y at %H:%M:%S'}'`
      system 'git subtree push --prefix build origin gh-pages'
      puts "✔️  Website successfully published at https://#{remote.gsub('git@github.com:', '').gsub(':', '.github.io/')}!"
    else
      puts '⚠️ ERROR: You must set a remote before deploying'
    end
  end
end

task default: %i[eslint rubocop]
