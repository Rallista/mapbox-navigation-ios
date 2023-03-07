//
//  CoreLocation.swift
//  
//
//  Created by Jacob Fielding on 2/11/23.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(latitude: try container.decode(Double.self, forKey: .latitude),
                  longitude: try container.decode(Double.self, forKey: .longitude))
    }
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
    }
}
