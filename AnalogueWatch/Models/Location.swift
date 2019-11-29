//
//  Country.swift
//  AnalogueWatch
//
//  Created by John K on 22/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation


struct Location: Codable, Identifiable {
    let id: UUID
    let name: String
    let area: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "location"
        case area = "area"
    }
}
