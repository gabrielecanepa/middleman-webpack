Dir['lib/*.rb'].each { |file| require file }

set :index_file,  'views/index.html'
set :layouts_dir, 'views/layouts'

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :dotenv

activate :external_pipeline,
         name:     :webpack,
         command:  build? ? 'yarn run build' : 'yarn run start',
         source:   'dist',
         latency:  1

activate :meta_tags

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :development do
  set :debug_assets, true
  activate :livereload
end

configure :build do
  ignore 'javascripts/*' # handled by webpack
  set :relative_links, true
  activate :asset_hash
  activate :favicon_maker do |f|
    f.template_dir = 'source/images'
    f.icons = generate_favicons('_favicon.svg')
  end
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets
end
