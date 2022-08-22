struct Project {
    let name: String
    let description: String
    let documentationBasePath: String
    let gitHubURL: String
    let isVisible: Bool
    
    init(name: String, description: String, documentationBasePath: String, gitHubURL: String, isVisible: Bool = true) {
        self.name = name
        self.description = description
        self.documentationBasePath = documentationBasePath
        self.gitHubURL = gitHubURL
        self.isVisible = isVisible
    }
    
    init(name: String, description: String, isVisible: Bool = true) {
        self.init(
            name: name,
            description: description,
            documentationBasePath: name,
            gitHubURL: "https://github.com/AudioKit/\(name)",
            isVisible: isVisible
        )
    }
}

// MARK: - Extensions

// TODO: This would be easy to automate with the GitHub API. For now, we'll keep it static.
extension Project: CaseIterable {
    static var allCases: [Self] = [
        .init(
            name: "AudioKit",
            description: "Swift audio synthesis, processing, & analysis platform for iOS, macOS and tvOS"
        ),
        .init(
            name: "PianoRoll",
            description: "Touch oriented piano roll for iOS and macOS"
        ),
        .init(
            name: "Tonic",
            description: "Swift library for music theory"
        ),
        .init(
            name: "Keyboard",
            description: "SwiftUI music keyboard"
        ),
    ]
}
