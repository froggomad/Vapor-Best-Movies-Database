//
//  File.swift
//  
//
//  Created by Kenny on 9/13/20.
//

import Fluent
import Vapor

typealias Schema = Table

extension FieldKey {
    // MARK: - Columns -
    static var title = Column.title.rawValue
    static var name = Column.name.rawValue

    // MARK: - Relationships -
    static var movieRelationship = Relationship.movieId.rawValue
    static var actorRelationship = Relationship.actorId.rawValue
}

enum Table: String {
    case movies
    case actors
    case movieActors
}

enum Column: FieldKey {
    case title
    case body
    case name
}

extension PathComponent {
    static var movies = PathComponent(stringLiteral: Table.movies.rawValue)
    static var actors = PathComponent(stringLiteral: Table.actors.rawValue)
    // MARK: - Parameters -
    static var movieId = PathComponent(stringLiteral: ":\(Relationship.movieId.rawValue)")
    static var actorId = PathComponent(stringLiteral: ":\(Relationship.actorId.rawValue)")
}

enum Relationship: FieldKey {
    case movieId = "movie_id"
    case actorId = "actor_id"
}

extension String {
    static var movieId: String {
        Relationship.movieId.rawValue.description
    }

    static var actorId: String {
        Relationship.actorId.rawValue.description
    }
}
