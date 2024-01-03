# Study Flow
![image](https://github.com/WemersonDamasceno/study-flow/assets/37156004/8d0a4d0a-d2ed-4742-8d33-923db06a7b49)


App para uso da tecnica de Pomodoro.

---

## Arquitetura 🚀

Esse projeto trabalha com o conceito de arquitetura limpa, separando o projeto em três camadas principais:

- data
- domain
- presentation

![architecture_link]

## Presentation
É a camada de interação com o usuário. Você obviamente precisa de widgets para exibir algo na tela. Esses widgets então despacham eventos para o Bloc ou são acionados por métodos e um Cubit e escutam os estados.

## Domain

Ele conterá apenas a lógica de negócios principal (use cases) e objetos de negócios (entities). Deve ser totalmente independente de todas as outras camadas.

## Data

A camada de "data" consiste em uma implementação de "repository" (o contrato vem da camada de "domain") e "data sources" - uma geralmente é para obter dados "remote" (API) e a outra para armazenar em cache esses dados. O repository é onde você decide se deseja retornar dados atualizados ou armazenados em cache, quando armazená-los em cache e assim por diante.


## Estrutura do projeto

```
├── lib
|   ├── data
│   │   ├── datasources
|   |   └── models
│   │   └── repositories
|   ├── domain
│   │   ├── entities
|   |   └── usecases
│   │   └── repositories
|   ├── presentation
│   │   ├── bloc
│   │   │   └── bloc.dart
|   |   |   └── event.dart
|   |   |   └── state.dart
|   |   └── models
|   |   |   └── models.dart
│   │   └── view
│   │   |   ├── page.dart
|   |   |   └── view.dart
|   |   └── widgets
|   |   |   └── widget.dart
│   ├── app.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
```

### O que esta incluso no projeto? 📦


✅&nbsp; [Bloc][bloc_link] - Bloc architecture para código escalável e testável que oferece uma separação clara entre lógica de negócios e apresentação

✅&nbsp; [Testing][testing_link] - Testes Unitários e Widgets

✅&nbsp; [Continuous Integration][github_actions_link] - Lint, format, test, e aplicação de code coverage usando [GitHub Actions][github_actions_link]



[architecture_link]: https://raw.githubusercontent.com/ResoCoder/flutter-tdd-clean-architecture-course/master/architecture-proposal.png
[bloc_link]: https://bloclibrary.dev
[github_actions_link]: https://github.com/features/actions
[testing_link]: https://flutter.dev/docs/testing
