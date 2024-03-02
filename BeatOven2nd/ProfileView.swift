//
//  ProfileView.swift
//  BeatOven2nd
//
//  Created by user2 on 27/02/24.
//

import SwiftUI

struct ProfileView: View {
    let user:User
    var posts:[AudioPost]{
        return AudioPost.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    var body: some View {
        //NavigationView {
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
                        
                        
                    }
                    
                    //.frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
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
                    
                    HStack {
                        Button(action: {}) {
                            Text("Follow")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)

                                .padding()
                                .foregroundColor(.black)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                 // Set the button width to fill the available space
                        }
                        Button(action: {}) {
                            Text("Message")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                            
                                .foregroundColor(.black)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                 // Set the button width to fill the available space
                        }
                        Button(action: {}) {
                            Text("Collab")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                
                                // Set the button width to fill the available space
                        }
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
                            Divider()
                        }
                    }
                }
            }.navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarColor(Color("bg-color"))
                .background(Color("bg-color"))

        //}
        
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
    ProfileView(user: User.MOCK_USERS[0])
}
