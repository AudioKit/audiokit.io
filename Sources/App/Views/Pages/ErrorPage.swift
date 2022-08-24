import Plot
import PlotVapor
import Vapor

struct ErrorPage: TemplatedPage {
    let title: String
    let message: String

    var content: Component {
        Div {
            Div {
                Image("/images/logo.png")
                    .class("logo")
                
                H1 {
                    Text(self.title)
                }
                
                Paragraph(self.message)
                
                Link("Take me back home!", url: "/")
            }
            .class("error")
        }
        .class("container")
    }
    
    /// Initializes an `ErrorPage` with a given title and message.
    /// - Parameters:
    ///   - title: The title to display, both for the URL bar and the view.
    ///   - message: The message to display in the view.
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    /// Initializes an `ErrorPage` using defaults based off of an `HTTPResponseStatus`.
    /// If the `HTTPResponseStatus` does not have valid defaults, the initializer will return `nil`.
    /// - Parameter status: The `HTTPResponseStatus` to fetch defaults for.
    init?(_ status: HTTPResponseStatus) {
        switch status {
        case .notFound:
            self.title = "Page Not Found"
            self.message = "The AudioKit web site is in the middle of a great overhaul, so things may have moved around a bit, but there's a lot of great stuff on this server, and more to come."
        default:
            return nil
        }
    }
}
