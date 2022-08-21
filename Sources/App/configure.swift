import DocCMiddleware
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    let doccMiddleware = DocCMiddleware(
        documentationDirectory: app.directory.publicDirectory.appending("docs"),
        archives: [
            .init(name: "AudioKit", hostingBasePath: "AudioKit"),
            .init(name: "PianoRoll", hostingBasePath: "PianoRoll"),
        ]
    )
    
    app.middleware.use(doccMiddleware)

    // register routes
    try routes(app)
}
