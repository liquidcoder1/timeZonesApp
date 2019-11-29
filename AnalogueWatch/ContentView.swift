//
//  ContentView.swift
//  AnalogueWatch
//
//  Created by John K on 05/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var isExpanded: Bool  = false
    @State private var areas = [Location]()
    @State private var timezones = [TimeZone]()
    
    private let headerHeight: CGFloat = 100
    
    var body: some View {
                
        let screenSize = UIScreen.main.bounds
        let phoneRatio = String(format: "%.3f", screenSize.width / screenSize.height)
        let refRatio =   String(format: "%.3f",  9.0 / 16.0)
        let isXorAbove = phoneRatio != refRatio
        let sheetTopSpace: CGFloat = isXorAbove ? 60 : 40
                        
       return VStack {
            if !isExpanded{
                Header().transition(.move(edge: .leading))
            }
            
            if !isExpanded{
                WatchView(diameter: 170).transition(.scale)
            }

            if isExpanded{
                AddedTimeZones(timezones: self.$timezones).transition(.move(edge: .trailing))
            }

            if !isExpanded{
                SavedTimeZones(timezones:  self.$timezones).transition(.move(edge: .leading))
            }

            if isExpanded{
                Spacer()
            }

        BottomToolbar().overlay(
            ZStack(alignment: .bottom)  {
                HStack{
                    if self.isExpanded{
                        AreaLocationView(timezones: self.$timezones )
                    }
                }.frame(width: self.isExpanded ? UIScreen.main.bounds.width : 50, height: self.isExpanded ?  UIScreen.main.bounds.height - headerHeight - sheetTopSpace : 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("justBlue") , Color("heavenBlue") ]) , startPoint: .topTrailing, endPoint: .bottomLeading))
                    .cornerRadius(isExpanded ? 0 : 10)
                    .clipShape(TopRoundedShape(cornerRadius: isExpanded ? 40 : 10 ))
                    .offset(x: isExpanded ? 0 :  UIScreen.main.bounds.width / 3, y: isExpanded ? 0 : -50)
                
                // Button
                AddButton(onClick: { isExpanded in
                    withAnimation(.spring()) {
                        self.isExpanded.toggle()
                    }
                })
        }, alignment: .bottom)
        
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct Header: View {
    var headerHeight: CGFloat = 100

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
            }
            Text("Burundi")
            Text("Sun, 10 Nov 2019")
        }.frame(height: self.headerHeight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
