# rubocop:disable AbcSize
# rubocop:disable MethodLength
# rubocop:disable LineLength

module FaviconsHelper
  def generate_favicon_hash
    icon_path    = File.join(@app.config.images_dir, @app.data.site.favicon)
    output_path  = File.join(@app.config.images_dir, 'favicon')

    favicons = [
      {
        rel: 'apple-touch-icon',
        size: '180x180',
        icon: "#{output_path}/apple-touch-icon.png"
      },
      {
        rel: 'icon',
        type: 'image/png',
        size: '32x32',
        icon: "#{output_path}/favicon32x32.png"
      },
      {
        rel: 'icon',
        type: 'image/png',
        size: '16x16',
        icon: "#{output_path}/favicon16x16.png"
      },
      {
        rel: 'shortcut icon',
        size: '64x64,32x32,24x24,16x16',
        icon: "#{output_path}/favicon.ico"
      }
    ]

    { icon_path => favicons }
  end

  def auto_display_favicon_tags
    result = []

    if data.site.base_color
      result << tag(:meta, name: 'theme-color', content: data.site.base_color)
      result << tag(:meta, name: 'msapplication-TileColor', content: data.site.base_color)
    end

    icon_path = File.join(config[:images_dir], data.site.favicon)
    generate_favicon_hash[icon_path].each do |favicon|
      favicon_link_tags = {}
      favicon.each_key do |key|
        if key == :icon
          favicon_link_tags[:href] = favicon[key]
        elsif key == :size
          key == :sizes
        else
          favicon_link_tags[key] = favicon[key]
        end
      end
      result << tag(:link, favicon_link_tags)
    end

    result = result.join("\n")
    result.html_safe
  end
end

# rubocop:enable AbcSize
# rubocop:enable MethodLength
# rubocop:enable LineLength
