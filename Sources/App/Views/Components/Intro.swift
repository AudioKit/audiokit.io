import Plot
import PlotVapor

struct Intro: Component {
    var body: Component {
        Section {
            Image("/images/logo.png")
                .class("logo")
            
            H1 {
                Text("Welcome to ")
                Span("AudioKit.io")
                    .class("name")
                Span(".")
            }
            
            Link("Sponsor", url: "https://github.com/sponsors/aure")
                .class("github-button")
                .data(named: "icon", value: "octicon-heart")
                .data(named: "size", value: "large")
        }
        .class("intro")
    }
}
