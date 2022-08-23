import Plot
import PlotVapor
import Vapor

struct HomePage: TemplatedPage {
    let title = "Home"

    var content: Component {
        Div {
            Intro()
            ProjectFeed()
            Footer()
        }
        .class("container")
    }
}
