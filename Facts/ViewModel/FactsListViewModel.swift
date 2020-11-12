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
    /*
     @Published is used to announce when cahnges occuer in Observable Object
     */
    @Published var factList = FactsModel(title: "", rows: [])
    
    //MARK: - Call API -
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
