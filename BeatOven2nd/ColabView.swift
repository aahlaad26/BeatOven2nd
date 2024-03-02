//
//  ColabView.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import SwiftUI

struct ColabView: View {
    @State private var searchText = ""
    @State private var groups = GroupColab.MOCK_GROUPS
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(){
                    ForEach(groups.filter { searchText.isEmpty ? true : $0.name.contains(searchText)}){ group in
                         
                            NavigationLink(value: group) {
                                HStack{
                                    Image(group.profileImsgeURL!)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading){
                                        Text(group.name)
                                            .fontWeight(.semibold)
                                        Text("\(group.arrayOfPeople.count) members")
                                            .font(.system(size: 15))
                                    }
                                    .padding(.vertical)
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                    
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                
                                
                            }
                        Divider()
                    }
                }
                .searchable(text: $searchText, prompt: "Search by name...")
            }
            .navigationDestination(for: GroupColab.self) { group in
                TrackLibraryView(group: group)
            }
            .navigationTitle("Colab")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("bg-color"))
            .navigationBarColor(Color("bg-color"))
        }
        
    }

}

#Preview {
    ColabView()
}
//extension View {
//    @available(iOS 14, *)
//    func navigationBarColor(_ color: Color) -> some View {
//        let uiColor = UIColor(color)
//        UINavigationBar.appearance().barTintColor = uiColor
//
//        return self
//    }
//}
