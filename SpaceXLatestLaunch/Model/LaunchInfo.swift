//
//  LaunchInfo.swift
//  SpaceXLatestLaunch
//
//  Created by Rumeysa Yücel on 4.02.2022.
//

import Foundation

struct LaunchInfo: Codable {
    var name: String
    var details: String?
    var rocket: String
    var links: Links
}

struct Links: Codable {
    var patch: Patch
}

struct Patch: Codable {
    var small: URL
    var large: URL
}
