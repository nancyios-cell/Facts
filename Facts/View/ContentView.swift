//
//  ContentView.swift
//  Facts
//
//

import SwiftUI
import Combine
import SwiftUIRefresh

struct ContentView: View {
    /*
     @Observable Object is used to store an instance properties inside a View,
     @State is used to modify the values
     */
    
    @ObservedObject var viewModel = FactsListViewModel()
    @State private var image = Image("ic_img")
    @State private var isShowing = false
    
    var body: some View {
        NavigationView{
            VStack{
                if viewModel.factList.rows?.count != 0 {
                    List(viewModel.factList.rows?.filter({$0.title != nil && $0.description != nil}) ?? [Facts]()) { object in
                        if (object.imageHref != nil)  {
                            UrlImageView(urlString: object.imageHref)
                        } else {
                            self.image
                                .clipShape(Circle())
                                .shadow(radius: 15)
                                .frame(minWidth: 80.0, maxWidth: 80.0, minHeight: 80.0, maxHeight: 80.0)
                        }
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text("\(object.title ?? "")")
                                .font(.custom("Avenir - Medium", size: 18))
                                .lineSpacing(5.0)
                            Text("\(object.description ?? "")")
                                .font(.custom("Avenir", size: 15))
                                .foregroundColor(Color(red: 86.0/225.0, green: 86.0/225.0, blue: 86.0/225.0, opacity: 1.0))
                        }
                    }
                    .accessibility(identifier: "tableView")
                    .pullToRefresh(isShowing: $isShowing) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.isShowing = false
                            self.viewModel.getFactsList()
                        }
                    }
                    Spacer()
                } else {
                    Text("No Data Available")
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("\(viewModel.factList.title ?? "Facts")")
            .onAppear(perform: {
                UITableView.appearance().showsVerticalScrollIndicator = false
                self.viewModel.getFactsList() })
                .alert(isPresented: $viewModel.shouldShowAlert, content: { () -> Alert in
                    Alert.init(title: Text("Please check your connection and try again.")) })
        }
        .navigationViewStyle(StackNavigationViewStyle())
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


