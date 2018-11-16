module ImagesHelper
  def svg_tag(file_name, attributes = {})
    root      = Middleman::Application.root
    file_path = File.join(root, 'source', config[:images_dir], file_name)
    svg       = File.exist?(file_path) ? File.read(file_path) : 'SVG not found'
    name      = file_name.gsub('.svg', '')

    svg.gsub!('<svg ', new_opening_tag(attributes))

    (0..99).each { |n| change_class_name(svg, "st#{n}", "#{name}#{n}") }
    svg.slice!(/\b(?:height|width)\b/)

    svg
  end

  private

  def new_opening_tag(attributes)
    svg_opening_tag = '<svg '
    attributes.each_key do |attribute|
      svg_opening_tag += "#{attribute}=\"#{attributes[attribute]}\" "
    end
    svg_opening_tag
  end

  def change_class_name(element, old_name, new_name)
    element.gsub!(old_name, new_name) if element.include?(old_name)
  end
end
