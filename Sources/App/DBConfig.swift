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

enum Parameter: String {
    case movieId
}

extension PathComponent {
    static var movies = PathComponent(stringLiteral: Table.movies.rawValue)
    // MARK: - Parameters -
    static var movieId = PathComponent(stringLiteral: ":\(Parameter.movieId)")
}

enum Relationship: FieldKey {
    case movieId = "movie_id"
    case actorId = "actor_id"
}
