require 'ruby-progressbar'
require 'thor/group'

module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions

    source_root __dir__

    def copy_template_files
      directory 'template', '.', exclude_pattern: /\.DS_Store$/
      run 'touch .env'
    end

    def bundle_install
      run 'bundle install'
      run 'bundle clean'
    end

    def yarn_install
      run 'yarn install'
      run 'yarn upgrade'
    end

    def print_success_message
      puts '📦  Repository successfully created with middleman-webpack!'
      print_progress_bar('🛠   Running server')
    end

    def run_server
      run 'middleman server'
    end

    private

    def print_progress_bar(message)
      progress_bar = ProgressBar.create(
        title: message,
        progress_mark: '.',
        format: '%t%B'
      )
      3.times do
        progress_bar.increment
        sleep 0.25
      end
      puts message
    end
  end
end
