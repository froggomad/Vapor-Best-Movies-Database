//
//  File 2.swift
//  
//
//  Created by Kenny on 9/13/20.
//

import Fluent

struct CreateMovieActor: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Table.movieActors.rawValue)
        .id()
        .field(Relationship.movieId.rawValue, .uuid, .required,
               .references(Table.movies.rawValue, .id))
        .field(Relationship.actorId.rawValue, .uuid, .required,
               .references(Table.actors.rawValue, .id))
        .create()

    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Table.movieActors.rawValue)
        .delete()
    }


}

