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