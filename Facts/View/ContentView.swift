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
                        .cornerRadius(10.0)
                        .clipped()
                        .frame(minWidth: 50.0, maxWidth: 50.0, minHeight: 50.0, maxHeight: 50.0)
                } else {Image.init("heart.fill")}
                VStack(alignment: .leading, spacing: 2.0) {
                    if let obj = object.title, let desc = object.description{
                        Text("\(obj)")
                            .font(.title2)
                        Text("\(desc)")
                            .font(.subheadline)
                            .foregroundColor(Color(red: 86.0/225.0, green: 86.0/225.0, blue: 86.0/225.0, opacity: 1.0))
                    } else{Text("")}
                }
            }.navigationBarTitle("\(viewModel.factList.title ?? "Facts")")
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
