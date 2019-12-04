//
//  WatchView.swift
//  WatchViewDesign
//
//  Created by John K on 14/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//
import SwiftUI

struct WatchView: View {
    
    var diameter: CGFloat = 200
    var smallCapsuleHeight: CGFloat = 5
    var bigCapsuleHeight: CGFloat = 10
    
    @State var hours: Double = 0.0
    @State var minutes: Double = 0.0
    @State var seconds: Double = 0.0
    
    var body: some View {
   
        return VStack {
            createWatch()
        }
        .onAppear{
            let date = Date()
            self.hours = date.getComponent(format: "HH")
            self.minutes = date.getComponent(format: "mm")
            self.seconds = date.getComponent(format: "ss")

            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                let date = timer.fireDate

                self.hours = date.getComponent(format: "HH")
                self.minutes = date.getComponent(format: "mm")
                self.seconds = date.getComponent(format: "ss")
            }
        }
    }
    
    func createSecondMarks(position: Int, angle: Int) -> some View{
        if position.isMultiple(of: 5) {
            return Capsule().frame(width:  2, height:  self.bigCapsuleHeight).offset(y: self.diameter / 2 - self.bigCapsuleHeight / 2).rotationEffect(Angle(degrees: Double(position * angle) )).foregroundColor(Color.gray)
        } else {
            return Capsule().frame(width:  1 , height: self.smallCapsuleHeight).offset(y: self.diameter / 2 - self.smallCapsuleHeight / 2).rotationEffect(Angle(degrees: Double(position * angle) )).foregroundColor(Color.gray)
        }
    }
    
    func createWatch() -> some View {
        
        let angle = 360 / 60
        let hourAngle = 360 / 12
        let interval = 360 / angle
        
        let hourLength: CGFloat =  diameter / 2 * 0.4
        let minuteLength: CGFloat = diameter / 2 * 0.7
        let secondLength: CGFloat = diameter / 2 * 0.8
        
        return  ZStack {
            WatchFrame(size: self.diameter + 40, borderSize: 20)
            
            ForEach(0..<interval){ i in
                self.createSecondMarks(position: i, angle: angle)
            }
            
            WatchHand(handWidth: 2, handHeight: hourLength, color: Color.black)
                .offset( y:  -(hourLength / 2) + 1.0)
                .rotationEffect(Angle(degrees: hours * Double(hourAngle) + (Double(hourAngle) * minutes / 60.0) ) , anchor: .center)
            
            WatchHand(handWidth: 2, handHeight: minuteLength, color: Color.black)
                .offset( y:  -(minuteLength / 2) + 1.0)
                .rotationEffect(Angle(degrees: minutes * Double(angle) + (Double(angle) * seconds / 60.0)) , anchor: .center)
            
            WatchHand(handWidth: 2, handHeight: secondLength, color: Color.red)
                .offset( y:  -(secondLength / 2) + 1.0)
                .rotationEffect(Angle(degrees: seconds * Double(angle)) , anchor: .center)
        }
    }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView()
    }
}
