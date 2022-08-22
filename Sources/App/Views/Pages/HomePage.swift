// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import PlotVapor
import Vapor

struct HomePage: TemplatedPage {
    let title = "Home"

    var content: Component {
        ComponentGroup {
            Div {
                Intro()
                
                ProjectFeed()
                
                Footer()
            }
            .class("container")
        }
    }
}
