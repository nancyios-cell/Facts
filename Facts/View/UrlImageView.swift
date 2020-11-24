//
//  UrlImageView.swift
//  Facts
//
//  Created by Nancy on 24/11/20.
//

import Foundation
import SwiftUI
import Foundation
import Combine

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .clipShape(Circle())
            .shadow(radius: 15)
            .frame(minWidth: 70.0, maxWidth: 70.0, minHeight: 70.0, maxHeight: 70.0)
    }
    
    static var defaultImage = UIImage(named: "ic_img")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
