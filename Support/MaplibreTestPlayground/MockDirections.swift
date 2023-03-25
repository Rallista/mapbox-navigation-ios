//
//  MockDirections.swift
//  
//
//  Created by Jacob Fielding on 2/13/23.
//

import Foundation
import MaplibrePlayground
import MapboxDirections

open class MockDirections: DirectionsProvider {
    public let credentials: Credentials
    
    public init(credentials: Credentials = .init(accessToken: "mock", host: nil)) {
        self.credentials = credentials
    }
    
    @discardableResult
    open func calculate(_ options: RouteOptions,
                   completionHandler: @escaping Directions.RouteCompletionHandler) -> URLSessionDataTask {
        return .init()
    }
    
    @discardableResult
    open func calculate(_ options: MatchOptions,
                   completionHandler: @escaping Directions.MatchCompletionHandler) -> URLSessionDataTask {
        return .init()
    }
    
    @discardableResult
    open func calculateRoutes(matching options: MatchOptions,
                         completionHandler: @escaping Directions.RouteCompletionHandler) -> URLSessionDataTask {
        return .init()
    }
    
    @discardableResult
    open func refreshRoute(responseIdentifier: String,
                      routeIndex: Int,
                      fromLegAtIndex startLegIndex: Int,
                      completionHandler: @escaping Directions.RouteRefreshCompletionHandler) -> URLSessionDataTask? {
        return .init()
    }
}
