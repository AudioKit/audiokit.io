import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
//
//    let urls = Bundle.module.urls(forResourcesWithExtension: ".docc", subdirectory: nil) ?? []
//    let url = Bundle.module.url(forResource: "AudioKit", withExtension: ".docc")!
//    print(url)
//    Bundle.module.url(forResource: nil, withExtension: ".docc")
    
//    let archiveURL = URL(fileURLWithPath: "path/to/docc")
//    print(archiveURL)
    
    let url = URL(fileURLWithPath: "\(app.directory.publicDirectory)/documentation/AudioKit.doccarchive")
    
    app.middleware.use(DocCMiddleware(archivePath: url))

    // register routes
    try routes(app)
}


//https://github.com/JosephDuffy/VaporDocC/blob/main/Sources/Run/main.swift
//var env = try Environment.detect()
//try LoggingSystem.bootstrap(from: &env)
//let app = Application(env)
//defer { app.shutdown() }
//app.http.server.configuration.hostname = "0.0.0.0"
//
//guard let archivePath = ProcessInfo.processInfo.environment["DOCS_ARCHIVE"] else {
//    app.logger.critical("The DOCS_ARCHIVE environment variable is required")
//    exit(1)
//}
//let archiveURL = URL(fileURLWithPath: archivePath)
//
//let redirectRoot = ProcessInfo.processInfo.environment["REDIRECT_ROOT"]
//let redirectMissingTrailingSlash = ProcessInfo.processInfo.environment["REDIRECT_MISSING_TRAILING_SLASH"] == "TRUE"
//
//let middleware = VaporDocCMiddleware(
//    archivePath: archiveURL,
//    redirectRoot: redirectRoot,
//    redirectMissingTrailingSlash: redirectMissingTrailingSlash
//)
//app.middleware.use(middleware)
//try app.run()
