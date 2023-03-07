//
//  Models.swift
//  
//
//  Created by Jacob Fielding on 2/10/23.
//

import Foundation
import CoreLocation

// MARK: Type Wrappers

public class DoubleValue: Equatable {
    public var doubleValue: Double
    
    public init(_ value: Double) {
        doubleValue = value
    }

    public static func ==(lhs: DoubleValue, rhs: DoubleValue) -> Bool {
        return lhs.doubleValue == rhs.doubleValue
    }
}

public class IntValue {
    public var intValue: Int
    
    public init(intValue: Int) {
        self.intValue = intValue
    }
    
    public static func ==(lhs: IntValue, rhs: IntValue) -> Bool {
        return lhs.intValue == rhs.intValue
    }
}

// MARK: Location

public class FixLocation {
    
    public var coordinate: CLLocationCoordinate2D
    public var altitude: NSNumber?
    public var accuracyHorizontal: DoubleValue?
    public var verticalAccuracy: DoubleValue?
    public var bearing: DoubleValue?
    public var bearingAccuracy: DoubleValue?
    public var speed: DoubleValue?
    public var speedAccuracy: DoubleValue?
    public var time: Date
    
    public init(coordinate: CLLocationCoordinate2D,
                monotonicTimestampNanoseconds: Int,
                time: Date,
                speed: NSNumber? = nil,
                bearing: NSNumber? = nil,
                altitude: NSNumber? = nil,
                accuracyHorizontal: NSNumber? = nil,
                provider: String? = nil,
                bearingAccuracy: NSNumber? = nil,
                speedAccuracy: NSNumber? = nil,
                verticalAccuracy: NSNumber? = nil) {
        self.coordinate = coordinate
        self.time = time
    }
}

// MARK: Location Accuracy

public enum MBNavigationAccuracyAuthorization: Int {
    case fullAccuracy = 0
    case reducedAccuracy = 1
}

// MARK: Waypoint

public class MapboxNavigationNative {
    public class Waypoint {
        public init(coordinate: CLLocationCoordinate2D, isSilent: Bool) {
            
        }
    }
}

// MARK: Route result

public class RouteResult {
    public var json: String
    
    public init(json: String) {
        self.json = json
    }
}

// MARK: Navigation

public class NavigationStatus {
    
    public class MapMatcherOutput {
        
        public class Match {
            public var proba: Float
            
            public init(proba: Float) {
                self.proba = proba
            }
        }
        
        public var matches: [Match]
        
        public init(matches: [Match]) {
            self.matches = matches
        }
    }
    
    public class Instruction {
        public var index: Int
        
        public init(index: Int) {
            self.index = index
        }
    }
    
    public var location: FixLocation
    
    public var map_matcher_output: MapMatcherOutput
    
    public var roadName: String
    
    public var routeState: RouteState
    
    public var legIndex: UInt32
    
    public var stepIndex: UInt32
    
    public var intersectionIndex: UInt32
    
    public var upcomingRouteAlerts: [UpcomingRouteAlert]
    
    public var bannerInstruction: Instruction?
    
    public var voiceInstruction: Instruction?
    
    public init(location: FixLocation,
                map_matcher_output: MapMatcherOutput,
                roadName: String,
                routeState: RouteState,
                legIndex: UInt32,
                stepIndex: UInt32,
                intersectionIndex: UInt32,
                upcomingRouteAlerts: [UpcomingRouteAlert],
                bannerInstruction: Instruction?,
                voiceInstruction: Instruction?) {
        
        self.location = location
        self.map_matcher_output = map_matcher_output
        self.roadName = roadName
        self.routeState = routeState
        self.legIndex = legIndex
        self.stepIndex = stepIndex
        self.intersectionIndex = intersectionIndex
        self.upcomingRouteAlerts = upcomingRouteAlerts
        self.bannerInstruction = bannerInstruction
        self.voiceInstruction = voiceInstruction
    }
    
}

public enum ActiveGuidanceMode {
    case kDriving
    case kCycling
    case kWalking
}

public enum ActiveGuidanceGeometryEncoding {
    case kGeoJSON
    case kPolyline5
    case kPolyline6
}
