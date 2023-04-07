import XCTest
import CoreLocation

@testable import MapboxCoreNavigation

class CLLocationTests: XCTestCase {
    
    func testTimestampShiftForLocation() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let timestamp = Date()
        let location = CLLocation(coordinate: coordinate,
                                  altitude: 10,
                                  horizontalAccuracy: 40,
                                  verticalAccuracy: 50,
                                  course: 180,
                                  speed: 18,
                                  timestamp: timestamp)
        
        let shiftedTimestamp = location.timestamp + 10
        XCTAssertEqual(shiftedTimestamp, location.shifted(to: shiftedTimestamp).timestamp)
    }
}

