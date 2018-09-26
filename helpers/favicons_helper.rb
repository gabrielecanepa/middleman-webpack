module FaviconsHelper
  def favicon_tags
    @favicons = ''
    favicon_tags = [
      '<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon-180x180-precomposed.png">',
      '<link rel="apple-touch-icon" sizes="152x152" href="apple-touch-icon-152x152-precomposed.png">',
      '<link rel="apple-touch-icon" sizes="144x144" href="apple-touch-icon-144x144-precomposed.png">',
      '<link rel="apple-touch-icon" sizes="114x114" href="apple-touch-icon-114x114-precomposed.png">',
      '<link rel="apple-touch-icon" sizes="72x72" href="apple-touch-icon-72x72-precomposed.png">',
      '<link rel="apple-touch-icon" href="apple-touch-icon-precomposed.png">',
      '<link rel="shortcut icon" href="favicon.png">',
      '<link rel="icon" type="image/ico" href="favicon.ico">'
    ]
    favicon_tags.map { |favicon_tag| @favicons << favicon_tag + "\n" }
    @favicons
  end
end
