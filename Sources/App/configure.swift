import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // serve files from /Public folder
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    let audioKitURL = URL(fileURLWithPath: "\(app.directory.publicDirectory)documentation/AudioKit.doccarchive")
    
    app.middleware.use(DocCMiddleware(archivePath: audioKitURL))

    // register routes
    try routes(app)
}
