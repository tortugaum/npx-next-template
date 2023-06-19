#!/bin/bash

# Verificar se o nome do arquivo foi fornecido como argumento
if [ -z "$1" ]
  then
    echo "Por favor, forneça o nome do projeto como argumento"
    exit 1
fi

# Atribuir o nome do projeto a uma variável
projectName=$1

# Criar o diretório do projeto
mkdir $projectName

# Acessar o diretório do projeto
cd $projectName

# Criar o projeto Next.js com TypeScript
npx create-next-app . --ts

# Remover o arquivo do Tailwind CSS
rm -rf styles/tailwind.css

# Instalar as dependências adicionais
npm install --save-dev eslint-plugin-react-hooks eslint-plugin-prettier eslint-config-prettier eslint-plugin-import-helpers @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-react prettier

# Criar o arquivo .eslintrc.json
cat > .eslintrc.json <<EOF
{
  "env": {
    "browser": true,
    "es2021": true
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  },
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react/recommended",
    "plugin:prettier/recommended",
    "prettier"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module"
  },
  "plugins": ["@typescript-eslint", "react", "react-hooks", "eslint-plugin-import-helpers"],
  "rules": {
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "warn",
    "react/react-in-jsx-scope": "off",
    "prettier/prettier": "error",
    "import-helpers/order-imports": [
      "warn",
      {
        "newlinesBetween": "always",
        "groups":[
          ["/^react/",
          "/^next/","/@next/"],
          "/^components/",
          "module",
          "/^@shared/",
          ["parent","sibling","index"]
        ],
        "alphabetize": { "order": "asc", "ignoreCase" : true}
      }
    ]
  }
}
EOF

# Criar a pasta .vscode
mkdir .vscode

# Criar o arquivo settings.json dentro da pasta .vscode
cat > .vscode/settings.json <<EOF
{
  "editor.formatOnSave": false,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
EOF

# Criar o arquivo .prettierrc
cat > .prettierrc <<EOF
{
  "trailingComma": "none",
  "semi": true,
  "singleQuote": true
}
EOF