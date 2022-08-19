import Vapor

struct GenerateDocumentationCommand: Command {
    private static let gitHubURL = URL(string: "https://github.com")!
    
    struct Signature: CommandSignature { }
    
    var help: String = "Generates DocC documentation archives."
    
    private let fileManager = FileManager.default

    func run(using context: CommandContext, signature: Signature) throws {
        let workingDirectory = context.application.directory.workingDirectory
        let publicDirectory = context.application.directory.publicDirectory
        let documentationDirectory = publicDirectory.appending("documentation")
        let codeGenDirectory = workingDirectory.appending("DocGen")
        
        try self.fileManager.removeItem(atPath: documentationDirectory)
        try self.fileManager.createDirectory(atPath: documentationDirectory, withIntermediateDirectories: true)
        
        try self.cloneGitHubRepositories(
            [
                "AudioKit",
            ],
            organization: "AudioKit",
            outputDirectory: documentationDirectory,
            workingDirectory: codeGenDirectory
        )
    }
    
    private func cloneGitHubRepositories(_ repositories: [String], organization: String, outputDirectory: String, workingDirectory: String) throws {
        try repositories.forEach { repo in
            try self.cloneGitHubRepository(repo, organization: organization, outputDirectory: outputDirectory, workingDirectory: workingDirectory)
        }
    }
    
    private func cloneGitHubRepository(_ repository: String, organization: String, outputDirectory: String, workingDirectory: String) throws {
        let repositoryURL = Self.gitHubURL.appendingPathComponent(organization).appendingPathComponent(repository)
        let outputPath = outputDirectory.appending("/\(repository).doccarchive")
        
        #warning("repository should be replaced with product in some parts of this command")
        
        print(workingDirectory)
        
        let command = """
        cd \(workingDirectory) &&
        swift package --allow-writing-to-directory '\(outputDirectory)' \
            generate-documentation --product '\(repository)' --output-path '\(outputPath)' \
            --hosting-base-path '\(repository)'
        """
        
//        let command = """
//        git clone \(repositoryURL.absoluteString) &&
//        cd \(repository) &&
//        swift package --allow-writing-to-directory '\(outputDirectory)' \
//            generate-documentation --product '\(repository)' --output-path '\(outputPath)' \
//            --hosting-base-path '\(repository)'
//        """
        
        // keeping this comment around just to see which is better later on
        // --transform-for-static-hosting
        
        try ConfiguredProcess.bash(command: command).run()
    }
}
