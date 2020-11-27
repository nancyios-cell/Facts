# Facts
 This Project is build on SwiftUI which uses the [api](https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json) to display data.
 
## Note:
1. Xcode 11.6 version is used lately which uses the latest deployment target i.e 13.6 OS
2. [PullToRefresh](https://github.com/siteline/SwiftUIRefresh) is used from this reference in SwiftUI
3. PullTorefresh code for Empty View and added .mov file in project 
```
List{
 Text(self.viewModel.alertMessage)
 }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
 .onAppear { UITableView.appearance().separatorStyle = .none }
 .onDisappear{
 UITableView.appearance().separatorStyle = .singleLine
}
```
