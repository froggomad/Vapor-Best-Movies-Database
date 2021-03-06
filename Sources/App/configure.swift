import Fluent
import FluentPostgresDriver
import Vapor
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // Serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)

    let hostName = "localhost"
    let userName = "postgres"
    let dbName = "best_movies_db"

    if let databaseURL = Environment.get("DATABASE_URL") {
        app.databases.use(try .postgres(
            url: databaseURL
            ), as: .psql)
    } else {
        app.databases.use( .postgres(
            hostname: Environment.get("DATABASE_HOST") ?? hostName,
            username: Environment.get("DATABASE_USERNAME") ?? userName,
            password: Environment.get("DATABASE_PASSWORD") ?? "",
            database: Environment.get("DATABASE_NAME") ?? dbName
            ), as: .psql)
    }

    

    app.migrations.add(CreateMovie())
    app.migrations.add(CreateActor())
    app.migrations.add(CreateMovieActor())

    // register routes
    try routes(app)
}
