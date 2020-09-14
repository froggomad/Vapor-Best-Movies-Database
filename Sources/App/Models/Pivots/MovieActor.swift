import Foundation
import Fluent
import FluentPostgresDriver

final class MovieActor: Model {

    static let schema = Table.movieActors.rawValue

    @ID(key: .id)
    var id: UUID?

    @Parent(key: .movieRelationship)
    var movie: Movie

    @Parent(key: .actorRelationship)
    var actor: Actor

    init() { }

    init(movieId: UUID, actorId: UUID) {
        self.$movie.id = movieId
        self.$actor.id = actorId
    }

}
