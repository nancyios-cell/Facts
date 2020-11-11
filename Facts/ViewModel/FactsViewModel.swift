//
//  FactsViewModel.swift
//  Facts
//
//  Created by Nancy on 10/11/20.
//

import UIKit
//protocol FactsProtocol {
//    func getFactsList(_ completionHandler: @escaping (_ success: Bool, _ list: FactsModel)->())
//}

class FactsViewModel: Identifiable {
    let id = UUID()
    
    let facts: FactsModel
    
    init(facts: FactsModel) {
        self.facts = facts
    }
    
    var title: String {
        guard let title = self.facts.title else {return ""}
        return title
    }
    var rows : Facts {
       // guard let desc = self.facts.description else {return ""}
        return self.rows
    }
//    var imageHref: String {
//        guard let image = self.facts.imageHref else {return ""}
//        return image
//    }
}
