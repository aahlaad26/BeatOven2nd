import SwiftUI

struct AuthenticatedView: View {
    
    @StateObject var tabState = TabState()
            
    var body: some View {
        TabView(selection: $tabState.selectedTab) {
            NavigationView {
                NavigationLink(destination: TestView(titleNum: 0), isActive: $tabState.showTabRoots[0]) {
                    Text("GOTO TestView #1")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(height:50)
                        .background(Color.purple)
                        .cornerRadius(8)
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationViewStyle(.stack)
            .onAppear(perform: {
                tabState.lastSelectedTab = TabState.Tab.first
            }).tabItem {
                Label("First", systemImage: "list.dash")
            }.tag(TabState.Tab.first)
            
            NavigationView {
                NavigationLink(destination: TestView(titleNum: 0), isActive: $tabState.showTabRoots[1]) {
                    Text("GOTO TestView #2")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(height:50)
                        .background(Color.purple)
                        .cornerRadius(8)
                }.navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline).navigationBarTitle(Text(""), displayMode: .inline)
            }
            .navigationViewStyle(.stack)
            .onAppear(perform: {
                tabState.lastSelectedTab = TabState.Tab.second
            }).tabItem {
                Label("Second", systemImage: "square.and.pencil")
            }.tag(TabState.Tab.second)
        }
        .onReceive(tabState.$selectedTab) { selection in
            if selection == tabState.lastSelectedTab {
                tabState.showTabRoots[selection.rawValue] = false
            }
        }
    }
}

struct AuthenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView()
    }
}

class TabState: ObservableObject {
    enum Tab: Int, CaseIterable {
        case first = 0
        case second = 1
    }
        
    @Published var selectedTab: Tab = .first
    @Published var lastSelectedTab: Tab = .first
    
    @Published var showTabRoots = Tab.allCases.map { _ in
        false
    }
}
struct TestView: View {
    
    let titleNum: Int
    let title: String
    
    init(titleNum: Int) {
        self.titleNum = titleNum
        self.title = "TestView #\(titleNum)"
    }
       
    var body: some View {
        VStack {
            Text(title)
            NavigationLink(destination: TestView(titleNum: titleNum + 1)) {
                Text("Goto View #\(titleNum + 1)")
                    .padding()
                    .foregroundColor(Color.white)
                    .frame(height:50)
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            NavigationLink(destination: TestView(titleNum: titleNum + 100)) {
                Text("Goto View #\(titleNum + 100)")
                    .padding()
                    .foregroundColor(Color.white)
                    .frame(height:50)
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
