const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
   './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  darkMode: 'false',
  theme: {
    extend: {
      screens: {
        sm: '640px',
        md: '768px',
        lg: '1024px',
        xl: '1280px',
        '2xl': '1536px',
      },
      fontFamily: {
        // sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        sans: ['-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, ".Noto Sans", sans-serif'],
      },
      fontSize: {
        sm: ['0.75rem', { lineHeight: '1.25rem' }],
        DEFAULT: ['0.875rem', { lineHeight: '1.375rem' }],
        lg: ['1rem', { lineHeight: '1.5rem' }],
        xl: ['1.25rem', { lineHeight: '1.75rem' }],
        h3: ['1.5rem', { lineHeight: '2rem' }],
        h2: ['1.875rem', { lineHeight: '2.375rem' }],
        h1: ['2.375rem', { lineHeight: '2.875rem' }],
      },
      borderRadius: {
        none: '0',
        xs: '0.125rem',
        sm: '0.25rem',
        DEFAULT: '0.375rem',
        lg: '0.5rem',
      },
      padding: {
        ...defaultTheme.spacing,
        xxs: '0.25rem',
        xs: '0.5rem',
        sm: '0.75rem',
        DEFAULT: '1rem',
        md: '1.25rem',
        lg: '1.5rem',
        xl: '2rem',
      },
      margin: {
        ...defaultTheme.spacing,
        xxs: '0.25rem',
        xs: '0.5rem',
        sm: '0.75rem',
        DEFAULT: '1rem',
        md: '1.25rem',
        lg: '1.5rem',
        xl: '2rem',
        xxl: '3rem',
      },
      colors: {
        transparent: 'transparent',
        primary: {
          100: 'var(--rp-color-primary-bg, #d8edf0)',
          200: 'var(--rp-color-primary-bg-hover, #a6d9e3)',
          300: 'var(--rp-color-primary-border, #7ac4d6)',
          400: 'var(--rp-color-primary-border-hover, #53aec9)',
          DEFAULT: 'var(--rp-color-primary, #0f7faf)',
          500: 'var(--rp-color-primary-hover, #2f97bd)',
          600: 'var(--rp-color-primary-active, #065e8a)',
        },
        success: {
          100: 'var(--rp-color-success-bg, #e6fff4)',
          200: 'var(--rp-color-success-bg-hover, #a2fad8)',
          300: 'var(--rp-color-success-border, #74edc3)',
          400: 'var(--rp-color-success-border-hover, #4ae0b1)',
          DEFAULT: 'var(--rp-color-success, #01c794)',
          500: 'var(--rp-color-success-hover, #24d4a2)',
          600: 'var(--rp-color-success-active, #00a17e)',
        },
        danger: {
          100: 'var(--rp-color-danger-bg, #fff4f0)',
          200: 'var(--rp-color-danger-bg-hover, #ffe8e0)',
          300: 'var(--rp-color-danger-border, #ffc6b8)',
          400: 'var(--rp-color-danger-border-hover, #ffa28f)',
          DEFAULT: 'var(--rp-color-danger, #f04a39)',
          500: 'var(--rp-color-danger-hover, #fc7965)',
          600: 'var(--rp-color-danger-active, #c93126)',
        },
        warning: {
          100: 'var(--rp-color-warning-bg, #fff7e6)',
          200: 'var(--rp-color-warning-bg-hover, #ffe4b3)',
          300: 'var(--rp-color-warning-border, #ffd28a)',
          400: 'var(--rp-color-warning-border-hover, #ffbd61)',
          DEFAULT: 'var(--rp-color-warning, #f4850f)',
          500: 'var(--rp-color-warning-hover, #ffa538)',
          600: 'var(--rp-color-warning-active, #cf6502)',
        },
        white: {
          DEFAULT: '#fff',
        },
        black: {
          DEFAULT: '#000',
        },
        grayscale: {
          text: {
            100: "rgba(0, 0, 0, 0.88)", // colorText
            200: "rgba(0, 0, 0, 0.65)", // colorTextSecondary
            300: "rgba(0, 0, 0, 0.45)", // colorTextTertiary
            400: "rgba(0, 0, 0, 0.25)", // colorTextQuaternary
            500: "rgba(255, 255, 255, 0.85)", // colorTextInverted
            600: "rgba(255, 255, 255, 0.65)", // colorTextSecondaryInverted
            700: "rgba(255, 255, 255, 0.45)", // colorTextTertiaryInverted
            800: "rgba(255, 255, 255, 0.25)", // colorTextQuaternaryInverted
          },
          border: {
            100: "#d9d9d9", // colorBorder
            200: "#f0f0f0", // colorBorderSecondary
            300: "#424242", // colorBorderDark
            400: "#303030", // colorBorderSecondaryDark
          },
          fill: {
            100: "rgba(0, 0, 0, 0.15)", // colorFill
            200: "rgba(0, 0, 0, 0.06)", // colorFillSecondary
            300: "rgba(0, 0, 0, 0.04)", // colorFillTertiary
            400: "rgba(0, 0, 0, 0.02)", // colorFillQuaternary
            500: "rgba(255, 255, 255, 0.15)", // colorFillInverted
            600: "rgba(255, 255, 255, 0.06)", // colorFillSecondaryInverted
            700: "rgba(255, 255, 255, 0.04)", // colorFillTertiaryInverted
            800: "rgba(255, 255, 255, 0.02)", // colorFillQuaternaryInverted
          },
          background: {
            100: "#fff", // colorBackground && colorBgElevated
            200: "#f5f5f5", // colorBgLayout
            300: "rgba(0, 0, 0,0.85)", // colorBgSpotlight
            400: "rgba(0, 0, 0, 0.45)", // colorBgMask
            500: "#141414", // colorBgDark
            600: "#1f1f1f", // colorBgElevated
            700: "#000000", // colorBgLayout
            800: "#424242", // colorBgSpotlight
          },
        },
      },
      height: {
        'screen-minus-112': 'calc(100vh - 112px)',
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin'),
  ]
}
