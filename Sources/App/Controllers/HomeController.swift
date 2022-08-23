import PlotVapor
import Vapor

final class HomeController {
    private func home(req: Request) async throws -> View {
        try await req.plot.render(HomePage())
    }
}

// MARK: - Extensions

extension HomeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: self.home)
    }
}
