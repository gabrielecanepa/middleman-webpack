require 'thor/group'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root File.expand_path(File.dirname(__FILE__))

    def copy_default_files
      directory 'template', '.', exclude_pattern: /\.DS_Store\.package.json$/
    end

    def bundle_install
      run 'bundle install'
      run 'bundle clean'
    end

    def yarn_install
      run 'yarn install'
    end

    def generate_binstub
      run 'bundle binstubs middleman-cli'
    end

    def run_middleman
      run 'middleman server'
    end
  end
end
