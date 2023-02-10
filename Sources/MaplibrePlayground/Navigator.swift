//
//  Navigator.swift
//  
//
//  Created by Jacob Fielding on 2/6/23.
//

import Foundation
import CoreLocation
import MapboxDirections

public class DoubleValue {
    public var doubleValue: Double
    
    public init(_ value: Double) {
        doubleValue = value
    }
}

public class IntValue {
    public var intValue: Int
    
    public init(intValue: Int) {
        self.intValue = intValue
    }
}

public class FixLocation {
    
    public var coordinate: CLLocationCoordinate2D
    public var altitude: DoubleValue?
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

// MARK: MapboxNavigationNative

public class MapboxNavigationNative {
    public class Waypoint {
        public init(coordinate: CLLocationCoordinate2D, isSilent: Bool) {
            
        }
    }
}

public enum MBNavigationAccuracyAuthorization: Int {
    case fullAccuracy = 0
    case reducedAccuracy = 1
}

// MARK: Navigator

public class  Navigator {
    
    public class RouteResult {
        public var json: String
        
        public init(json: String) {
            self.json = json
        }
    }
    
    public init(profile: SettingsProfile, config: NavigatorConfig, customConfig: String, tilesConfig: TilesConfig) {
        
    }
    
    public func status(at timestamp: Date) -> NavigationStatus {
        return NavigationStatus(location: .init(coordinate: .init(),
                                                monotonicTimestampNanoseconds: 0,
                                                time: Date()),
                                map_matcher_output: .init(matches: []),
                                roadName: "",
                                routeState: .initialized,
                                legIndex: 0,
                                stepIndex: 0,
                                intersectionIndex: 0,
                                upcomingRouteAlerts: [],
                                bannerInstruction: .init(index: 0),
                                voiceInstruction: .init(index: 0))
    }
    
    public func updateLocation(for fixLocation: FixLocation) {
        
    }
    
    public func toggleHistoryFor(onOff isOnOrOff: Bool) {
        
    }
    
    public func getHistory() -> String? {
        return nil
    }
    
    public func unpackTiles(forPackedTilesPath: String, outputDirectory: String) -> UInt64 {
        return 0
    }
    
    public func getRouteForDirectionsUri(_ absoluteUrl: String) -> RouteResult {
        return .init(json: "")
    }
    
    public func setRouteForRouteResponse(_ routeString: String,
                                         route: Int,
                                         leg: UInt32,
                                         options: ActiveGuidanceOptions) {
        
    }
    
    public func changeRouteLeg(forRoute: Int, leg: UInt32) -> Bool {
        return false
    }
}

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

// MARK: Settings Profile

public class SettingsProfile {
    
    public init(application: ProfileApplication, platform: ProfilePlatform) {
        
    }
}

public enum ProfileApplication {
    
    case kMobile
}

public enum ProfilePlatform {
    
    case KIOS
}

public class TilesConfig {
    
    public init() {
        
    }
    
    public init(tilesPath: String?,
                inMemoryTileCache: String?,
                onDiskTileCache: String?,
                mapMatchingSpatialCache: String?,
                threadsCount: Int?,
                endpointConfig: TileEndpointConfiguration) {
        
    }
}

public class TileEndpointConfiguration {
    
    public init(credentials: DirectionsCredentials, tilesVersion: String?, minimumDaysToPersistVersion: Int?) {
        
    }
    
    public init(host: String,
                version: String,
                token: String,
                userAgent: String,
                navigatorVersion: String,
                skuTokenSource: SkuTokenSource,
                minDiffInDaysToConsiderServerVersion: NSNumber?,
                disableCleanOlderLocalVersions: Bool) {
        
    }
}

public class NavigatorConfig {
    
    public init() {
        
    }
}

public class MBXPeerWrapper {
    
    public init() {
        
    }
}

public protocol SkuTokenSource {
    
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

public class ActiveGuidanceOptions {
    public init(mode: ActiveGuidanceMode,
         geometryEncoding: ActiveGuidanceGeometryEncoding,
         waypoints: [MapboxNavigationNative.Waypoint]) {
        
    }
}
