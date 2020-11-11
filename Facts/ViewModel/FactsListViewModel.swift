//
//  FactsListViewModel.swift
//  Facts
//
//  Created by Nancy on 10/11/20.
//

import UIKit
import Foundation
import SwiftUI
import Combine

class FactsListViewModel: ObservableObject {
   // let didChange = PassthroughSubject<FactsListViewModel, Never>()
    
    
    @Published var factList = FactsModel(title: "", rows: [])
    /*{
        didSet {
            didChange.send(self)
        }
    } */
    
     func getFactsList() {
            WebServices().getFactsList { (success, list) in
                if success {
                    if let list = list {
                        DispatchQueue.main.async {
                            self.factList = list
                        }
                    } else {return}
                }
            }
        }
}
