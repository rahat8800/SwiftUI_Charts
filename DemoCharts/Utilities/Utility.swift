//
//  Utility.swift
//  DemoCharts
//
//  Created by Rahat Pasha on 11/02/24.
//

import Foundation
import SwiftUI

extension Color {
    init?(hex: String) {
        var formattedHex = hex
        // Remove "#" if present
        if formattedHex.hasPrefix("#") {
            formattedHex.remove(at: formattedHex.startIndex)
        }
        
        // Ensure the string has 6 characters after removing "#"
        guard formattedHex.count == 6 else {
            return nil
        }
        
        // Convert the hexadecimal string to UInt
        var rgbValue: UInt64 = 0
        Scanner(string: formattedHex).scanHexInt64(&rgbValue)
        
        // Extract the red, green, and blue components
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        // Create the Color instance
        self.init(red: red, green: green, blue: blue)
    }
}

extension View {
    @ViewBuilder
    func forceRotation(orientation: UIInterfaceOrientationMask) -> some View {
        
        self.onAppear() {
            AppDelegate.orientationLock = .landscape
        }
        // Reset orientation to previous setting
        let currentOrientation = AppDelegate.orientationLock
        self.onDisappear() {
            AppDelegate.orientationLock = currentOrientation
        }
        
    }
}
