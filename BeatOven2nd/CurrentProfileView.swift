//
//  CurrentProfileView.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import SwiftUI

struct CurrentProfileView: View {
    var user = User.MOCK_USERS[4]
    var posts:[AudioPost]{
        return AudioPost.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    //
                    HStack{
                        Image(user.profileImsgeURL!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100,height: 100)
                            .clipShape(Circle())
                        Spacer()
                        VStack(alignment: .leading){
                            Text(user.username)
                                .fontWeight(.bold)
                            
                            Text(user.designation!)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        
                    }.padding(.horizontal)
                    HStack{
                        VStack{
                            Text("\(posts.count)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Posts")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                        VStack{
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Followers")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                        VStack{
                            Text("3")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Following")
                                .font(.footnote)
                        }
                        .frame(width: 72)
                    }
                    //.frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360,height: 42)
                            .foregroundColor(.black)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                    Divider()
                    
                    //Posts
                    
                    VStack{
                        ForEach(posts.sorted(by: { $0.date! > $1.date! })){
                            post in
                            //post
                            VStack{
                                HStack(spacing: 10){
                                    Image(post.ImageURL)
                                        .resizable()
                                        .frame(width:70,height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:6))
                                    VStack(alignment: .leading){
                                        Text(post.audioName)
                                        
                                        //Elias - 2 days ago
                                        Text(timeSinceDate(date:post.date!))
                                            .font(.system(size: 14))
                                            .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)))
                                    }
                                Spacer()
                                Image(systemName: "play.fill")
                                        .resizable()
                                        .frame(width: 20,height: 20)
                                        .foregroundColor(.blue)
                                
                                
                                }
                                .padding()
                                .frame(width: 393,alignment: .leading)
                                HStack{
                                    HStack{
                                        Image(systemName: "heart")
                                        Text("\(post.likes)")
                                    }.frame(width: 75,height: 40)
                                    HStack{
                                        Image(systemName: "bubble.right")
                                        Text("5")
                                    }.frame(width: 75,height: 40)
                                    HStack{
                                        Image(systemName: "square.and.arrow.down")
                                        Text("5")
                                    }.frame(width: 75,height: 40)
                                    
                                }
                                    
                            }
                        }
                    }
                }
            }.navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {}){
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }
                        
                    }
                }
        }
    }
    func timeSinceDate(date: Date) -> String {
            let calendar = Calendar.current
            let now = Date()
           let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: now)
    
           if let year = components.year, year > 0 {
               return "\(year) year" + (year > 1 ? "s" : "") + " ago"
        }
    
            if let month = components.month, month > 0 {
                return "\(month) month" + (month > 1 ? "s" : "") + " ago"
            }
    
            if let day = components.day, day > 0 {
                return "\(day) day" + (day > 1 ? "s" : "") + " ago"
            }
    
            if let hour = components.hour, hour > 0 {
                return "\(hour) hour" + (hour > 1 ? "s" : "") + " ago"
            }
    
            if let minute = components.minute, minute > 0 {
                return "\(minute) minute" + (minute > 1 ? "s" : "") + " ago"
            }
    
            if let second = components.second, second > 0 {
                return "\(second) second" + (second > 1 ? "s" : "") + " ago"
            }
    
            return "Just now"
       }
}

#Preview {
    CurrentProfileView()
}
