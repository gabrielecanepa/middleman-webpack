module FaviconsHelper
  def generate_favicon_hash(output_dir = '')
    icon_path    = File.join(config[:images_dir], @app.data.site.favicon)
    output_path  = File.join(config[:images_dir], output_dir)
    favicons     = config[:favicons]

    favicons.each do |favicon|
      favicon[:icon] = File.join(output_path, favicon[:icon])
    end

    { icon_path => favicons }
  end

  def auto_display_favicon_tags
    result = []

    if (base_color = @app.data.site.base_color)
      result << tag(:meta, name: 'theme-color',
                           content: base_color)
      result << tag(:meta, name: 'msapplication-TileColor',
                           content: base_color)
    end

    result << auto_generate_favicon_tags
    result = result.join("\n")
    result.html_safe
  end

  private

  def auto_generate_favicon_tags
    icon_path = File.join(config[:images_dir], @app.data.site.favicon)
    tags      = []

    generate_favicon_hash[icon_path].each do |favicon|
      tags << tag(:link, set_tag_attributes(favicon))
    end

    tags
  end

  def set_tag_attributes(favicon)
    attributes = {}

    favicon.each_key do |key|
      case key
      when :icon then attributes[:href]  = favicon[key]
      when :size then attributes[:sizes] = favicon[key]
      else attributes[key] = favicon[key]
      end
    end

    attributes
  end
end
