require 'json'
require 'rainbow'
require 'thor/group'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root __dir__

    def copy_template_files
      puts Rainbow('Copying template files...').bright.orange
      directory 'template', '.', exclude_pattern: /\.DS_Store$/
      `touch .env`
    end

    def install_gems
      puts Rainbow('Installing gems...').bright.orange
      system 'bundle install'
    end

    def install_packages
      puts Rainbow('Installing packages...').bright.orange
      system 'yarn install'
    end

    def initialize_git
      `git init`
      `git add .`
      `git commit -m "Initialize new repository with middleman-webpack"`
    end

    def print_success_message
      puts Rainbow('📦  Repository successfully created with middleman-webpack!').bright.orange
    end

    def exit_script
      exec 'zsh'
      exit
    end
  end
end
