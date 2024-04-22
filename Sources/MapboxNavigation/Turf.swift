import Foundation
import MapLibre
import Turf

extension Turf.BoundingBox {
    init(coordinateBounds: MLNCoordinateBounds) {
        self.init(southWest: coordinateBounds.sw, northEast: coordinateBounds.ne)
    }
}
