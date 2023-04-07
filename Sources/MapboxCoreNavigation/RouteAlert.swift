import Foundation
import CoreLocation
import MapboxDirections

/**
 `RouteAlert` encapsulates information about various incoming events. Common attributes like location, distance to the event, length and other is provided for each POI, while specific meta data is supplied via `alert` property.
 */
public struct RouteAlert {
    /// Enumeration used for encapsulating additional details to describe specific type of alert
    public enum Alert {
        /// Incident alert with details
        case incident(Incident)
        /// Tunnel alert with details
        case tunnel(Tunnel)
        /// Border alert crossing with details
        case borderCrossing(BorderCrossing)
        /// Toll collect alert with details
        case tollCollection(TollCollection)
        /// Service area alert with details
        case serviceArea(RestStop)
        /// Restricted area alert
        case restrictedArea
    }
    
    /// Alert data with specific info. Contents depend on exact alert type.
    public let alert: Alert
    
    /// Distance to route alert relative to start of the route, meters.
    public let distance: CLLocationDistance
    /**
     Distance from current position to alert, meters.
     
     This value can be negative if it is a spanned alert and we are somewhere in the middle of it.
     */
    public let distanceToStart: CLLocationDistance
    /**
     Length of the alert info.
     
     This value will be non-null for composite route alerts */
    public let length: CLLocationDistance?
    
    /// Coordinate of route alert beginning point
    public let beginCoordinate: CLLocationCoordinate2D
    /// Coordinate of route alert ending point
    public let endCoordinate: CLLocationCoordinate2D
    
    /// Segment index in corresponding `Route.shape` where this alert begins.
    public let beginSegmentIndex: UInt32
    /// Segment index in corresponding `Route.shape` where this alert ends.
    public let endSegmentIndex: UInt32
}
