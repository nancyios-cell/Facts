//
//  FactsModel.swift
//  Facts
//
//  Created by Nancy on 10/11/20.
//

import UIKit
import SwiftUI


struct FactsModel:Hashable, Codable ,Identifiable{
    var id: UUID {
        return UUID()
    }
    var title : String?
    let rows: [Facts]?

    enum CodingKeys: String, CodingKey {
        case title
        case rows 
    }
}

struct Facts: Hashable,Codable,Identifiable {
    var id: UUID {
        return UUID()
    }
    var description : String?
    var imageHref : String?
    var title : String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageHref
        case description
    }
}



