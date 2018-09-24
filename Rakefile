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
    if system 'git remote -v &>/dev/null'
      system 'rake middleman:build'
      system 'git checkout -b gh-pages' unless system 'git checkout gh-pages &>/dev/null'
      system 'git add .'
      system "git commit -m 'Automated Middleman deploy commit #{Time.now.strftime 'on %-d %b %Y at %H:%M:%S'}'"
      system 'git subtree push --prefix build origin gh-pages'
      system 'git checkout master'
      system '✅ Website successfully published!'
    else
      puts '⚠️ ERROR: You must set a remote before deploying'
    end
  end
end

task default: %i[eslint rubocop]
