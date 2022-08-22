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

            Paragraph {
                Text("Your source for AudioKit documentation.")
            }
        }
        .class("intro")
    }
}
