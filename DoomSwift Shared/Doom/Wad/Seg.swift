//
//  Seg.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Seg : LoadFromData{
    let Start : Int16
    let End : Int16
    let Angle : Int16
    let Linedef : Int16
    let Direction : Int16
    let Offset : Int16
    
    init(data: Data) {
        Start = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        End = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
        Angle = data.withUnsafeBytes{ $0.load(fromByteOffset: 4, as: Int16.self)}
        Linedef = data.withUnsafeBytes{ $0.load(fromByteOffset: 6, as: Int16.self)}
        Direction = data.withUnsafeBytes{ $0.load(fromByteOffset: 8, as: Int16.self)}
        Offset = data.withUnsafeBytes{ $0.load(fromByteOffset: 10, as: Int16.self)}
    }

    private(set) static var Size: Int = MemoryLayout<Seg>.size
}
