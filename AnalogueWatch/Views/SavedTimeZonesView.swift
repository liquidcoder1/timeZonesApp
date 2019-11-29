//
//  SavedTimeZonesView.swift
//  AnalogueWatch
//
//  Created by John K on 25/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI



struct SavedTimeZones: View {
    @Binding var timezones: [TimeZone]

    var body: some View {
       return ScrollView( .vertical, showsIndicators: false) {
        VStack(spacing: 20) {
            ForEach(timezones.reversed()){ timeZone in
                    TimeZoneView(timeZone: timeZone)
                }
            }
        }
    }
}
