//
//  FeedCell.swift
//  BeatOven2nd
//
//  Created by user2 on 27/02/24.
//

import SwiftUI

struct FeedCell: View {
    
    let audioPost:AudioPost
    var body: some View {
        VStack{
            HStack{
                Image(audioPost.user?.profileImsgeURL ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60,height: 60)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading){
                    Text(audioPost.user?.username ?? "")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text((audioPost.user?.designation)!)
                        .font(.system(size: 14))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)))
                                }
                Spacer()
                Button(action:{} ){
                    Text("Colab now")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .frame(width: 70,height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                   
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            VStack{
                HStack(spacing: 10){
                    Image(audioPost.ImageURL)
                        .resizable()
                        .frame(width:40,height: 40)
                        .clipShape(RoundedRectangle(cornerRadius:6))
                    VStack(alignment: .leading){
                        Text(audioPost.audioName)
                            .font(.system(size: 12))
                        
                        //Elias - 2 days ago
                        Text(timeSinceDate(date: audioPost.date!))
                            .font(.system(size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)))
                    }
                Spacer()
                Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.blue)
                
                }
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                .frame(width: 350,alignment: .leading)
                HStack(spacing:70){
                    HStack{
                        Image(systemName: "heart")
                        Text("\(audioPost.likes)")
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
            
        }.frame(width: UIScreen.main.bounds.width-50)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow( radius: 5) // Add this line
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
    FeedCell(audioPost: AudioPost.MOCK_POSTS[0])
}
