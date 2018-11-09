desc 'Check your JavaScript style with ESLint'
task :eslint do
  system 'node_modules/.bin/eslint source/assets/javascripts/*.js'
end

desc 'Check your Ruby style with RuboCop'
task :rubocop do
  system 'rubocop'
end

task default: %i[eslint rubocop]
