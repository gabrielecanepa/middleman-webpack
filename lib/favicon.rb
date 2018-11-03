class Favicon
  def self.generate(template_dir, icon)
    {
      File.join(template_dir, icon) => [
        {
          rel:  'apple-touch-icon',
          size: '180x180',
          icon: "#{template_dir}/favicon/apple-touch-icon.png"
        },
        {
          rel:  'icon',
          type: 'image/png',
          size: '32x32',
          icon: "#{template_dir}/favicon/favicon32x32.png"
        },
        {
          rel:  'icon',
          type: 'image/png',
          size: '16x16',
          icon: "#{template_dir}/favicon/favicon16x16.png"
        },
        {
          rel:  'shortcut icon',
          size: '64x64,32x32,24x24,16x16',
          icon: "#{template_dir}/favicon/favicon.ico"
        }
      ]
    }
  end
end
