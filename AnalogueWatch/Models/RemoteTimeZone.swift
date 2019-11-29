//
//  RemoteTimeZone.swift
//  AnalogueWatch
//
//  Created by John K on 23/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

struct RemoteTimeZone: Codable {
    let utcOffset: String
    let utcDatetime: String
    let timezone: String
    let datetime: String
}
