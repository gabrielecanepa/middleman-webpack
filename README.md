![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/banner.jpg?sanitize=true)

# Middleman webpack

This is a template for [**Middleman 4**](https://middlemanapp.com).

It integrates some of the best modern tools and snippets to create advanced static websites.

It's mainly based on [**Yarn**](https://yarnpkg.com), a reliable and easy to use package manager, [**webpack**](https://webpack.js.org), a module bundler capable of packaging almost any kind of asset, and [**Sass**](https://sass-lang.com), the most powerful CSS extension language.

All this combined with the simplicity of _Ruby and its gems_, some reinvented _powerful snippets_, and the _best available linters and debuggers_.

## What's included?

#### Core

-   [Middleman](https://middlemanapp.com)
-   [Yarn](https://yarnpkg.com)
-   [webpack](https://webpack.js.org) with [Babel](https://babeljs.org)
-   [Sass](https://sass-lang.com)

#### Middleman extensions

-   [Autoprefixer](https://github.com/middleman/middleman-autoprefixer)
-   [Deploy](https://github.com/karlfreeman/middleman-deploy)
-   [Dotenv](https://github.com/karlfreeman/middleman-dotenv)
-   [Favicon maker](https://github.com/follmann/middleman-favicon-maker)
-   [Livereload](https://github.com/middleman/middleman-livereload)
-   [Meta tags](https://github.com/gabrielecanepa/middleman-meta-tags)
-   [Minify HTML](https://github.com/middleman/middleman-minify-html)
-   [Pry](https://github.com/AndrewKvalheim/middleman-pry)
-   [Robots](https://github.com/yterajima/middleman-robots)

#### Snippets

-   [Inline SVGs](#images)
-   [Favicon helper](#favicon)
-   [404 page](#404-page)

#### Linters

-   [ESLint](https://eslint.org) for JavaScript
-   [RuboCop](https://github.com/rubocop-hq/rubocop) for Ruby
-   [stylelint](https://stylelint.io) for SCSS

#### Debuggers

-   [Pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
-   [Rake](https://github.com/ruby/rake)

## Dependencies

You must have the following tools installed to use this boilerplate:

-   [Bundler](https://bundler.io)
-   [Node](https://nodejs.org) (> v4)
-   [Yarn](https://yarnpkg.com)

## Installation

Start a new project in your current directory

```bash
$ middleman init -T gabrielecanepa/middleman-webpack
```

or in a new one:

```bash
$ middleman init <project-name> -T gabrielecanepa/middleman-webpack
```

You can also set up an alias like `middleman:webpack` in one of your shell profiles

```bash
# ~/.bash_profile
alias middleman:webpack="middleman init $1 gabrielecanepa/middleman-webpack"
```

and use it to quickly initialize a new project.

## Usage

> 💡 A good usage example, that will be used through this wiki, is the same [documentation website](https://github.com/gabrielecanepa/middleman-webpack-www) of the template

```bash
$ middleman server   # Run a local server
$ middleman build    # Build the static files
$ middleman deploy   # Deploy the built site
```

### Getting started

You'll find the main settings of your website in `data/site.yml`.

The properties you set up here will be used by the `auto_display_meta_tag` helper to inject specific tags in your views.

The default configuration

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen1.png?sanitize=true)

produces the following tags for the homepage:

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen2.png?sanitize=true)

Any tag can be overwritten (or created) in each page or layout with [frontmatter](https://middlemanapp.com/basics/frontmatter) (see `source/404.html.erb`) or the `set_meta_tag` helper (see `source/index.html.erb`).

#### Favicon

The icon you specify in the **favicon** field (`_favicon.svg` by default) must be relative to `source/assets/images`.

The leading underscore prevents it from being copied into the build directory.
The image format should be either PNG or SVG.

In production, it will be used to generate your favicons and show the correspondent tags in your layouts, thanks to the `auto_display_favicon_tags` helper.

You can change the favicons you want to produce in `config.rb`, and the tags generated by the helper will change dynamically.

The favicons set by default

```ruby
# config.rb
set :favicons, [
  {
    rel: 'apple-touch-icon',
    size: '180x180',
    icon: 'apple-touch-icon.png'
  },
  {
    rel: 'icon',
    type: 'image/png',
    size: '32x32',
    icon: 'favicon32x32.png'
  },
  {
    rel: 'icon',
    type: 'image/png',
    size: '16x16',
    icon: 'favicon16x16.png'
  },
  {
    rel: 'shortcut icon',
    size: '64x64,32x32,24x24,16x16',
    icon: 'favicon.ico'
  }
]
```

generate the following tags and relative icons:

```html
<link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicon/favicon32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon/favicon16x16.png">
<link rel="shortcut icon" sizes="64x64,32x32,24x24,16x16" href="assets/images/favicon/favicon.ico">
```

### Styling

Each application has different design needs, that's why _Middleman webpack does not include any CSS or built-in solution_.

Your `source/assets/stylesheets/all.css.scss` shows an overview of the suggested architecture and imports the default Middleman style:

```scss
// Suggested structure:
// 1. Settings
//    ├── settings/
// 2. Vendors
//    ├── vendors-stylesheets/
//    ├── vendors-settings/
// 3. Style
//    ├── 1. base/
//    ├── 2. components/
//    ├── 3. layouts/
//    └── 4. pages/

@import "settings/colors";
@import "settings/fonts";
@import "base/site";
```

It's important to follow a similar structure to ensure the proper rendering of your style and respect CSS specificity:

#### 1. Settings

Your website setting must be imported first and contain the variables, mixins and rules you will use in your style. Check the [Sass documentation](https://sass-lang.com/documentation/file.SASS_REFERENCE) for a more advanced usage of this resources.

#### 2. Vendors

Vendor stylesheets must be imported right after your website settings, and before any eventual setting overriding the default package configuration.

Any stylesheet added with Yarn can be imported into your stylesheet files with an `@import` statement followed by the path relative to the `node_modules` folder.

For instance, the documentation website has been bundled with [bootstrap](https://www.npmjs.com/package/bootstrap), and to load the grid style from the package the following line was added to `all.css.scss`:

```scss
@import "bootstrap/scss/bootstrap-grid";
```

> 💡 You can also import stylesheets in your JavaScript files.
> Check the [Yarn and webpack section](#importing-stylesheets)

#### 3. Style

The last files to import must contain the actual style of your website:

1.  _Base_: general style, typography, base elements
2.  _Components_: buttons, cards, lists, etc.
3.  _Layouts_: navbar, footer, sidebar, etc.
4.  _Pages_: custom styling per page

An example of this organization can be found in the [documentation website](https://github.com/gabrielecanepa/middleman-webpack-www/tree/master/source/assets/stylesheets).

### Using Yarn and webpack

The repository comes configured with [**Yarn**](https://yarnpkg.com), [**webpack**](https://webpack.js.org) and the following loaders:

-   [Babel](https://babeljs.io) for JavaScript
-   [style-loader](https://github.com/webpack-contrib/style-loader), [css-loader](https://github.com/webpack-contrib/css-loader), [postcss-loader](https://github.com/postcss/postcss-loader) and [sass-loader](https://github.com/webpack-contrib/sass-loader) for CSS and SCSS

webpack has been integrated thanks to the in-built `external_pipeline` extension (find its configuration in `config.rb`), that allows Middleman to run multiple subprocesses.

Every time a server is run (in development or production), also the relative Yarn command gets executed (`yarn run start` or `yarn run build`), which runs in turn the right webpack process.

> 💡 Want to setup your application with a different JavaScript pipeline? Have a look at the relative [Middleman documentation](https://middlemanapp.com/advanced/external-pipeline)

#### Installing packages

Install a new package with the following command:

```shell
yarn add <package-name> [--dev]
```

In your JavaScript files, you can import modules from a packages with the `import` statement.

For instance, the documentation website uses [Tippy.js](https://atomiks.github.io/tippyjs) to display tooltips, and its default behavior was set after importing the `tippy` object from the package:

```javascript
import tippy from "tippy.js";

tippy.setDefaults({
  arrow: true,
  arrowType: "round",
  duration: [275, 200],
  inertia: true
});
```

#### Importing stylesheets

You can import CSS and SCSS in your scripts with a normal `import` statement, thanks to the pre-installed webpack style loaders (webpack only bundles JavaScript by default, specific loaders are needed to bundle other kind of resources).

For example, to import the default Tippy.js style, this line has to be added to our JavaScript:

```javascript
import "tippy.js/dist/tippy.css";
```

> 💡 You can also extract CSS into separate files with the [mini-css-extractor-plugin](https://www.npmjs.com/package/mini-css-extract-plugin)

#### Advanced configuration

webpack it is capable of transforming, bundling, or packaging just about any resource or asset.

If you want to understand and master the wide variety of tools and features that this tool offers, have a look at the [official webpack guides](https://webpack.js.org/guides).

### Images

You can embed inline SVG icons in your views thanks to the `svg_tag` helper:

```ruby
svg_tag(file_name, attributes = {})
```

The `file_name` has to be relative to your images folder. HTML `attributes` (id, class, title, etc.) can be specified directly in the helper.

You can find an example of embedding an SVG document and applying a class attribute in your `source/index.html.erb`:

```erb
<%= svg_tag "logo.svg", class: "middleman-logo" %>
```

The biggest advantage of using inline SVGs is being able to _have complete control over the different shapes using CSS and JavaScript_.

For instance, different shapes composing the avatar in the footer of the documentation website have been animated thanks to this simple script:

```javascript
const mouth1 = document.getElementById("avatar-mouth-1");
const mouth2 = document.getElementById("avatar-mouth-2");

const showSmile = () => {
  mouth1.style.display = "none";
  mouth2.style.display = "block";
};
const showNormal = () => {
  mouth2.style.display = "none";
  mouth1.style.display = "block";
};

window.addEventListener("scroll", () => {
  showSmile();
  setTimeout(showNormal, 500);
});
```

### Building and deploying

Finally, when you are ready to deliver static code, you will need to build the site. Using the command-line, from the project folder, run the correspondent Middleman command:

```bash
$ middleman build
```

This will create a static file for each file located in your source folder, and generate your webpack bundles and favicons.

Any enabled build-time features (such as minification and compression) will be executed. You can find the extensions activated by default in the build-specific configuration section of your `config.rb`.

After building the site you have everything you need within the `build` directory.

A very handy tool to deploy a build is [middleman-deploy](https://github.com/karlfreeman/middleman-deploy). By default, it has been configured to deploy your website on [GitHub Pages](https://pages.github.com) via the `gh-pages` branch, and build the static files before any new deployment.

To activate the extension, simply run from your command-line:

```bash
$ middleman deploy
```

## Extra

### Testing and linters

You can test your code thanks to the [Rake gem](https://github.com/ruby/rake), allowing you to write tests and tasks in standard Ruby syntax.

By default, 3 tasks have been defined, each one testing the style for a specific language (JavaScript, SCSS and Ruby). Run them with the `rake` command:

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen3.png?sanitize=true)

If you are using [Atom](https://atom.io) as text editor, you can use [linter-eslint](https://atom.io/packages/linter-eslint), [linter-rubocop](https://atom.io/packages/linter-rubocop) and [linter-stylelint](https://atom.io/packages/linter-stylelint) to check your style while you write code. If you use [Sublime Text](https://www.sublimetext.com), have a look at the [ESLint](https://packagecontrol.io/packages/ESLint), [RuboCop](https://packagecontrol.io/packages/RuboCop) and [stylelint](https://packagecontrol.io/packages/SublimeLinter-stylelint) extensions.

### 404 page

A 404 page is already provided for you. Use it to display a custom design when visitors attempts to access pages that don’t exist:

![](https://github.com/gabrielecanepa/assets/raw/master/middleman-webpack/screen4.png?sanitize=true)

## Contributing

1.  [Fork the repository](https://github.com/gabrielecanepa/middleman-webpack)
2.  Create your feature branch (`git checkout -b my-new-feature`)
3.  Commit your changes (`git commit -m "Add some feature"`)
4.  Push to the branch (`git push origin my-new-feature`)
5.  Create a new pull request

## License

[![](https://github.com/gabrielecanepa/assets/raw/master/badges/mit.svg?sanitize=true)](https://gabriele.canepa.io/mit)
