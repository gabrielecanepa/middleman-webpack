require 'thor/group'
require 'rainbow'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root __dir__

    def copy_template_files
      puts Rainbow('Copying template files...').bright.orange
      directory 'template', '.', exclude_pattern: /\.DS_Store$/
      run 'touch .env'
    end

    def install_gems
      puts Rainbow('Installing gems...').bright.orange
      run 'gem cleanup'
      run 'bundle install'
    end

    def install_packages
      puts Rainbow('Installing packages...').bright.orange
      run 'yarn install'
    end

    def print_success_message
      puts Rainbow('📦  Repository successfully created with middleman-webpack!').bright.orange
    end

    def exit_script
      `exec zsh || exec bash`
      `exit`
    end
  end
end
