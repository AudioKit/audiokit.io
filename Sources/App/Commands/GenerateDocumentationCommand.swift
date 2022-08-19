import Vapor

struct GenerateDocumentationCommand: Command {
    struct Signature: CommandSignature { }
    
    var help: String = "Generates DocC documentation archives."
    
    private let fileManager = FileManager.default

    func run(using context: CommandContext, signature: Signature) throws {
        
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
        
        try ConfiguredProcess.bash(command: command).run()
    }
}
