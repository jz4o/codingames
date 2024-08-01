import js from '@eslint/js';
import tseslint from 'typescript-eslint';

export default [
  js.configs.recommended,
  ...tseslint.configs.recommended,
  {
    ignores: [
      '**/code_golf/**',
      'typescript/practice/classic_puzzle/easy/onboarding.ts',
      'typescript/practice/classic_puzzle/easy/pirates-treasure.ts',
      'typescript/practice/classic_puzzle/medium/winamax-battle.ts',
    ]
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
