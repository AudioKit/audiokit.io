import DocCMiddleware
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // serve files from /Public folder
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    #warning("Does this really need to be in Public/ though? seems not.")
    let doccMiddleware = DocCMiddleware(
        documentationDirectory: app.directory.publicDirectory.appending("docs"),
        archives: [
            "AudioKit",
            "PianoRoll",
        ]
    )
    
    app.middleware.use(doccMiddleware)

    // register routes
    try routes(app)
}
