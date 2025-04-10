module.exports = {
  extends: '@launchpadlab/eslint-config/es6',
  rules: {
    'import/no-unresolved': [
      'error',
      {
        ignore: ['^@hotwired/.*', 'controllers'],
      },
    ],
  },
}
