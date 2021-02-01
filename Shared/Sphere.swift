//
//  Sphere.swift
//  VolumeAndSurfaceArea
//
//  Created by Matthew Adas on 1/22/21.
//  This subclass only inherits radiusString and NSObject from the parent class, it seems ObservableObject has to be called separately in each subclass

import SwiftUI

class Sphere: NDimensionalObj, ObservableObject{
    
    var radius = 1.0

    @Published var surfAreaSphere = 0.0
    @Published var volSphere = 0.0
    @Published var surfAreaSphereText = ""
    @Published var volSphereText = ""
    
    func calculateSphereAreaAndVolume(passedRadius: Double){
        
        radius = passedRadius
        
        surfAreaSphere = 4 * Double.pi * radius * radius
        surfAreaSphereText = String(format: "%7.5f", surfAreaSphere)
        volSphere = 4 / 3 * Double.pi * radius * radius * radius
        volSphereText = String(format: "%7.5f", volSphere)
        return
    }

}
