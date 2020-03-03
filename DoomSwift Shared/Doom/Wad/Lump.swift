//
//  Lump.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

enum Lump:String{
    case things = "THINGS"
    case linedefs = "LINEDEFS"
    case sidedefs = "SIDEDEFS"
    case vertexes = "VERTEXES"
    case segs = "SEGS"
    case ssectors = "SSECTORS"
    case nodes = "NODES"
    case sectors = "SECTORS"
    case reject = "REJECT"
    case blockmap = "BLOCKMAP"
    case behavior = "BEHAVIOR"
    case scripts = "SCRIPTS"
}
