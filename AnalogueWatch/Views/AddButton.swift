//
//  AddButton.swift
//  AnalogueWatch
//
//  Created by John K on 25/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

struct AddButton: View {
    
    @State private var flag: Bool = false
    var onClick: ((_ isExpanded: Bool) -> ()) =  {_ in }
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
            self.flag.toggle()
            }
            self.onClick(self.flag)
        }) {
            Image(systemName: "plus")
                .padding()
                .background( flag ? Color.white : Color.clear)
                .foregroundColor( flag ? Color.black : Color.white)
                .cornerRadius(flag ? 25 : 0)
                .rotationEffect(Angle(degrees: flag ? 45 : 90) , anchor: .center)
        }.offset(x: flag ? 0 :  UIScreen.main.bounds.width / 3, y: -50 )
    }
}
