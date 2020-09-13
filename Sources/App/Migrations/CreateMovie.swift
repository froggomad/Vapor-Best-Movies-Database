import Fluent

struct CreateMovie: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Table.movies.rawValue)
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("todos").delete()
    }
}

extension FieldKey {
    static var title = FieldKey(stringLiteral: "title")
}

enum Table: String {
    case movies
}
