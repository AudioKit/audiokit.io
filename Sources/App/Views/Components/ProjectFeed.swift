// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

struct ProjectFeed: Component {
    var body: Component {
        Div {
            for project in Project.allCases {
                Div {
                    H3(project.name)
                    Paragraph(project.description)
                    Link("Documentation", url: project.documentationBasePath)
                }
                .class("project")
            }
        }
        .class("project-feed")
    }
}
