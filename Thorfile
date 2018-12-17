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
      puts Rainbow('Installing npm packages...').orange.bright
      run 'yarn install'
      run 'yarn upgrade'
    end

    def print_success_message
      puts Rainbow('📦  Repository successfully created with middleman-webpack!').orange.bright
      puts Rainbow("Run your server with #{Rainbow('middleman server').green}").bright
    end

    default_task %I[copy_template_files bundle_install yarn_install print_success_message]
  end

  Generator.start
end
