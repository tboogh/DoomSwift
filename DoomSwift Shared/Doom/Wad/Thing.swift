//
//  Thing.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Thing : LoadFromData{
    init(data: Data) {
        X = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        Y = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
        Angle = data.withUnsafeBytes{ $0.load(fromByteOffset: 4, as: Int16.self)}
        DoomEdType = data.withUnsafeBytes{ $0.load(fromByteOffset: 6, as: Int16.self)}
        Flags = data.withUnsafeBytes{ $0.load(fromByteOffset: 8, as: Int16.self)}
    }
    
    let X : Int16
    let Y : Int16
    let Angle : Int16
    let DoomEdType : Int16
    let Flags : Int16
    private(set) static var Size: Int = MemoryLayout<Thing>.size
}
