require 'thor/group'
require 'ruby-progressbar'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root File.expand_path(File.dirname(__FILE__))

    def copy_default_files
      directory 'template', '.', exclude_pattern: /\.DS_Store$/
      run 'touch .env'
    end

    def bundle_install
      run 'bundle install'
      run 'bundle clean --force'
    end

    def yarn_install
      run 'yarn install'
      run 'yarn upgrade'
    end

    def print_success_message
      puts '📦  Repository successfully created with middleman-webpack!'
      server_bar = ProgressBar.create(title: '🛠   Running server', progress_mark: '.', format: '%t%B')
      3.times do
        server_bar.increment
        sleep 0.25
      end
      puts '🛠   Running server...'
    end

    def run_server
      run 'middleman server'
    end
  end
end
