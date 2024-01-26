const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      colors: {
        "midnight-green": "#0E3E50",
        "midnight-green-100": "#23A3D1",
        "midnight-green-200": "#2195C0",
        "midnight-green-300": "#1E88AE",
        "midnight-green-400": "#1B7A9D",
        "midnight-green-500": "#186D8C",
        "midnight-green-600": "#155F79",
        "midnight-green-700": "#125168",
        "midnight-green-800": "#0E3E50",
        "midnight-green-900": "#0D3849",
      },
      fontFamily: {
        serif: ["Cormorant Garamond", ...defaultTheme.fontFamily.serif],
        sans: ["Lato", ...defaultTheme.fontFamily.sans],
      },
    },
    plugins: [
      require("@tailwindcss/forms"),
      require("@tailwindcss/aspect-ratio"),
      require("@tailwindcss/typography"),
      require("@tailwindcss/container-queries"),
    ],
  },
};
