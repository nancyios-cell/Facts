//
//  FactsModel.swift
//  Facts
//
//  Created by Nancy on 10/11/20.
//

import UIKit
import SwiftUI

/*"title":"About Canada",
"rows":[
    {
    "title":"Beavers",
    "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
    "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
    }]*/

/* class FactsModel: NSObject {
    var rows = [Facts]()
    var title = ""
    
    init(object:[String:AnyObject]) {
        for dict in object["rows"] as! [[String: AnyObject]]{
            let data2 = Facts.init(object: dict)
            rows.append(data2)
        }
        title = object["title"] as! String
    }

}

class Facts: NSObject {
     var title = ""
     var descriptions = ""
     var imageHref = ""
    
    init(object:[String: AnyObject]) {
        title = object["title"] as! String
        descriptions = object["description"] as! String
        imageHref = object["imageHref"] as! String
    }
}  */

/*public protocol Identifiable {

    var id: UUID {
        return UUID()
    }
} */

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



