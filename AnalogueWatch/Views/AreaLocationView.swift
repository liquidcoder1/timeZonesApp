//
//  RemoteTimeZonesView.swift
//  AnalogueWatch
//
//  Created by John K. on 22/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import SwiftUI

struct AreaLocationView: View {
    
    @ObservedObject private var areaLocationModel = AreaLocationViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var timezones: [AddedTimeZone]
    @State var isLoading = false
    
    var body: some View {
        
        if !areaLocationModel.areaLocationMap.isEmpty {
           return AnyView(VStack {
                Text("CHOOSE A LOCATION")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding()


                ScrollView {
                    ForEach(Array(self.areaLocationModel.areaLocationMap.keys), id: \.self) { area in
                        Section(header: HStack {
                            Text("\(area)")
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color.white)

                        }.background(Color.white.opacity(0.2))){
                            ForEach(self.areaLocationModel.areaLocationMap[area] ?? []){ location in

                                LocationRow(location: location, isLoading: self.$isLoading, onSelect: { selectedLocation in
                                    self.isLoading = true
                                        TimeZoneViewModel.getTimeZone(for: "\(selectedLocation.area)/\(selectedLocation.name)", completion: { timeZone in
                                            self.timezones.append(timeZone)
                                            
                                            // Core data
                                            let newTimeZone = SavedTimeZone(context: self.managedObjectContext)
                                            newTimeZone.createdAt = Date()
                                            newTimeZone.id = timeZone.id
                                            newTimeZone.area = timeZone.area
                                            newTimeZone.location = timeZone.location
                                            newTimeZone.utcOffset = timeZone.utcOffset
                                            try? self.managedObjectContext.save()
                                            self.isLoading = false
                                        })
                                }) { deselectedLocation in
                                    self.timezones.removeAll {  $0.area == deselectedLocation.area &&  $0.location == deselectedLocation.name }
                                }
                            }
                        }
                    }
                }
            })
        } else {
          return AnyView( VStack{
            Text("Loading...").foregroundColor(Color.white).bold()
            })
        }
    }
}

struct AreaLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AreaLocationView(timezones: .constant([]))
    }
}

struct LocationRow: View {
   
    var location: Location
    @Binding var isLoading: Bool
    var onSelect: ((_ location: Location) -> ()) =  {_ in }
    var onDeselect: ((_ location: Location) -> ()) =  {_ in }
    @State private var isSelected = false
    
    var body: some View {
        HStack {
            Text("\(location.name)").foregroundColor( isSelected ? Color.yellow : Color.white  )
            Spacer()
            Image(systemName: isSelected ? "circle.fill" : "circle")
                .imageScale(.large)
                .foregroundColor(isLoading ? Color.gray : Color.white)
        }.padding().background(Color.clear).onTapGesture {
            if !self.isLoading{
                self.isSelected.toggle()
                if self.isSelected {
                    self.onSelect(self.location)
                } else {
                    self.onDeselect(self.location)
                }
            }
        }
    }
}
