//
//  TimeZone.swift
//  AnalogueWatch
//
//  Created by John K on 10/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

struct TimeZone: Identifiable {
    let id: UUID
    let Country: String
    let City: String
    let time: String
    
    static func data() -> [TimeZone] {
        return [
            TimeZone(id: UUID(), Country: "USA", City: "Chicago", time: "7:00 AM"),
            TimeZone(id: UUID(), Country: "Croatia", City: "Zagreb", time: "5:00 AM"),
            TimeZone(id: UUID(), Country: "Ireland", City: "Limerick", time: "15:00 AM"),
            TimeZone(id: UUID(), Country: "Burundi", City: "Bujumbura", time: "10:00 AM"),
        ]
    }
}
