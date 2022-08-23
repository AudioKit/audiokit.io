import Vapor

func routes(_ app: Application) throws {
    // Registers a controller at the root of the site.
    try app.routes.register(collection: HomeController())
    
    // Register controllers on subpaths.
    try app.routes.grouped("status").register(collection: StatusController())
    
    
    app.get("**") { req -> View in
        if let errorPage = ErrorPage(.notFound) {
            return try await req.plot.render(errorPage)
        } else {
            throw Abort(.notFound)
        }
    }
}
