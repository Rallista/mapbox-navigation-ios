
import Foundation
import MapboxDirections
import MaplibrePlayground

extension TollCollection {
    init(_ tollInfo: RouteAlertTollCollectionInfo) {
        switch tollInfo.type {
        case .kTollBooth:
            self.init(type: .booth)
        case .kTollGantry:
            self.init(type: .gantry)
        }
    }
}
