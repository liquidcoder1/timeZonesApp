//
//  AddedTimeZonesView.swift
//  AnalogueWatch
//
//  Created by John K on 25/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI


struct AddedTimeZones: View {
    var headerHeight: CGFloat = 100
    @Binding var timezones: [TimeZone]
    
    var body: some View {
        ScrollView( .horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(timezones.reversed()){ timeZone in
                    AddedTimeZoneView(timeZone: timeZone)
                }
            }.frame(height: headerHeight).padding()
        }
    }
}

