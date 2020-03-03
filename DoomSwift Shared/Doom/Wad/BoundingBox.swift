//
//  BoundingBox.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct BoundingBox : LoadFromData{
    init(data: Data) {
        Top = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        Bottom = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
        Left = data.withUnsafeBytes{ $0.load(fromByteOffset: 4, as: Int16.self)}
        Right = data.withUnsafeBytes{ $0.load(fromByteOffset: 6, as: Int16.self)}
    }
    
    let Top, Bottom, Left, Right : Int16
    static private(set) var Size: Int = MemoryLayout<BoundingBox>.size
}
