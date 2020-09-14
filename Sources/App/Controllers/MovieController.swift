import Fluent
import Vapor

struct MovieController: RouteCollection {
    // MARK: - Init -
    func boot(routes: RoutesBuilder) throws {
        let movies = routes.grouped(.movies)
        movies.get(use: index)
        movies.post(use: create)
        movies.group(.movieId) { todo in
            todo.delete(use: delete)
        }
    }

    // MARK: - Read -
    func index(req: Request) throws -> EventLoopFuture<[Movie]> {
        return Movie.query(on: req.db).with(\.$actors).all()
    }

    // MARK: - Create -
    func create(req: Request) throws -> EventLoopFuture<Movie> {
        let movie = try req.content.decode(Movie.self)
        return movie.save(on: req.db).map { movie }
    }

    // MARK: - Delete -
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Movie.find(req.parameters.get(.movieId), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

