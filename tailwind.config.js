module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/views/**/*.html.erb',
    './app/components/**/*.rb',
    './app/components/**/*.html.erb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography')
  ]
}


