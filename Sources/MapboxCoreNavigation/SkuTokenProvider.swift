import Foundation
import MapboxDirections
import MaplibrePlayground

class SkuTokenProvider: SkuTokenSource {
    var peer: MBXPeerWrapper?

    private var directionCredentials: DirectionsCredentials
    
    init(with credentials: DirectionsCredentials) {
        directionCredentials = credentials
    }
    
    func getToken() -> String {
        return directionCredentials.skuToken ?? ""
    }
}
