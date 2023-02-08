//
//  NavigationMapDataSource.swift
//  
//
//  Created by Jacob Fielding on 2/7/23.
//

import Foundation

public protocol NavigationMapDataSource {
    static var dayStyleUrl: URL { get }
    static var nightStyleUrl: URL { get }
    static var vectorTileUrl: URL { get }
}

public class RallistaMapboxDataSource: NavigationMapDataSource {
    public static var dayStyleUrl: URL = URL(string: "https://api.mapbox.com/styles/v1/rallista/ckkbdyyxg0p8o17nvbqef9ryf?access_token=pk.eyJ1IjoicmFsbGlzdGEiLCJhIjoiY2s0OTRvdXdrMDFhajNvb2sxZ3UzazdqYyJ9.fzgcfVNQ5TFvX_3anFm4mg")!
    
    public static var nightStyleUrl: URL = URL(string: "https://api.mapbox.com/styles/v1/rallista/ckkbdyyxg0p8o17nvbqef9ryf?access_token=pk.eyJ1IjoicmFsbGlzdGEiLCJhIjoiY2s0OTRvdXdrMDFhajNvb2sxZ3UzazdqYyJ9.fzgcfVNQ5TFvX_3anFm4mg")!
    
    public static var vectorTileUrl: URL = URL(string: "https://api.mapbox.com/v4/mapbox.mapbox-streets-v8?access_token=pk.eyJ1IjoicmFsbGlzdGEiLCJhIjoiY2s0OTRvdXdrMDFhajNvb2sxZ3UzazdqYyJ9.fzgcfVNQ5TFvX_3anFm4mg")!
    
    
}
