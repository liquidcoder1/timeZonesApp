//
//  BottomToolbar.swift
//  AnalogueWatch
//
//  Created by John K on 25/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI



struct BottomToolbar: View {
    var body: some View {
        HStack{
            Image(systemName: "square.grid.2x2").resizable().frame(width: 20, height: 20)
            Spacer()
            Image(systemName: "alarm").resizable().frame(width: 20, height: 20)
            Spacer()
            Image(systemName: "person").resizable().frame(width: 20, height: 20)
            Spacer()
        }.padding(30).frame(maxWidth: .infinity, alignment: .top).background(Color.white)
            .clipShape(TopRoundedShape(cornerRadius: 30))
            .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 0, y: -5)
    }
}
