//
//  RouteAttributes.swift
//  
//
//  Created by Jacob Fielding on 2/6/23.
//

import Foundation
import CoreLocation

public enum RouteState {
    case invalid
    case initialized
    case tracking
    case complete
    case offRoute
    case stale
    case uncertain
}

public struct RouteAlertAdminInfo {
    
    public var iso_3166_1: String
    public var iso_3166_1_alpha3: String
}

public class RouteAlertTollCollectionInfo {
    
    public enum TollCollectionType {
        case kTollBooth
        case kTollGantry
    }
    
    public var type: TollCollectionType
    
    public init(type: TollCollectionType) {
        self.type = type
    }
}

public class RouteAlertTunnelInfo {
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}

public class RouteAlertServiceAreaInfo {
    
    public enum ServiceAreaType {
        case kRestArea
        case kServiceArea
    }
    
    public var type: ServiceAreaType
    
    public init(type: ServiceAreaType) {
        self.type = type
    }
}

public class RouteAlertIncidentInfo {
    
    public enum IncidentType {
        case kAccident
        case kCongestion
        case kConstruction
        case kDisabledVehicle
        case kLaneRestriction
        case kMassTransit
        case kMiscellaneous
        case kOtherNews
        case kPlannedEvent
        case kRoadClosure
        case kRoadHazard
        case kWeather
    }
    
    public var id: String
    public var type: IncidentType
    public var description: String?
    public var creationTime: Date?
    public var startTime: Date?
    public var endTime: Date?
    public var impact: String?
    public var subType: String?
    public var subTypeDescription: String?
    public var alertcCodes: [IntValue]
    public var lanesBlocked: [String]
    
    public init(id: String,
                type: IncidentType,
                description: String? = nil,
                creationTime: Date? = nil,
                startTime: Date? = nil,
                endTime: Date? = nil,
                impact: String? = nil,
                subType: String? = nil,
                subTypeDescription: String? = nil,
                alertcCodes: [IntValue],
                lanesBlocked: [String]) {
        
        self.id = id
        self.type = type
        self.description = description
        self.creationTime = creationTime
        self.startTime = startTime
        self.endTime = endTime
        self.impact = impact
        self.subType = subType
        self.subTypeDescription = subTypeDescription
        self.alertcCodes = alertcCodes
        self.lanesBlocked = lanesBlocked
    }
}

public class RouteAlertBorderCrossingInfo {
    public var from: RouteAlertAdminInfo
    public var to: RouteAlertAdminInfo
    
    public init(from: RouteAlertAdminInfo, to: RouteAlertAdminInfo) {
        self.from = from
        self.to = to
    }
}

public class UpcomingRouteAlert {
    
    public enum AlertType {
        case kIncident
        case kTunnelEntrance
        case kBorderCrossing
        case kTollCollectionPoint
        case kServiceArea
        case kRestrictedArea
    }
    
    public class Alert {
        public var distance: Double
        public var length: DoubleValue?
        public var beginCoordinate: CLLocationCoordinate2D
        public var endCoordinate: CLLocationCoordinate2D
        public var beginGeometryIndex: UInt32
        public var endGeometryIndex: UInt32
        public var type: AlertType
        
        public var incidentInfo: RouteAlertIncidentInfo?
        public var tunnelInfo: RouteAlertTunnelInfo?
        public var borderCrossingInfo: RouteAlertBorderCrossingInfo?
        public var tollCollectionInfo: RouteAlertTollCollectionInfo?
        public var serviceAreaInfo: RouteAlertServiceAreaInfo?
        
        init(distance: Double,
             length: DoubleValue?,
             beginCoordinate: CLLocationCoordinate2D,
             endCoordinate: CLLocationCoordinate2D,
             beginGeometryIndex: UInt32,
             endGeometryIndex: UInt32,
             alertType: AlertType) {
            
            self.distance = distance
            self.length = length
            self.beginCoordinate = beginCoordinate
            self.endCoordinate = endCoordinate
            self.beginGeometryIndex = beginGeometryIndex
            self.endGeometryIndex = endGeometryIndex
            self.type = alertType
        }
    }
    
    public var alert: Alert
    public var distanceToStart: Double
    
    init(alert: Alert,
         distanceToStart: Double) {
        
        self.alert = alert
        self.distanceToStart = distanceToStart
    }
}
