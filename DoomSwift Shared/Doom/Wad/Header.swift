//
//  Header.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Header : LoadFromData{
    let Offset : UInt32
    let Size : UInt32
    let LumpName : String

    init(data: Data) {
        LumpName = String(bytes: data.subdata(in: Range(0...3)), encoding: .ascii) ?? "Error"
        Size = data.withUnsafeBytes{ $0.load(fromByteOffset: 4, as: UInt32.self)}
        Offset = data.withUnsafeBytes{ $0.load(fromByteOffset: 8, as: UInt32.self)}
    }

    private(set) static var Size: Int = 12
}
