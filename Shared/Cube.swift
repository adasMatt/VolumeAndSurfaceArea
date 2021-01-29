//
//  Cube.swift
//  VolumeAndSurfaceArea (macOS)
//
//  Created by Matthew Adas on 1/29/21.
//

import SwiftUI

class Cube: NSObject, ObservableObject{
    
    var length = 1.0
    @Published var radiusString = "1.0"
    @Published var surfAreaCube = 0.0
    @Published var volCube = 0.0
    @Published var surfAreaCubeText = ""
    @Published var volCubeText = ""
    
    func calculateCubeAreaAndVolume(passedLength: Double){
        
        length = passedLength * 2
        
        surfAreaCube = 2 * length * length + 2 * length * length + 2 * length * length
        surfAreaCubeText = String(format: "%7.5f", surfAreaCube)
        volCube = length * length * length
        volCubeText = String(format: "%7.5f", volCube)
    }
    
}
