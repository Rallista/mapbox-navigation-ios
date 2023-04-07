import Foundation
import MapboxNavigation

// MARK: CustomDayStyle

/**
 To find more pieces of the UI to customize, checkout DayStyle.swift.
 */
class CustomDayStyle: DayStyle {
    required init() {
        super.init()
        mapStyleURL = RallistaMapboxDataSource.dayStyleUrl
        previewMapStyleURL = mapStyleURL
        styleType = .day
    }
    
    override func apply() {
        super.apply()
        BottomBannerView.appearance().backgroundColor = .orange
    }
}

// MARK: CustomNightStyle
class CustomNightStyle: NightStyle {
    required init() {
        super.init()
        mapStyleURL = RallistaMapboxDataSource.dayStyleUrl
        previewMapStyleURL = mapStyleURL
        styleType = .night
    }
    
    override func apply() {
        super.apply()
        BottomBannerView.appearance().backgroundColor = .purple
    }
}
