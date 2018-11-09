# Import custom classes
Dir['lib/*.rb'].each { |file| require file }

# Include node_modules in Sass load paths
::Sass.load_paths << File.join(root, 'node_modules')

set :css_dir,    'assets/stylesheets'
set :fonts_dir,  'assets/fonts'
set :images_dir, 'assets/images'
set :js_dir,     'assets/javascripts'

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :dotenv

activate :external_pipeline,
         name:    :webpack,
         command: build? ? 'yarn run build' : 'yarn run start',
         source:  'dist',
         latency: 1

activate :meta_tags
activate :protect_emails

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

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
  set      :debug_assets, true
  activate :livereload
  activate :pry
end

configure :build do
  ignore   File.join(config[:js_dir], '*') # handled by webpack
  set      :relative_links, true
  activate :asset_hash
  # Place the icon (png or svg) in your images dir and specify it in data/site.yml
  activate :favicon_maker, icons: Favicon.generate(@app.config.images_dir, @app.data.site.favicon)
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets
  activate :robots, rules:   [{ user_agent: '*', allow: %w(/) }],
                    sitemap: "#{@app.data.site.host}/sitemap.xml"
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch        = 'gh-pages'
  deploy.build_before  = true
end
