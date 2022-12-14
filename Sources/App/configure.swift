import DocCMiddleware
import Vapor

// Configures our application.
public func configure(_ app: Application) throws {
    // Enable serving of files out of the Public/ directory, such as css and js.
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // Map our projects to DocC archive definitions.
    let archives: [DocCArchive] = Project.allCases.filter(\.isVisible).map {
        .init(name: $0.name, hostingBasePath: $0.documentationBasePath)
    }

    // Define our DocC Middleware for serving up .doccarchive documentation.
    let doccMiddleware = DocCMiddleware(app: app, archives: archives)
    
    // Enable the DocC middleware.
    app.middleware.use(doccMiddleware)

    // Register our routes.
    try routes(app)
}
