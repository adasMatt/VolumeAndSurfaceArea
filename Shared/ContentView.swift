//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Adas on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    //version 2, separate classes Sphere and Cube
    //for version 3, subclasses will be Sphere and Cube but their parent classes will be..
    //...Ellipsoid and Box
    //Box subclass should have length, width, height instead of just radius?
    //Box subclass can be “Cube” for v2
    //this way i can maybe use the overwrite command for calculating
    @ObservedObject private var sphereModel = Sphere()
    @ObservedObject private var cubeModel = Cube()
    @State var radiusString = "1.0"
    
    var body: some View {
        
        VStack{
            Text("Sphere Radius")
                .padding(.top)
                .padding(.bottom, 0)
                //TextField("Enter Radius", text: $radiusString, onCommit: {self.calculateCircle()})
            TextField("Enter Radius", text: $radiusString, onCommit: {
                sphereModel.calculateSphereAreaAndVolume(passedRadius: Double(radiusString)!)
                cubeModel.calculateCubeAreaAndVolume(passedLength: Double(radiusString)!)
            })
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

            HStack{
                
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
                Text("Volume of\nSphere")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15.0)
                    
                Text("Volume of\nBounding Box")
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20.0)
                    
            }
            
            HStack{
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
                    } //endHStack

            Button("Calculate", action: {
                sphereModel.calculateSphereAreaAndVolume(passedRadius: Double(radiusString)!)
                cubeModel.calculateCubeAreaAndVolume(passedLength: Double(radiusString)!)
            })
            .padding(.bottom)
            .padding()
            
        } //end VStack
        
    }
    

    /*
    func calculationFunction(){
        
        sphereModel.calculateSphereAreaAndVolume(<#T##Double#>(radiusString)!)
        cubeModel.calculateCubeAreaAndVolume(<#T##Double#>(radiusString)!)
        
    }*/
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



