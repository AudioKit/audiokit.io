import Vapor

func routes(_ app: Application) throws {
    // Registers a controller at the root of the site.
    try app.routes.register(collection: HomeController())
    
    // Register controllers on subpaths.
    try app.routes.grouped("status").register(collection: StatusController())
}
