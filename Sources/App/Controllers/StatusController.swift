// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

struct StatusController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        // Returns "true", meant only to be a simple request to ensure that the website is running.
        // This sort of endpoint can be used by automation to ensure a connection before proceeding with other actions.
        routes.get { _ in true }
    }
}
