//
//  Speech.swift
//  
//
//  Created by Jacob Fielding on 2/6/23.
//

import Foundation
import MapboxDirections

public enum SpeechError: Error {
    
    case unknown(response: Int, underlying: Error?, code: Int?, message: String?)
    
    case apiError(instruction: SpokenInstruction, options: SpeechOptions, underlying: Error?)
    
    case noData(instruction: SpokenInstruction, options: SpeechOptions)
}

public class SpeechOptions {
    public var locale: Locale = .current
    
    public init(ssml: String) {
        
    }
}

public class SpeechSynthesizer {
    public init(accessToken: String?, host: String?) {
        
    }
    
    @discardableResult
    public func audioData(with options: SpeechOptions, completion: (Data?, SpeechError?) -> Void) -> URLSessionDataTask {
        return .init()
    }
}
