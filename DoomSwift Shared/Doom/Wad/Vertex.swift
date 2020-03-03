//
//  Vertex.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Vertex : LoadFromData{
    init(data: Data) {
        X = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        Y = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
    }
    
    let X : Int16
    let Y : Int16
    private(set) static var Size: Int = MemoryLayout<Vertex>.size
}
