import Plot
import PlotVapor

/// Component used to render an `<script>` element for running some javascript.
public struct Script: Component {
    /// Path to javascript
    public var path: String

    /// Create a new image instance.
    /// - parameters:
    ///   - path: Path to javascript
    public init(path: String) {
        self.path = path
    }

    public var body: Component {
        Node<HTML.BodyContext>.script(.src(path))
    }
}
