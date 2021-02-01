//
//  Cube.swift
//  VolumeAndSurfaceArea (macOS)
//
//  Created by Matthew Adas on 1/29/21.
//  This subclass only inherits radiusString and NSObject from the parent class, it seems ObservableObject has to be called separately in each subclass

import SwiftUI

class Cube: NDimensionalObj, ObservableObject{
    
    var length = 1.0
    
    @Published var surfAreaCube = 0.0
    @Published var volCube = 0.0
    @Published var surfAreaCubeText = ""
    @Published var volCubeText = ""
    
    func calculateCubeAreaAndVolume(passedLength: Double){
        //the passedLength is the same as passedRadius in the Sphere subclass, so it needs to be multiplied by 2 to get the length of one side of the bounding box
        length = passedLength * 2
        //surface area of box 2 x (L x W) + 2 x (L x H) + 2 x (W X H)
        //since this box is a cube this is simplified
        surfAreaCube = 6 * length * length
        surfAreaCubeText = String(format: "%7.5f", surfAreaCube)
        //volume inside cube L x W x H
        volCube = length * length * length
        volCubeText = String(format: "%7.5f", volCube)
        return
    }
    
}
