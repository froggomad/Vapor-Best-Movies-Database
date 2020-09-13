import Fluent
import Vapor

final class Movie: Model, Content {
    static let schema = Table.movies.rawValue
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
