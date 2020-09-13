# Initial Setup

1. Start Postgres
  - open Postgres app, double click database
2. Create
  `=#` CREATE DATABASE my_cool_db_name;
    refresh postgres app to verify db was created
3. Vapor App (Swift/Xcode)

  a. Model
    use Todo.swift as template (comes with project)
  b. Controller
    use TodoController.swift as template
  c. Register routes
    routes.swift
      try app.register(collection: MyCoolController())
  d. Migration
    use CreateTodo as template
      struct CreateMyCoolModel { }
  e. Configure
    configure.swift
      app.migrations.add(CreateMyCoolModel())

4. Terminal
  `$:` vapor run migrate

Make some popcorn, it takes a minute
