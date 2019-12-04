//
//  SavedTimeZonesView.swift
//  AnalogueWatch
//
//  Created by John K on 25/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI



struct SavedTimeZones: View {
    
    @FetchRequest(
          entity: SavedTimeZone.entity(),
          sortDescriptors: [
              NSSortDescriptor(keyPath: \SavedTimeZone.createdAt, ascending: true),
          ]
      ) var timezones: FetchedResults<SavedTimeZone>

    var body: some View {
       return ScrollView( .vertical, showsIndicators: false) {
        VStack(spacing: 20) {
            ForEach(timezones){ timeZone in
                    TimeZoneView(timeZone: timeZone)
                }
            }
        }
    }
}
