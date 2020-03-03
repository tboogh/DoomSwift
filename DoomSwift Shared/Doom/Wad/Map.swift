//
// Created by Tobias Boogh on 2019-08-19.
// Copyright (c) 2019 Tobias Boogh. All rights reserved.
//

import Foundation

enum MapError : Swift.Error{
    case loadError(String)
}

class Map {
    static func Load(name: String, data : Data, directories : [Directory]) throws -> Map{
        guard let directory = directories.first(where: {$0.Name == name}) else {
            throw MapError.loadError("Map not found \(name)")
        }
        guard let vertices : [Vertex] = LoadData

        guard let linedef : [Linedef] = data.LoadData(lump: Lump.linedefs, directories: directories) else {
            throw MapError.loadError("Failed to load linedef data from \(name)")
        }

        guard let things : [Thing] = data.LoadData(lump: Lump.things, directories: directories) else {
            throw MapError.loadError("Failed to load things data from \(name)")
        }

        guard let segs : [Seg] = data.LoadData(lump: Lump.segs, directories: directories) else {
            throw MapError.loadError("Failed to load segs data from \(name)")
        }

        guard let nodes : [Node] = data.LoadData(lump: Lump.nodes, directories: directories) else {
            throw MapError.loadError("Failed to load nodes data from \(name)")
        }

        guard let subsector : [SubSector] = data.LoadData(lump: Lump.ssectors, directories: directories) else {
            throw MapError.loadError("Failed to load subsector data from \(name)")
        }

        guard let sectors : [Sector] = data.LoadData(lump: Lump.sectors, directories: directories) else {
            throw MapError.loadError("Failed to load sector data from \(name)")
        }
        
        return Map(name: name)
    }

    let name : String

    init(name: String) {
        self.name = name
    }

    private static func LoadData<T : LoadFromData>(name: String, directories : [Directory], lump : Lump, data : Data) throws -> [T]?{
        do {
            let directory = try directories.FindDirectoryForMap(map: name, lump: lump)
            guard let data : [T] = data.LoadData(directory: directory) else {
                throw MapError.loadError("Failed to load vertex data from \(name)")
            }
            return data
        } catch{
            throw MapError.loadError("Failed to load vertex data from \(name)")
        }
    }
}
