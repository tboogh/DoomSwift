//
//  Subsector.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct SubSector : LoadFromData{
    init(data: Data) {
        SegCount = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        FirstSegNumber = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
    }
    
    let SegCount : Int16
    let FirstSegNumber : Int16
    private(set) static var Size: Int = MemoryLayout<SubSector>.size
}