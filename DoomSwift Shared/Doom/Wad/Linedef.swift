//
//  Linedef.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Linedef : LoadFromData{
    init(data: Data) {
        StartVertex = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        EndVertex = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
        Flags = data.withUnsafeBytes{ $0.load(fromByteOffset: 4, as: Int16.self)}
        LineType = data.withUnsafeBytes{ $0.load(fromByteOffset: 6, as: Int16.self)}
        SectorTag = data.withUnsafeBytes{ $0.load(fromByteOffset: 8, as: Int16.self)}
        FrontSidedef = data.withUnsafeBytes{ $0.load(fromByteOffset: 10, as: Int16.self)}
        BackSidedef = data.withUnsafeBytes{ $0.load(fromByteOffset: 12, as: Int16.self)}
    }
    
    let StartVertex : Int16
    let EndVertex : Int16
    let Flags : Int16
    let LineType : Int16
    let SectorTag : Int16
    let FrontSidedef : Int16
    let BackSidedef : Int16
    private(set) static var Size: Int = MemoryLayout<Linedef>.size
}
