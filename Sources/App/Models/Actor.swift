import Fluent
import Vapor

final class Actor: Model, Content {
    static let schema = Table.movies.rawValue

    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String

    @Siblings(through: MovieActor.self,
              from: \.$actor,
              to: \.$movie)
    var movies: [Movie]

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
