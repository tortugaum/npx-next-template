# Configuração de projeto NEXT

### Criação do Projeto
Para criar um projeto basta abrir o CMD na pasta mãe onde seus projetos ficam e digitar
`npx create-next-app`

Na sequência algumas perguntas aparecem e você deve configurar conforme o projeto
### Configuração de plugins/libs

Importar o **eslint** e o **plugin react-hooks**
Desabilitar a regra `react-in-jsx-scope` pois o next vem com o react injetado em tudo global.

É necessário ajustar a config do eslint para adicionar o plugin **react-hook**

Instalar o prettier e configurar as flags
É importante baixar o **eslint-plugin-prettier** e **eslint-config-prettier** para integrar ambos

Exemplo de configuração eslint:

**Rules**
```
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
```
**Plugins**
```
  "plugins": ["@typescript-eslint", "react", "react-hooks", "eslint-plugin-import-helpers"],
```

**Extends**
```
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react/recommended",
    "plugin:prettier/recommended",
    "prettier"
  ],
```
