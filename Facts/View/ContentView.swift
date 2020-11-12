//
//  ContentView.swift
//  Facts
//
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = FactsListViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.factList.rows ?? [Facts]()) { object in
                if let img = object.imageHref {
                    NetworkImage(imageURL: URL(string: img),placeholderImage: UIImage())
                        .clipShape(Circle())
                        .shadow(radius: 15)
                        .frame(minWidth: 50.0, maxWidth: 50.0, minHeight: 50.0, maxHeight: 50.0)
                } else {Image.init(systemName:"star.fill")
                    .shadow(radius: 15)
                    .frame(minWidth: 50.0, maxWidth: 50.0, minHeight: 50.0, maxHeight: 50.0)
                }
                VStack(alignment: .leading, spacing: 2.0) {
                    if !(object.title?.isEmpty ?? true) || !(object.description?.isEmpty ?? true) {
                        Text("\(object.title ?? "")")
                            .font(.custom("Avenir - Medium", size: 17))
                        Text("\(object.description ?? "")")
                            .font(.custom("Avenir", size: 14))
                            .foregroundColor(Color(red: 86.0/225.0, green: 86.0/225.0, blue: 86.0/225.0, opacity: 1.0))
                    }
                }
            }.navigationBarTitle("\(viewModel.factList.title ?? "Facts")")
            .font(.custom("Avenir - Medium", size: 22))
            .onAppear {self.viewModel.getFactsList()}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
