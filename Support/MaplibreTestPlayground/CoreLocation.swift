//
//  CoreLocation.swift
//  
//
//  Created by Jacob Fielding on 2/11/23.
//

import CoreLocation

extension CLHeading {
    
    public convenience init?(heading: CLLocationDirection, accuracy: CLLocationDirection) {
        let coder = NSCoder()
        coder.encode(heading, forKey: "magneticHeading")
        coder.encode(heading, forKey: "trueHeading")
        coder.encode(accuracy, forKey: "accuracy")
        
        self.init(coder: coder)
    }
}
