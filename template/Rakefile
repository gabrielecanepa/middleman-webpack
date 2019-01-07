require 'rainbow'

linters = [
  {
    name: 'ESLint',
    language: 'JavaScript',
    command: 'node_modules/.bin/eslint source/**/*.js'
  },
  {
    name: 'stylelint',
    language: 'CSS/SCSS',
    command: 'stylelint **/*.scss'
  },
  {
    name: 'RuboCop',
    language: 'Ruby',
    command: 'rubocop'
  }
]

default_tasks = []

linters.each do |linter|
  desc "Check your #{linter[:language]} files with #{linter[:name]}"
  task linter[:name].downcase.to_sym do
    puts Rainbow(
      "Checking your #{linter[:language]} files with #{linter[:name]}..."
    ).bright.orange
    run_linter(linter[:command])
  end
  default_tasks << linter[:name].downcase.to_sym
end

task default: default_tasks

def run_linter(command)
  output = `#{command}`
  if output.empty?
    puts Rainbow('✔︎ Perfect style!').bright.green
  else
    system command
  end
end
