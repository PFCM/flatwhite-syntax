settings =
  config:
    mode:
      title: 'Light or dark mode'
      description: 'Choose which mode: light or dark. Sometimes this switch does not work properly -- you may have to restart atom :(.'
      type: 'string'
      default: 'dark'
      enum: ['dark', 'light']

module.exports = settings
