import Fluent

struct CreateActor: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Schema.actors.rawValue)
            .id()
            .field(.name, .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Schema.actors.rawValue).delete()
    }
}
