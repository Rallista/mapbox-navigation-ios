import Foundation
import MapboxDirections

/**
 `BorderCrossingInfo` encapsulates a border crossing, specifying crossing region codes.
 */
public struct BorderCrossing {
    public let from: AdministrativeRegion
    public let to: AdministrativeRegion
}
