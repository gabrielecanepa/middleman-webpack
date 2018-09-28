require 'ruby-progressbar'

desc 'Check style in your JavaScript files with ESLint'
task :eslint do
  system 'node_modules/.bin/eslint source/assets/javascripts/*.js'
end

desc 'Check style in your Ruby files with RuboCop'
task :rubocop do
  system 'rubocop'
end

desc 'Test your Rake tasks'
task :test do
  # Test a new rake task here
end

namespace :middleman do
  desc 'Run `middleman build` with bundler'
  task :build do
    building_bar = ProgressBar.create(title: '🏗  Building project', progress_mark: '.', format: '%t%B')
    10.times do
      building_bar.increment
      sleep 0.25
    end
    puts '🏗  Building project..........'
    system 'bundle exec middleman build'
  end

  desc 'Deploy Middleman application on GitHub Pages'
  task :deploy do
    remotes_bar = ProgressBar.create(title: '〰️ Looking for GitHub remotes', progress_mark: '.', format: '%t%B')
    10.times do
      remotes_bar.increment
      sleep 0.25
    end
    puts '〰️ Looking for GitHub remotes..........'
    remote = `git config --get remote.origin.url`
    if remote.include?('git@github.com')
      puts "〰️ Using #{remote}"
      if system '[ -n "$(git status --porcelain)" ]'
        status = `git status`
        puts "⚠️  WARNING: Your status is not clean -#{' stash or add and' if status.include?('Untracked files') || status.include?('Changes not staged for commit')} commit the following files before deploying"
        system 'git status'
      else
        gh_pages_url = "https://#{remote.sub('git@github.com:', '').sub('.git', '').sub('/', '.github.io/')}"
        `git branch -f gh-pages`
        unless ARGV[1] == 'no-build'
          system 'rake middleman:build'
          `git add build`
          `git commit -m 'Automated Middleman deploy commit #{Time.now.strftime 'on %-d %b %Y at %H:%M:%S'}' &>/dev/null`
          `git push origin master &>/dev/null`
        end
        system 'git subtree push --prefix build origin gh-pages'
        puts "🚀 Website successfully published at #{gh_pages_url}"
      end
    else
      puts '❌ ERROR: Can\'t find any remote - you must set a GitHub remote before deploying'
    end
  end
end

task default: %i[eslint rubocop]
