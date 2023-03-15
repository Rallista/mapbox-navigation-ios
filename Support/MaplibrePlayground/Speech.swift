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

open class SpeechSynthesizer {
    
    public typealias CompletionHandler = (Data?, SpeechError?) -> Void
    
    public init(accessToken: String?, host: String?) {
        
    }
    
    @discardableResult
    open func audioData(with options: SpeechOptions, completionHandler: @escaping SpeechSynthesizer.CompletionHandler) -> URLSessionDataTask {
        return .init()
    }
}
