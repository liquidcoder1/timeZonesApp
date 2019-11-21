//
//  ContentView.swift
//  AnalogueWatch
//
//  Created by John K on 05/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var isExpanded: Bool  = false
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
                AddedTimeZones().transition(.move(edge: .trailing))
            }

            if !isExpanded{
                SavedTimeZones().transition(.move(edge: .leading))
            }

            if isExpanded{
                Spacer()
            }

                BottomToolbar().overlay(
                    ZStack(alignment: .bottom)  {
                        HStack{
                            if self.isExpanded{
                                VStack {
                                    Text("Hello world")
                                }
                            }
                        }.frame(width: self.isExpanded ? UIScreen.main.bounds.width : 50, height: self.isExpanded ?  UIScreen.main.bounds.height - headerHeight - sheetTopSpace : 50)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("justBlue") , Color("heavenBlue") ]) , startPoint: .topTrailing, endPoint: .bottomLeading))
                            .cornerRadius(isExpanded ? 0 : 10)
                            .clipShape(TopRoundedShape(cornerRadius: isExpanded ? 40 : 10 ))
                            .offset(x: isExpanded ? 0 :  UIScreen.main.bounds.width / 3, y: isExpanded ? 0 : -50)

                        // Button
                        AddButton(isExpanded: self.$isExpanded)
                    }, alignment: .bottom)
        
        }.edgesIgnoringSafeArea(.bottom)
    }
}


struct AddButton: View {
    
    @Binding var isExpanded: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                self.isExpanded.toggle()
            }
        }) {
            Image(systemName: "plus")
                .padding()
                .background( isExpanded ? Color.white : Color.clear)
                .foregroundColor( isExpanded ? Color.black : Color.white)
                .cornerRadius(isExpanded ? 25 : 0)
                .rotationEffect(Angle(degrees: isExpanded ? 45 : 90) , anchor: .center)
        }.offset(x: isExpanded ? 0 :  UIScreen.main.bounds.width / 3, y: -50 )
    }
}

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

struct AddedTimeZones: View {
    
    var headerHeight: CGFloat = 100
    
    var body: some View {
        ScrollView( .horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(TimeZone.data()){ timeZone in
                    AddedTimeZoneView(timeZone: timeZone)
                }
            }.frame(height: headerHeight).padding()
        }
    }
}

struct SavedTimeZones: View {
    var body: some View {
        ScrollView( .vertical, showsIndicators: false) {
            VStack {
                ForEach(TimeZone.data()){ timeZone in
                    TimeZoneView(timeZone: timeZone)
                }
            }
        }
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
            Header()
            WatchView(diameter: 170).transition(.scale)
            AddedTimeZones()
            SavedTimeZones()
            ContentView()
        }
    }
}
