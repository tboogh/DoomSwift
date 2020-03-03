//
//  Wad.swift
//  DoomSwift
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

enum WadError : Swift.Error{
    case loadError(String)
}

class Wad : NSObject{
    let path : URL
    
    
    init(path : URL) {
        self.path = path
    }
    
    func Load() throws {
        var data : Data
        do {
            data = try Data.init(contentsOf: path)
        } catch{
            throw error
        }

        let header = try TryLoadHeader(data: data)
        guard let directories = LoadDirectories(data: data, header: header) else {
            print("Failed to load directories from \(path)")
            return
        }

        do {
            let map = try Map.Load(name: "E1M1", data: data, directories: directories);
        } catch {
            print("Failed to load map E1M1 ")
            return
        }
    }



    func TryLoadHeader(data: Data) throws -> Header{
        do {
            return Header(data: data)
        } catch{
            throw WadError.loadError("Failed to read header from \(path)")
        }
    }
    
    func LoadDirectories(data : Data, header : Header) -> [Directory]?{
        var directories : [Directory] = []
        for index in 0...header.Size - 1{
            let start = Int(header.Offset) + Int(index) * Directory.Size
            var end = start + 16
            if end > data.count - 1{
                end = data.count - 1
            }
            let subdata = data.subdata(in: Range(start...end))
            let directory = Directory(data: subdata)
            directories.append(directory)
        }
        return directories;
    }
}
