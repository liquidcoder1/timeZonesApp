//
//  TimeZone.swift
//  AnalogueWatch
//
//  Created by John K on 10/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

struct AddedTimeZone: Identifiable {
    let id: UUID
    let area: String
    let location: String
    let utcOffset: String
    
    init() {
        id = UUID()
        self.area = "No area"
        self.location = "No location"
        self.utcOffset = "00:00"
    }
    
    init(_ area: String,_ location: String,_ utcOffset: String  ) {
        id = UUID()
        self.area = area
        self.location = location
        self.utcOffset = utcOffset
    }
    
    init(from remoteTimeZone: RemoteTimeZone) {
        id = UUID()
        utcOffset = remoteTimeZone.utcOffset
        area = String(remoteTimeZone.timezone.split(separator: "/").first ?? "")
        location =  String(remoteTimeZone.timezone.split(separator: "/").last ?? "")
    }
}
