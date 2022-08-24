import Plot
import PlotVapor

struct ProjectFeed: Component {
    var body: Component {
        Section {
            for project in Project.allCases {
                Div {
                    H3(project.name)
                    Paragraph(project.description)
                    
                    
                    Div {
                        Link("Star", url: project.gitHubURL)
                            .class("github-button")
                            .data(named: "icon", value: "octicon-star")
                            .data(named: "size", value: "large")
                            .data(named: "show-count", value: String(true))
                            .data(named: "color-scheme", value: "no-preference: light; light: light; dark: light;")
                    }
                    .class("github-buttons")
                    
                    Link("View Documentation", url: project.documentationBasePath)
                }
                .class("project")
            }
        }
        .class("project-feed")
    }
}
