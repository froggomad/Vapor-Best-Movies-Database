import Fluent
import Vapor

final class Movie: Model, Content {
    static let schema = Schema.movies.rawValue
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String

    @Siblings(through: MovieActor.self,
              from: \.$movie,
              to: \.$actor)
    var actors: [Actor]

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
