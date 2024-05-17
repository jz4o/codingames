import js from '@eslint/js';
import tseslint from 'typescript-eslint';

export default [
  js.configs.recommended,
  ...tseslint.configs.recommended,
  {
    ignores: ['**/code_golf/**']
  },
  {
    languageOptions: {
      parser: tseslint.parser
    },
    plugins: {
      '@typescript-eslint': tseslint.plugin,
    },
    rules: {
      '@typescript-eslint/no-unused-vars': [
        'error',
        {
          'argsIgnorePattern': '^_',
          'varsIgnorePattern': '^_'
        }
      ],
      'semi': ['error', 'always']
    }
  }
];
