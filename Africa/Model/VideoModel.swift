//
//  VideoModel.swift
//  Africa
//
//  Created by Sergiy Vergun on 23/12/2023.
//

import Foundation

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    //Computed property
    var thumbnail: String{
        "video-\(id)"
    }
}
