class Favicon
  private

  attr_reader :file_path

  public

  def self.generate(file_path)
    {
      file_path => [
        { icon: 'assets/images/apple-touch-icon-180x180-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-152x152-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-144x144-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-120x120-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-114x114-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-76x76-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-72x72-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-60x60-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-57x57-precomposed.png' },
        { icon: 'assets/images/apple-touch-icon-precomposed.png', size: '57x57' },
        { icon: 'assets/images/apple-touch-icon.png', size: '57x57' },
        { icon: 'assets/images/favicon-196x196.png' },
        { icon: 'assets/images/favicon-160x160.png' },
        { icon: 'assets/images/favicon-96x96.png' },
        { icon: 'assets/images/favicon-32x32.png' },
        { icon: 'assets/images/favicon-16x16.png' },
        { icon: 'assets/images/favicon.png', size: '16x16' },
        { icon: 'assets/images/favicon.ico', size: '64x64,32x32,24x24,16x16' },
        { icon: 'assets/images/mstile-310x150.png', size: '310x150' },
        { icon: 'assets/images/mstile-310x310.png', size: '310x310' },
        { icon: 'assets/images/mstile-150x150.png', size: '150x150' },
        { icon: 'assets/images/mstile-144x144.png', size: '144x144' },
        { icon: 'assets/images/mstile-70x70.png', size: '70x70' }
      ]
    }
  end
end
