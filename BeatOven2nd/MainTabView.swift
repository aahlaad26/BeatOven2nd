//
//  MainTabView.swift
//  BeatOven2nd
//
//  Created by user2 on 27/02/24.
//

import SwiftUI
class TabItemState: ObservableObject {
    @Published var selectedTab: Int = 0
}
struct MainTabView: View {
    @StateObject var tabItemState = TabItemState()
    @State private var tabSelection: Int = 1
    @State private var goHome = UUID()
    var body: some View {
         
            TabView(selection: $tabItemState.selectedTab) {
                NavigationView{FeedView()}
                    .tabItem { Image(systemName: "house") }
                    .tag(0)
                NavigationView{DiscoverView()}
                    .tabItem { Image(systemName: "magnifyingglass") }
                    .tag(1)
                Text("Colab")
                    .tabItem { Image(systemName: "plus") }
                    .tag(2)
                Text("Chat")
                    .tabItem { Image(systemName: "bubble.right") }
                    .tag(3)
                
                CurrentProfileView()
                    .tabItem { Image(systemName: "person") }
                    .tag(4)
                
            }
            .accentColor(.black)
        
    }
    
}


#Preview {
    MainTabView()
}
