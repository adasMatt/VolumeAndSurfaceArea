//
//  Sphere.swift
//  VolumeAndSurfaceArea
//
//  Created by Matthew Adas on 1/22/21.
//

import SwiftUI

class Sphere: NSObject, ObservableObject{
    
    var radius = 1.0
    @Published var radiusString = "1.0"
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
    }

}
