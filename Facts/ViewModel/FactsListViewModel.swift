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
    @Published var shouldShowAlert: Bool = false
    @Published var alertMessage = ""
    
    //MARK: - Call API -
     func getFactsList()
     {
            WebServices().getFactsList { (success, list, message) in
                DispatchQueue.main.async {
                 self.factList = FactsModel(title: "", rows: [])
                }
                if success {
                    if let list = list {
                        DispatchQueue.main.async {
                            self.factList = list
                            self.shouldShowAlert = false
                        }
                    } else {
                        self.shouldShowAlert = true
                    }
                } else {
                    self.shouldShowAlert = true
                }
                DispatchQueue.main.async {
                    self.alertMessage = message ?? ""
                }
            }
        }
}
