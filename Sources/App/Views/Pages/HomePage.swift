import Plot
import PlotVapor
import Vapor

struct HomePage: TemplatedPage {
    let title = "Home"

    var content: Component {
        ComponentGroup {
            Script(path: "/js/insertmenu.js")
            Div {
                Intro()
                ProjectFeed()
                Footer()
            }
            .class("container")
        }
    }
}
