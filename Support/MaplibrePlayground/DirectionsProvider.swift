//
//  DirectionsProvider.swift
//  
//
//  Created by Jacob Fielding on 2/13/23.
//

import Foundation
import MapboxDirections

public protocol DirectionsProvider {
    
    // TODO: Remove this once EventManager plan is determined.
    var credentials: DirectionsCredentials { get }
    
    @discardableResult
    func calculate(_ options: RouteOptions, completionHandler: @escaping Directions.RouteCompletionHandler) -> URLSessionDataTask
    
    @discardableResult
    func calculate(_ options: MatchOptions, completionHandler: @escaping Directions.MatchCompletionHandler) -> URLSessionDataTask
    
    @discardableResult
    func calculateRoutes(matching options: MatchOptions, completionHandler: @escaping Directions.RouteCompletionHandler) -> URLSessionDataTask
    
    @discardableResult
    func refreshRoute(responseIdentifier: String, routeIndex: Int, fromLegAtIndex startLegIndex: Int, completionHandler: @escaping Directions.RouteRefreshCompletionHandler) -> URLSessionDataTask?
}

extension Directions: DirectionsProvider { }
