//
//  MMEEventsManager.swift
//  
//
//  Created by Jacob Fielding on 2/6/23.
//

import Foundation

// Keys for Events
public let MMEEventKeyEvent = "MMEEventKeyEvent"
public let MMEEventKeyCreated = "MMEEventKeyCreated"

// Navigation Events
public let MMEEventTypeNavigationDepart = "MMEEventTypeNavigationDepart"
public let MMEEventTypeNavigationCancel = "MMEEventTypeNavigationCancel"
public let MMEEventTypeNavigationArrive = "MMEEventTypeNavigationArrive"
public let MMEEventTypeNavigationReroute = "MMEEventTypeNavigationReroute"

// Carplay Events
public let MMEventTypeNavigationCarplayConnect = "MMEventTypeNavigationCarplayConnect"
public let MMEventTypeNavigationCarplayDisconnect = "MMEventTypeNavigationCarplayDisconnect"

public let MMEEventTypeNavigationFeedback = "MMEEventTypeNavigationFeedback"

public let SecondsBeforeCollectionAfterFeedbackEvent: Double = 1.0

// Test Events
public let MMEEventTypeAppUserTurnstile = "MMEEventTypeAppUserTurnstile"


open class MMEEventsManager {
    
    private static let sharedInstance = MMEEventsManager()
    
    public static func shared() -> MMEEventsManager {
        return MMEEventsManager.sharedInstance
    }
    
    public static let unrated: Int = 1
    
    public init() {
        
    }
    
    open func initialize(withAccessToken: String,
                         userAgentBase: String,
                         hostSDKVersion: String) {
        
    }
    
    open func disableLocationMetrics() {
        
    }
    
    open func sendTurnstileEvent() {
        
    }
    
    open func enqueueEvent(withName: String, attributes: [String: Any]) {
        
    }
    
    open func enqueueEvent(withName: String) {
        
    }
    
    open func flush() {
        
    }
}
