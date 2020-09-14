import Fluent

struct CreateActor: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Table.actors.rawValue)
            .id()
            .field(.title, .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Schema.actors.rawValue).delete()
    }
}
