task :eslint do
  system 'node_modules/.bin/eslint source/javascripts/*.js'
end

task :rubocop do
  system 'rubocop'
end

task default: %i[eslint rubocop]
