import Fluent
import Vapor

struct ActorController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let actors = routes.grouped(.actors)
        actors.get(use: index)
        actors.post(use: create)
        actors.group(.actorId) { todo in
            todo.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Actor]> {
        return Actor.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Actor> {
        let actor = try req.content.decode(Actor.self)
        return actor.save(on: req.db).map { actor }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Actor.find(req.parameters.get(.actorId), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
