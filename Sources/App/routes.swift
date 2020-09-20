import Fluent
import Vapor

extension String {

    enum RoutePath: String {
        case index
    }

    static func path(_ name: RoutePath) -> String {
        name.rawValue
    }
}

extension PathComponent {
    static let index = PathComponent(stringLiteral: .path(.index))
}

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        req.view.render(.path(.index))
    }

    try app.register(collection: MovieController())
    try app.register(collection: ActorController())
    try app.register(collection: MovieActorController())
}
