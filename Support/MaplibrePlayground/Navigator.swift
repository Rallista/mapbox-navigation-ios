//
//  Navigator.swift
//  
//
//  Created by Jacob Fielding on 2/6/23.
//

import Foundation
import CoreLocation
import MapboxDirections

// MARK: Navigator

public class  Navigator {
    
    public init(profile: SettingsProfile, config: NavigatorConfig, customConfig: String, tilesConfig: TilesConfig) {
        
    }
    
    public func status(at timestamp: Date) -> NavigationStatus {
        // Mocked value.
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
    
    public func unpackTiles(forPackedTilesPath: String,
                            outputDirectory: String) -> UInt64 {
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

public class NavigatorConfig {
    
    public init() {
        
    }
}

public class MBXPeerWrapper {
    
    public init() {
        
    }
}

public class ActiveGuidanceOptions {
    public init(mode: ActiveGuidanceMode,
                geometryEncoding: ActiveGuidanceGeometryEncoding,
                waypoints: [MapboxNavigationNative.Waypoint]) {
        
    }
}
