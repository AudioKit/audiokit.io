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

// TODO: This would be easy enough to automate with the GitHub API.
// TODO: This list could benefit from some safety around which .doccarchive files actually exist on the system.
extension Project: CaseIterable {
    static var allCases: [Self] = [
        .init(
            name: "AudioKit",
            description: "Swift audio synthesis, processing, & analysis platform for iOS, macOS and tvOS"
        ),
        .init(
            name: "AudioKitEX",
            description: "C-backed AudioKit DSP"
        ),
        .init(
            name: "AudioKitUI",
            description: "Controls and Visualization for AudioKit apps"
        ),
        .init(
            name: "Controls",
            description: "SwiftUI Knobs, Sliders, X-Y Pads, and more"
        ),
        .init(
            name: "DevoloopAudioKit",
            description: "Guitar amp sim and tube emulation"
        ),
        .init(
            name: "DunneAudioKit",
            description: "Sampler instrument and Chorus, Flanger and Stereo Delay Effects"
        ),
        .init(
            name: "Flow",
            description: "Generic node graph editor"
        ),
        .init(
            name: "Keyboard",
            description: "SwiftUI music keyboard"
        ),
        .init(
            name: "Microtonality",
            description: "Microtonal Tuning Tables"
        ),
        .init(
            name: "PianoRoll",
            description: "Touch-oriented piano roll for iOS and macOS"
        ),
        .init(
            name: "SoundpipeAudioKit",
            description: "Oscillators, effects, filters, reverbs and more"
        ),
        .init(
            name: "SporthAudioKit",
            description: "AudioKit Operations (Sporth) extension"
        ),
        .init(
            name: "STKAudioKit",
            description: "Physical models of musical instruments"
        ),
        .init(
            name: "Tonic",
            description: "Swift library for music theory"
        ),
        .init(
            name: "Waveform",
            description: "GPU accelerated SwiftUI waveform view"
        ),
    ]
}
