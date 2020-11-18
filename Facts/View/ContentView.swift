//
//  ContentView.swift
//  Facts
//
//

import SwiftUI
import Combine

struct ContentView: View {
    /*
     @Observable Object is used to store an instance properties inside a View,
     @State is used to modify the values
     */

    @ObservedObject var viewModel = FactsListViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List(viewModel.factList.rows ?? [Facts]()) { object in
                    if !(object.imageHref?.isEmpty ?? false)  {
                        NetworkImage(imageURL: URL(string: object.imageHref ?? ""),placeholderImage: UIImage())
                            .clipShape(Circle())
                            .shadow(radius: 15)
                            .frame(minWidth: 60.0, maxWidth: 60.0, minHeight: 60.0, maxHeight: 60.0)
                    } else {Image.init(systemName:"star.fill")
                        .shadow(radius: 15)
                        .frame(minWidth: 60.0, maxWidth: 60.0, minHeight: 60.0, maxHeight: 60.0)
                    }
                    VStack(alignment: .leading, spacing: 5.0) {
                            Text("\(object.title ?? "No title")")
                                .font(.custom("Avenir - Medium", size: 18))
                                .lineSpacing(5.0)
                            Text("\(object.description ?? "No description")")
                                .font(.custom("Avenir", size: 15))
                                .foregroundColor(Color(red: 86.0/225.0, green: 86.0/225.0, blue: 86.0/225.0, opacity: 1.0))
                    }
                }
                .accessibility(identifier: "tableView")
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("\(viewModel.factList.title ?? "Facts")")
            .onAppear {
                UITableView.appearance().showsVerticalScrollIndicator = false
                self.viewModel.getFactsList()
            }
        }
        .font(.custom("Avenir - Medium", size: 22))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
