import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // serve files from /Public folder
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // get the AudioKit doccarchive path
    let audioKitURL = URL(fileURLWithPath: "\(app.directory.publicDirectory)documentation/AudioKit.doccarchive")
    
    // if our archive exists, enable the DocC middleware.
    if FileManager.default.fileExists(atPath: audioKitURL.path) {
        app.middleware.use(DocCMiddleware(archivePath: audioKitURL))
    }

    // register routes
    try routes(app)
}
