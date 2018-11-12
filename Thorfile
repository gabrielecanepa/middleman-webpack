require 'thor/group'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root File.expand_path(File.dirname(__FILE__))

    def copy_default_files
      directory 'template', '.', exclude_pattern: /\.json$/
    end

    def bundle_install
      run 'bundle install'
      run 'bundle clean --force'
    end

    def yarn_install
      run 'yarn init'
    end

    def generate_binstub
      run 'bundle binstubs middleman-cli'
    end

    def run_middleman
      run 'middleman server'
    end
  end
end
