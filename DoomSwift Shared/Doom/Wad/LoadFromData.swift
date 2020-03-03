//
//  LoadFromData.swift
//  DoomSwift iOS
//
//  Created by Tobias Boogh on 2019-08-17.
//  Copyright © 2019 Tobias Boogh. All rights reserved.
//

import Foundation

protocol LoadFromData {
    init(data : Data)
    static var Size : Int {get}
}

extension Array where Element == Directory{
    enum FindError : Error{
        case DirectoryNotFound(map: String, lump : Lump)
    }
    
    func FindDirectoryForMap(map : String, lump : Lump) throws -> Directory{
        var found = false
        for directory in self {
            found = (directory.Name == map)
            if (found && directory.Name == lump.rawValue){
                return directory
            }
        }
        throw FindError.DirectoryNotFound(map: map, lump: lump)
    }
}

extension Data{
    func GetName(range : Range<Int>) -> String{
        var nameData = self.subdata(in: range);
        let lastZero = nameData.firstIndex(of: 0)
        if let lastZero = lastZero{
            if (lastZero < nameData.count && lastZero != 0) {
                nameData = nameData.subdata(in: Range(0...lastZero-1))
            }
        }

        let name = String(bytes: nameData, encoding: .ascii)?.trimmingCharacters(in: CharacterSet(charactersIn: "")) ?? "Error"
        return name
    }

    func LoadData<T : LoadFromData>(directory : Directory) -> [T]?{
        print("Load \(directory.Name)")
        var values : [T] = []
        
        let size = T.Size
        
        for index in 0...directory.Size - 1{
            let start = Int(directory.Offset) + size * Int(index)
            let end = start + size
            let subdata = self.subdata(in: Range(start...end))
            let item = T(data: subdata)
            values.append(item)
        }
        
        return values
    }
    
    func LoadData<T : LoadFromData>(lump : Lump, directories : [Directory]) -> [T]?{
        guard let directory = directories.first(where: {$0.Name == lump.rawValue}) else {
            print("Directory not found \(lump.rawValue)")
            return nil
        }
        print("Load \(directory.Name)")
        var values : [T] = []

        let size = T.Size

        for index in 0...directory.Size - 1{
            let start = Int(directory.Offset) + size * Int(index)
            let end = start + size
            let subdata = self.subdata(in: Range(start...end))
            let item = T(data: subdata)
            values.append(item)
        }

        return values
    }
}
