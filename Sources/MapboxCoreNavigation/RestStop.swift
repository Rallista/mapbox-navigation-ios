import Foundation
import MapboxDirections
import MaplibrePlayground

extension RestStop {
    init(_ serviceArea: RouteAlertServiceAreaInfo) {
        switch serviceArea.type {
        case .kRestArea:
            self.init(type: .restArea)
        case .kServiceArea:
            self.init(type: .serviceArea)
        }
    }
}
