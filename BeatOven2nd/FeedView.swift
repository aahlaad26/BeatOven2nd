//
//  FeedView.swift
//  BeatOven2nd
//
//  Created by user2 on 27/02/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Button(action:{}){
                        VStack{
                            Text("Guitarist")
                        }
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.black)
                    }
                    
                    Button(action:{}){
                        VStack{
                            Text("Pianist")
                        }
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.black)
                    }
                    Button(action:{}){
                        VStack{
                            Text("Flautist")
                        }
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.black)
                    }
                    Button(action:{}){
                        VStack{
                            Image(systemName: "arrow.up.and.down.text.horizontal")
                        }
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.black)
                    }
                }.padding()
                
                LazyVStack(spacing:32){
                    ForEach(AudioPost.MOCK_POSTS.sorted(by: { $0.date! > $1.date! })){
                        post in
                        FeedCell(audioPost: post)
                    }
                }
            }.navigationTitle("BeatOven")
//                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
//                    ToolbarItem(placement: .navigationBarLeading){
//                        Text("BeatOven")
//                            .font(.system(size: 20))
//                            .fontWeight(.semibold)
//                        
//                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Image(systemName: "heart")
                            
                        
                    }
                }
        }
    }
}

#Preview {
    FeedView()
}
