//
//  CatModel.swift
//  Caterator
//
//  Created by serif mete on 2.04.2023.
//

import Foundation

// MARK: - Cataretor
struct Cataretor: Codable {
    let yoastHeadJSON: YoastHeadJSON?
    
    enum CodingKeys: String, CodingKey {
        case yoastHeadJSON = "yoast_head_json"
    }
}



// MARK: - YoastHeadJSON
struct YoastHeadJSON: Codable {
    let ogImage: [OgImage]?
  

    enum CodingKeys: String, CodingKey {
        case ogImage = "og_image"
    }
}

// MARK: - OgImage
struct OgImage: Codable {
    let url: String?
}


