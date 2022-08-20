import Vapor

public struct DocCArchive {
    /// The relative directory for this archive.
    let archiveDirectory: String
    
    /// The name of the `.doccarchive`.
    ///
    /// (eg. The name of `MyPackage.doccarchive` would be `"MyPackage"`.
    let archiveName: String
    
    /// The base path for the archive. This is a relative path to your website, which is where your `.doccarchive` expects to serve files from.
    /// This is set via the `--hosting-base-path` option when generating a `.doccarchive`.
    ///
    /// (eg. If you used `--hosting-base-path MyPackage` to generate your `.doccarchive`,
    /// then your `.doccarchive` will serve files from `localhost:8080/MyPackage/`.)
    let hostingBasePath: String
    
    /// Whether or not the archive is static.
    /// This is set via the `--transform-for-static-hosting` option when generating a `.doccarchive`.
    ///
    /// **NOTE: This is currently not configurable, but the property will remain to ensure I remember to implement it at some point.**
    let isStatic: Bool = false
    
    /// The path to the `.doccarchive` on disk, relative to the `documentationDirectory` set when initializing a `DocCMiddleware`.
    let archivePath: String
    
    public init(name: String, directory: String = "", hostingBasePath: String? = nil) {
        self.archiveName = name
        self.archiveDirectory = directory
        self.hostingBasePath = hostingBasePath ?? name
        
        let filename = "\(self.archiveName).doccarchive"
        
        if directory.isEmpty {
            self.archivePath = filename
        } else {
            self.archivePath = "\(directory.trimmingTrailingSlashes())/\(filename)"
        }
    }
}

extension DocCArchive: ExpressibleByStringLiteral, ExpressibleByStringInterpolation {
    public init(stringLiteral value: StringLiteralType) {
        self.init(name: value)
    }
}
