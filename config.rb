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
  activate :livereload
  set :debug_assets, true
end

configure :build do
  ignore 'javascripts/*' # handled by webpack
  set :relative_links, true
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  activate :favicon_maker do |f|
    f.template_dir = 'source/images'
    f.icons = {
      '_favicon.svg' => [
        { icon: 'apple-touch-icon-180x180-precomposed.png' },
        { icon: 'apple-touch-icon-152x152-precomposed.png' },
        { icon: 'apple-touch-icon-144x144-precomposed.png' },
        { icon: 'apple-touch-icon-120x120-precomposed.png' },
        { icon: 'apple-touch-icon-114x114-precomposed.png' },
        { icon: 'apple-touch-icon-76x76-precomposed.png' },
        { icon: 'apple-touch-icon-72x72-precomposed.png' },
        { icon: 'apple-touch-icon-60x60-precomposed.png' },
        { icon: 'apple-touch-icon-57x57-precomposed.png' },
        { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
        { icon: 'apple-touch-icon.png', size: '57x57' },
        { icon: 'favicon-196x196.png' },
        { icon: 'favicon-160x160.png' },
        { icon: 'favicon-96x96.png' },
        { icon: 'favicon-32x32.png' },
        { icon: 'favicon-16x16.png' },
        { icon: 'favicon.png', size: '16x16' },
        { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
        { icon: 'mstile-70x70.png', size: '70x70' },
        { icon: 'mstile-144x144.png', size: '144x144' },
        { icon: 'mstile-150x150.png', size: '150x150' },
        { icon: 'mstile-310x310.png', size: '310x310' },
        { icon: 'mstile-310x150.png', size: '310x150' }
      ]
    }
  end
end
