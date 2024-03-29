import Foundation
import MapboxDirections
import MapboxCoreNavigation

public class DirectionsSpy: DirectionsProvider {

    public init() {
        
    }
    
    public var lastCalculateOptionsCompletion: Directions.RouteCompletionHandler?
    
    public func calculate(_ options: MatchOptions, completionHandler: @escaping Directions.MatchCompletionHandler) -> URLSessionDataTask {
        assert(false, "Not ready to handle \(#function)")
        return DummyURLSessionDataTask()
    }
    
    public func calculate(_ options: RouteOptions, completionHandler: @escaping Directions.RouteCompletionHandler) -> URLSessionDataTask {
        lastCalculateOptionsCompletion = completionHandler
        return DummyURLSessionDataTask()
    }
    
    public func calculateRoutes(matching options: MatchOptions, completionHandler: @escaping Directions.RouteCompletionHandler) -> URLSessionDataTask {
        assert(false, "Not ready to handle \(#function)")
        return DummyURLSessionDataTask()
    }
    
    public func refreshRoute(responseIdentifier: String, routeIndex: Int, fromLegAtIndex startLegIndex: Int, completionHandler: @escaping MapboxDirections.Directions.RouteRefreshCompletionHandler) -> URLSessionDataTask? {
        return DummyURLSessionDataTask()
    }
    
    public func fireLastCalculateCompletion(with waypoints: [Waypoint]?, routes: [Route]?, error: DirectionsError?) {
        let wpts = waypoints ?? []
        let options = RouteOptions(waypoints: wpts)
        
        let session: Directions.Session = (options: options, credentials: .init(accessToken: "xxx", host: nil))
        guard let lastCalculateOptionsCompletion = lastCalculateOptionsCompletion else {
            assert(false, "Can't fire a completion handler which doesn't exist!")
            return
        }
        
        if let error = error {
            lastCalculateOptionsCompletion(session, .failure(error))
        } else {
            let response = RouteResponse(httpResponse: nil, routes: routes, waypoints: waypoints, options: .route(options), credentials: .init(accessToken: "xxx", host: nil))
    
            lastCalculateOptionsCompletion(session, .success(response))
        }
    }
    
    public func reset() {
        lastCalculateOptionsCompletion = nil
    }
}
