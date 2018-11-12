require 'oga'

class SVG
  private

  attr_reader :file_path, :options

  public

  def self.inline(file_path, options = {})
    new(file_path, options).inline
  end

  def initialize(file_path, options = {})
    @file_path = file_path
    @options   = options
  end

  def inline
    return read_file if options.empty?

    inline_with_options
  end

  private

  def inline_with_options
    document        = Oga.parse_xml(File.open(file_path))
    svg             = document.css('svg').first

    svg.set('role', 'img')

    apply_class_option(svg) if options[:class]
    apply_alt_option(svg)   if options[:alt]

    document.to_xml
  end

  def apply_alt_option(svg)
    desc            = Oga::XML::Element.new(name: :desc)
    desc.inner_text = options[:alt]

    svg.set('aria-label', options[:alt])
    svg.children << desc
  end

  def apply_class_option(svg)
    svg.set(:class, options[:class])
  end

  def read_file
    File.read(file_path)
  end
end
