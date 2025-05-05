import js from '@eslint/js';
import tseslint from 'typescript-eslint';

export default [
  js.configs.all,
  ...tseslint.configs.recommended,
  {
    ignores: [
      '**/code_golf/**',
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
          'varsIgnorePattern': '^_',
          'caughtErrorsIgnorePattern': '^_',
        }
      ],
      'arrow-body-style': 'off',
      'capitalized-comments': 'off',
      'id-length': 'off',
      'init-declarations': 'off',
      'max-classes-per-file': 'off',
      'max-lines-per-function': 'off',
      'max-params': 'off',
      'max-statements': 'off',
      'no-bitwise': 'off',
      'no-console': 'off',
      'no-continue': 'off',
      'no-else-return': 'off',
      'no-inline-comments': 'off',
      'no-loop-func': 'off',
      'no-magic-numbers': 'off',
      'no-negated-condition': 'off',
      'no-plusplus': 'off',
      'no-return-assign': 'off',
      'no-ternary': 'off',
      'no-undefined': 'off',
      'no-underscore-dangle': 'off',
      'require-unicode-regexp': 'off',
      'semi': ['error', 'always'],
      'sort-keys': 'off',
      'yoda': 'off',

      // below temporary ignore rules.
      'array-callback-return': 'off',
      'camelcase': 'off',
      'class-methods-use-this': 'off',
      'consistent-return': 'off',
      'curly': 'off',
      'default-case': 'off',
      'dot-notation': 'off',
      'eqeqeq': 'off',
      'func-names': 'off',
      'func-style': 'off',
      'logical-assignment-operators': 'off',
      'new-cap': 'off',
      'no-implicit-coercion': 'off',
      'no-lonely-if': 'off',
      'no-multi-assign': 'off',
      'no-param-reassign': 'off',
      'no-shadow': 'off',
      'no-unmodified-loop-condition': 'off',
      'no-useless-assignment': 'off',
      'no-useless-return': 'off',
      'no-use-before-define': 'off',
      'object-shorthand': 'off',
      'one-var': 'off',
      'operator-assignment': 'off',
      'prefer-arrow-callback': 'off',
      'prefer-destructuring': 'off',
      'prefer-exponentiation-operator': 'off',
      'prefer-named-capture-group': 'off',
      'prefer-numeric-literals': 'off',
      'radix': 'off',
    }
  }
];
