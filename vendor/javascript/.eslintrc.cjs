/* eslint-env node */
module.exports = {
  extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  root: true,
  'ignorePatterns': [
    '**/code_golf'
  ],
  'rules': {
    '@typescript-eslint/no-unused-vars': [
      'error',
      {
        'argsIgnorePattern': "^_",
        'varsIgnorePattern': "^_"
      }
    ],
    'semi': ['error', 'always']
  }
};
