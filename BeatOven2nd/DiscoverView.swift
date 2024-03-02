//
//  DiscoverView.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import SwiftUI

struct DiscoverView: View {
    @State private var searchText = ""
    @State private var users = User.MOCK_USERS
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(){
                    ForEach(users.filter { searchText.isEmpty ? true : $0.username.contains(searchText)}){ user in
                        if (user.username == "Chadwick Boseman") {
                            EmptyView()
                        } else {
                            NavigationLink(value: user) {
                                HStack{
                                    Image(user.profileImsgeURL!)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading){
                                        Text(user.username)
                                            .fontWeight(.semibold)
                                        Text(user.designation!)
                                    }
                                    .padding(.vertical)
                                    Spacer()
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                Divider()
                            }
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search by username...")
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.inline)
            //.navigationBarColor(Color("bg-color"))
            .background(Color("bg-color"))
            
        }
    }
}

#Preview {
    DiscoverView()
}
