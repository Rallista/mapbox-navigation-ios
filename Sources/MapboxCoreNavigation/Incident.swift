import Foundation
import MapboxDirections
import MaplibrePlayground

extension Incident {
    init?(_ incidentInfo: RouteAlertIncidentInfo) {
        var incidentType: Incident.Kind!
        
        switch incidentInfo.type {
        case .kAccident:
            incidentType = .accident
        case .kCongestion:
            incidentType = .congestion
        case .kConstruction:
            incidentType = .construction
        case .kDisabledVehicle:
            incidentType = .disabledVehicle
        case .kLaneRestriction:
            incidentType = .laneRestriction
        case .kMassTransit:
            incidentType = .massTransit
        case .kMiscellaneous:
            incidentType = .miscellaneous
        case .kOtherNews:
            incidentType = .otherNews
        case .kPlannedEvent:
            incidentType = .plannedEvent
        case .kRoadClosure:
            incidentType = .roadClosure
        case .kRoadHazard:
            incidentType = .roadHazard
        case .kWeather:
            incidentType = .weather
        }
        
        guard incidentType != nil else {
            return nil
        }
        
        var impact: Impact?
        if let impactValue = incidentInfo.impact {
            impact = Impact(rawValue: impactValue)
        }
        
        self.init(identifier: incidentInfo.id,
                  type: incidentType,
                  description: incidentInfo.description ?? "",
                  creationDate: incidentInfo.creationTime ?? Date.distantPast,
                  startDate: incidentInfo.startTime ?? Date.distantPast,
                  endDate: incidentInfo.endTime ?? Date.distantPast,
                  impact: impact,
                  subtype: incidentInfo.subType,
                  subtypeDescription: incidentInfo.subTypeDescription,
                  alertCodes: Set(incidentInfo.alertcCodes.map { $0.intValue }),
                  lanesBlocked: BlockedLanes(descriptions: incidentInfo.lanesBlocked),
                  shapeIndexRange: -1 ..< -1)
    }
}
