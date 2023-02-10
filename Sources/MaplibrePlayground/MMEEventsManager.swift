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


public class MMEEventsManager {
    
    private static let sharedInstance = MMEEventsManager()
    
    public static func shared() -> MMEEventsManager {
        return MMEEventsManager.sharedInstance
    }
    
    public static let unrated: Int = 1
    
    public func initialize(withAccessToken: String,
                           userAgentBase: String,
                           hostSDKVersion: String) {
        
    }
    
    public func disableLocationMetrics() {
        
    }
    
    public func sendTurnstileEvent() {
        
    }
    
    public func enqueueEvent(withName: String, attributes: [String: Any]) {
        
    }
    
    public func flush() {
        
    }
}
