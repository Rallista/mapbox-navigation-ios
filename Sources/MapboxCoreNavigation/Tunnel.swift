import Foundation

/**
 `Tunnel` is used for naming incoming tunnels, together with route alerts.
 */
public struct Tunnel {
    /**
     The name of the tunnel.
     */
    public let name: String?
    
    public init(name: String?) {
        self.name = name
    }
}
