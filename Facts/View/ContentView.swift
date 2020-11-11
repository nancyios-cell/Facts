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
                Image("ic_img")
                    .cornerRadius(10.0)
                VStack(alignment: .leading, spacing: 2.0) {
                    Text("\(object.title ?? "empty")")
                        .font(.title2)
                    Text("\(object.description ?? "empty")")
                        .font(.subheadline)
                        .foregroundColor(Color(red: 86.0/225.0, green: 86.0/225.0, blue: 86.0/225.0, opacity: 1.0))
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
