//
//  Tiles.swift
//  
//
//  Created by Jacob Fielding on 2/10/23.
//

import Foundation
import MapboxDirections

public class TilesConfig {
    
    public init() {
        
    }
    
    public init(tilesPath: String?,
                inMemoryTileCache: String?,
                onDiskTileCache: String?,
                mapMatchingSpatialCache: String?,
                threadsCount: Int?,
                endpointConfig: TileEndpointConfiguration) {
        
    }
}

public class TileEndpointConfiguration {
    
    public init(credentials: DirectionsCredentials, tilesVersion: String?, minimumDaysToPersistVersion: Int?) {
        
    }
    
    public init(host: String,
                version: String,
                token: String,
                userAgent: String,
                navigatorVersion: String,
                skuTokenSource: SkuTokenSource,
                minDiffInDaysToConsiderServerVersion: NSNumber?,
                disableCleanOlderLocalVersions: Bool) {
        
    }
}
