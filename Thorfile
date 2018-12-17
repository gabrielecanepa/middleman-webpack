require 'thor/group'
require 'rainbow'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root __dir__

    def copy_template_files
      puts Rainbow('Copying template files...').orange.bright
      directory 'template', '.', exclude_pattern: /\.DS_Store$/
      run 'touch .env'
    end

    def bundle_install
      puts Rainbow('Installing gems...').orange.bright
      run 'bundle install'
    end

    def yarn_install
      puts Rainbow('Installing packages...').orange.bright
      run 'yarn install'
    end

    def print_success_message
      puts Rainbow('📦  Repository successfully created with middleman-webpack!').orange.bright
    end

    def exit_script
      `exec zsh || exec bash`
      `exit`
    end
  end
end
