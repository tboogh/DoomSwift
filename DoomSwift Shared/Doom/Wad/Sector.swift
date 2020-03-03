//
// Created by Tobias Boogh on 2019-08-18.
// Copyright (c) 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Sector : LoadFromData {
    init(data: Data) {
        FloorHeight = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        CeilingHeight = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
        NameOfFloorTexture = data.GetName(range: Range(4...12))
        NameOfCeilingTexture = data.GetName(range: Range(12...20))
        LightLevel = data.withUnsafeBytes{ $0.load(fromByteOffset: 20, as: Int16.self)}
        SectorType = data.withUnsafeBytes{ $0.load(fromByteOffset: 22, as: Int16.self)}
        Tag = data.withUnsafeBytes{ $0.load(fromByteOffset: 24, as: Int16.self)}
    }

    let FloorHeight : Int16
    let CeilingHeight : Int16
    let NameOfFloorTexture : String
    let NameOfCeilingTexture : String
    let LightLevel : Int16
    let SectorType : Int16
    let Tag : Int16
    private(set) static var Size: Int = 26
}
