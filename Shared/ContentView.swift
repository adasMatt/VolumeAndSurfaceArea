//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Adas on 1/22/21.
//  version 3, Sphere and Cube are now subclasses of NDimensionalObj, which is actually a pretty boring parent class

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var sphereModel = Sphere()
    @ObservedObject private var cubeModel = Cube()
    @State var radiusString = "1.0"
    
    var body: some View {
        
        VStack{
            Text("Sphere Radius")
                .padding(.top)
                .padding(.bottom, 0)
                //functions for calculating Surface Area and Volume of both a Sphere and Cube are called from their respective classes upon typing Enter/Return here
            TextField("Enter Radius", text: $radiusString, onCommit: {
                sphereModel.calculateSphereAreaAndVolume(passedRadius: Double(radiusString)!)
                cubeModel.calculateCubeAreaAndVolume(passedLength: Double(radiusString)!)
            })
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            HStack{
                //HStacks within the VStack are organizing the GUI layout to have Sphere on the left and Box/Cube on the right
                Text("Surface Area\nof Sphere")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8.0)
                Text("Surface Area of\nBounding Box")
                    .multilineTextAlignment(.center)
                    .padding(.leading, 8.0)
            }

            HStack{
                //Sphere on the left, Box/Cube on the right
                TextField("", text: $sphereModel.surfAreaSphereText)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                
                TextField("", text: $cubeModel.surfAreaCubeText)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                
            }

            HStack{
                //Sphere on the left, Box/Cube on the right
                Text("Volume of\nSphere")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15.0)
                    
                Text("Volume of\nBounding Box")
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20.0)
                    
            }
            
            HStack{
                //Sphere on the left, Box/Cube on the right
                TextField("", text: ($sphereModel.volSphereText))
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
                    .padding(.trailing, 10.0)

                TextField("", text: ($cubeModel.volCubeText))
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
                    }

            Button("Calculate", action: {
                //functions for calculating Surface Area and Volume of both a Sphere and Cube are called from their respective classes upon clicking the Calculate button in the GUI here
                sphereModel.calculateSphereAreaAndVolume(passedRadius: Double(radiusString)!)
                cubeModel.calculateCubeAreaAndVolume(passedLength: Double(radiusString)!)
            })
            .padding(.bottom)
            .padding()
            
        } //end VStack
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



