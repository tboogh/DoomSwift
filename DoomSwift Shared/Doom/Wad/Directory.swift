//
//  Directory.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Directory : LoadFromData{
    let Offset : UInt32
    let Size : UInt32
    let Name : String
    
    init(data: Data) {
        Offset = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: UInt32.self)}
        Size = data.withUnsafeBytes{ $0.load(fromByteOffset: 4, as: UInt32.self)}
        Name = data.GetName(range: Range(8...15))
    }

    static private(set) var Size: Int = 16
}
