//
//  Speech.swift
//  
//
//  Created by Jacob Fielding on 2/6/23.
//

import Foundation

public class SpeechOptions {
    public var locale: Locale = .current
    
    public init(ssml: String) {
        
    }
}

public class SpeechSynthesizer {
    public init(accessToken: String?, host: String?) {
        
    }
    
    public func audioData(with options: SpeechOptions, completion: (Data?, Error?) -> Void) -> URLSessionDataTask {
        return .init()
    }
}
