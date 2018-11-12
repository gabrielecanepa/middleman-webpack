require 'lib/svg'

module ImagesHelper
  def svg_tag(filename, options = {})
    root      = Middleman::Application.root
    file_path = File.join(root, 'source', config[:images_dir], filename)
    return '(SVG img not found)' unless File.exist?(file_path)

    SVG.inline(file_path, options)
  end
end
