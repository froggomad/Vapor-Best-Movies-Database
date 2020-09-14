//
//  File.swift
//  
//
//  Created by Kenny on 9/13/20.
//

import Fluent
import Vapor

///used to return move and actor in GET and POST requests
struct MovieActorObject: ResponseEncodable {
    func encodeResponse(for req: Request) -> EventLoopFuture<Response> {
        let movie = Movie.find(req.parameters.get(.movieId), on: req.db)
            .unwrap(or: Abort(.notFound))

        let actor = Actor.find(req.parameters.get(.actorId), on: req.db)
            .unwrap(or: Abort(.notFound))

        return movie.and(actor).flatMap { (movie, actor) in
            movie.$actors.get(on: req.db)
        }.transform(to: Response(status: .ok))
    }

    var actor: EventLoopFuture<Actor>
    var movie: EventLoopFuture<Movie>

}

class MovieActorController: RouteCollection {
    // MARK: - Init -
    func boot(routes: RoutesBuilder) throws {
        let movieActors = routes.grouped(.movies, .movieId, .actors, .actorId)
        movieActors.get(use: index)
        movieActors.post(use: create)
        movieActors.group(.actorId) { todo in
            todo.delete(use: delete)
        }
    }

    // MARK: - Read -
    func index(req: Request) throws -> EventLoopFuture<MovieActorObject> {
        let movie = Movie.find(req.parameters.get(.movieId), on: req.db)
            .unwrap(or: Abort(.notFound))

        let actor = Actor.find(req.parameters.get(.actorId), on: req.db)
            .unwrap(or: Abort(.notFound))

        return movie.and(actor).flatMap { (movie, actor) in
            movie.$actors.get(on: req.db)
        }.transform(to: MovieActorObject(actor: actor, movie: movie))
    }

    // MARK: - Create -
    func create(req: Request) throws -> EventLoopFuture<MovieActorObject>{
        let movie = Movie.find(req.parameters.get(.movieId), on: req.db)
            .unwrap(or: Abort(.notFound))

        let actor = Actor.find(req.parameters.get(.actorId), on: req.db)
            .unwrap(or: Abort(.notFound))

        return movie.and(actor).flatMap { (movie, actor) in
            movie.$actors.attach(actor, on: req.db)
        }.transform(to: MovieActorObject(actor: actor, movie: movie))
    }
    // MARK: - Delete -
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let movie = Movie.find(req.parameters.get(.movieId), on: req.db)
            .unwrap(or: Abort(.notFound))

        let actor = Actor.find(req.parameters.get(.actorId), on: req.db)
            .unwrap(or: Abort(.notFound))

        return movie.and(actor).flatMap { (movie, actor) in
            movie.$actors.detach(actor, on: req.db)
                .transform(to: .ok)
        }
    }
}
