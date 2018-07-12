//
//  Article.swift
//  Networking Layer
//
//  Created by Vitor Ferraz on 14/06/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation

struct Banner: Codable {
    let id: Int
    let linkUrl: String
    let urlImagem: String
}

struct DataBanner:Codable{
    let data : [Banner]
}


