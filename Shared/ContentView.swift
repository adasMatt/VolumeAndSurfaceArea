//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Adas on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    //version 1, bad code
    //    @ObservedObject private var circleModel = Circle()
    //won’t use classes for v1 since the code is supposed to be “bad”
    //for version 2, use 2 separated classes Sphere and Cube?
    //for version 3, class will be “Shape” and there can be a “Sphere” and “Box” subclass
    //Box subclass should have length, width, height instead of just radius?
    //Box subclass can be “Cube” for v2
    //this way i can maybe use the overwrite command for calculating

    @State var radiusString = "1.0"
    @State var radius = 0.0
    @State var surfAreaSphere = 0.0
    @State var surfAreaSphereText = ""
    @State var volSphere = 0.0
    @State var volSphereText = ""
    @State var surfAreaBox = 0.0
    @State var surfAreaBoxText = ""
    @State var volBox = 0.0
    @State var volBoxText = ""
    
    var body: some View {
        
        VStack{
            Text("Radius")
                .padding(.top)
                .padding(.bottom, 0)
                //TextField("Enter Radius", text: $radiusString, onCommit: {self.calculateCircle()})
            TextField("Enter Radius", text: $radiusString, onCommit: {self.calcSphereStuff(passedRadius: Double(radiusString)!); self.calcBoxStuff(passedLength: Double(radiusString)!)}) //maybe this is right, or maybe not?
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            HStack{
                Text("Surface Area\nof Sphere")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8.0)
                Text("Surface Area of\nBounding Box")
                    .multilineTextAlignment(.center)
                    .padding(.leading, 8.0)
            }

    //I think I’d like to HStack {} here and put surface areas next to each other
            HStack{
                
                TextField("", text: $surfAreaSphereText) //again maybe this is right, or maybe not
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                
                TextField("", text: $surfAreaBoxText) //need to actually add surfAreaBoxText
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                
            }

    //I think I’d like to HStack {} here and put volumes next to each other
            HStack{
                Text("Volume of\nSphere")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15.0)
                    
                Text("Volume of\nBounding Box")
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20.0)
                    
            }
            
            HStack{
                TextField("", text: ($volSphereText)) //again maybe this is right, or maybe not. What’s up with the parentheses on perimeterText and not on areaText?
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
                    .padding(.trailing, 10.0)

                TextField("", text: ($volBoxText)) //need to actually add surfAreaBoxText
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
                    } //endHStack

            Button("Calculate", action: {self.calcSphereStuff(passedRadius: Double(radiusString)!); self.calcBoxStuff(passedLength: Double(radiusString)!)})
                .padding(.bottom)
                .padding()
            
        } //end VStack
        
    }
    
    func calcSphereStuff(passedRadius: Double){
        
        let radius = passedRadius
        surfAreaSphere = 4 * Double.pi * radius * radius
        surfAreaSphereText = String(format: "%7.5f", surfAreaSphere)
        volSphere = 4 / 3 * Double.pi * radius * radius * radius
        volSphereText = String(format: "%7.5f", volSphere)
        
        surfAreaBox = 2 * ((4 * radius * radius) + (4 * radius * radius) + (4 * radius * radius))
            //for Cube, length = height = width = 2 * radius
            //surfAreaBox = 2 * (length * width + length * height + width * height)
        surfAreaBoxText = String(format: "%7.5f", surfAreaBox)
        volBox = 8 * radius * radius * radius
        volBoxText = String(format: "%7.5f", volBox)
        return
        }
        
    func calcBoxStuff(passedLength: Double){
        
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



