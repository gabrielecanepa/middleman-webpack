require 'thor/group'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root File.expand_path(File.dirname(__FILE__))

    def copy_default_files
      directory 'template', '.', exclude_pattern: /\.DS_Store$/
    end

    def bundle_install
      run 'bundle install'
      run 'bundle clean --force'
    end

    def yarn_install
      run 'yarn install'
    end

    def print_success_message
      puts 'Repository successfully created!'
    end
  end
end
