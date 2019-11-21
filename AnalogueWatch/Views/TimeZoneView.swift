//
//  TimeZoneView.swift
//  AnalogueWatch
//
//  Created by John K on 10/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

struct TimeZoneView: View {
    var timeZone = TimeZone.data().first!
    
    var body: some View {
        HStack{
            
            VStack(alignment: .leading) {
                Text(timeZone.Country).font(.system(size: 15, weight: Font.Weight.black))
                Text(timeZone.City).foregroundColor(Color.gray)
            }
            Spacer()
            Text(timeZone.time).font(.system(size: 20, weight: Font.Weight.black))
        }.frame(maxWidth: .infinity)
            .padding(30)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 8)
            .padding(.horizontal)
    }
}

struct TimeZoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimeZoneView()
    }
}
