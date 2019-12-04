//
//  DataExt.swift
//  AnalogueWatch
//
//  Created by John K on 01/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

extension Date{
    
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMMM yyyy"
        return formatter.string(from: self)
    }
    
     func getComponent(format: String) -> Double {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: "UTC")
        let component = formatter.string(from: self)
        
        if let value = Double(component) {
            return value
        }
        return 0.0
    }
}
