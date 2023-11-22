//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Sergiy Vergun on 25.10.2023.
//

import Foundation

extension Bundle{
    func decode<T:Codable>(_ file: String)-> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle.")
        }
        //        To know if JSON file is not corupted and it can be used
        guard let data  = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder() 
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
