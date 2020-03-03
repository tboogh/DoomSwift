//
//  Node.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

struct Node : LoadFromData{
    init(data: Data) {
        PartitionX = data.withUnsafeBytes{ $0.load(fromByteOffset: 0, as: Int16.self)}
        PartitionY = data.withUnsafeBytes{ $0.load(fromByteOffset: 2, as: Int16.self)}
        PartitionXDiff = data.withUnsafeBytes{ $0.load(fromByteOffset: 4, as: Int16.self)}
        PartitionYDiff = data.withUnsafeBytes{ $0.load(fromByteOffset: 6, as: Int16.self)}
        
        let boundingBoxSize = BoundingBox.Size
        let leftData = data.subdata(in: Range(8...8+boundingBoxSize))
        let rightData = data.subdata(in: Range(16...16+boundingBoxSize))
        
        Left = BoundingBox(data: leftData)
        Right = BoundingBox(data: rightData)
        
        LeftChild = data.withUnsafeBytes{ $0.load(fromByteOffset: 24, as: Int16.self)}
        RightChild = data.withUnsafeBytes{ $0.load(fromByteOffset: 26, as: Int16.self)}
    }
    
    let PartitionX : Int16
    let PartitionY : Int16
    let PartitionXDiff : Int16
    let PartitionYDiff : Int16
    let Left : BoundingBox
    let Right : BoundingBox
    let RightChild : Int16
    let LeftChild : Int16
    private(set) static var Size: Int = MemoryLayout<Node>.size
}
