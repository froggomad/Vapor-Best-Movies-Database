import Fluent
import Vapor

struct MovieController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let movies = routes.grouped(.movies)
        movies.get(use: index)
        movies.post(use: create)
        movies.group(":todoID") { todo in
            todo.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Movie]> {
        return Movie.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Movie> {
        let movie = try req.content.decode(Movie.self)
        return movie.save(on: req.db).map { movie }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Movie.find(req.parameters.get(Parameter.todoID.rawValue), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

enum Parameter: String {
    case todoID
}

extension PathComponent {
    static var movies = PathComponent(stringLiteral: Table.movies.rawValue)
    // MARK: - Parameters -
    static var todoID = PathComponent(stringLiteral: ":\(Parameter.todoID)")
}
