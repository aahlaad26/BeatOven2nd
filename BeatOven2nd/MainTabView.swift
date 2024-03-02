//
//  MainTabView.swift
//  BeatOven2nd
//
//  Created by user2 on 27/02/24.
//

import SwiftUI

struct MainTabView: View {
   @State var selectedTab: Int = 0
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("button-color"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray)
        UITabBar.appearance().barTintColor = UIColor(Color("button-color"))
    }
    var body: some View {
         
            TabView(selection: $selectedTab) {
                Group {
                    NavigationView{FeedView()}
                        .tabItem { Image(systemName: "house") }
                        .tag(0)
                    
                    NavigationView{DiscoverView()}
                        .tabItem { Image(systemName: "network") }
                        .tag(1)
                    ColabView()
                        .tabItem { Image(systemName: "music.note") }
                        .tag(2)
                    Text("Chat")
                        .tabItem { Image(systemName: "bubble.right") }
                        .tag(3)
                    
                    CurrentProfileView()
                        .tabItem { Image(systemName: "person") }
                        .tag(4)
                }
               
                
            }
            .accentColor(Color("button2-color"))

        
    }
    
}


#Preview {
    MainTabView()
}
