//
//  DataModel.swift
//  DemoCharts
//
//  Created by AzulArc on 11/02/24.
//

import Foundation

struct MountPrice: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
}
