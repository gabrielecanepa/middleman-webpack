module ImagesHelper
  def svg_tag(file_name, attributes = {})
    root       = Middleman::Application.root
    file_path  = File.join(root, 'source', config.images_dir, file_name)
    svg        = File.exist?(file_path) ? File.read(file_path) : 'SVG not found'
    image_name = file_name.gsub('.svg', '')

    add_attributes_to_opening_tag(svg, 'svg', attributes)

    (0..99).each { |n| change_class_name(svg, "st#{n}", "#{image_name}#{n}") }
    svg.slice!(/\b(?:height|width)\b/)

    svg
  end

  private

  def add_attributes_to_opening_tag(element, tag, attributes)
    opening_tag     = "<#{tag} "
    new_opening_tag = opening_tag
    attributes.each_key do |attribute|
      new_opening_tag += "#{attribute}=\"#{attributes[attribute]}\" "
    end
    element.gsub!(opening_tag, new_opening_tag)
  end

  def change_class_name(element, old_name, new_name)
    element.gsub!(old_name, new_name) if element.include?(old_name)
  end
end
