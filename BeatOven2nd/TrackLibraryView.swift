//
//  TrackLibraryView.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import SwiftUI

struct TrackLibraryView: View {
    let group: GroupColab
    var audioFiles:[ShareAudioFile]{
        return ShareAudioFile.MOCK_SHAREDAUDIOS.filter({$0.group?.name == group.name})
    }
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(audioFiles){ audio in
                    VStack{
                        HStack(spacing: 10){
                            Image(audio.ImageURL)
                                .resizable()
                                .frame(width:70,height: 70)
                                .clipShape(RoundedRectangle(cornerRadius:6))
                            VStack(alignment: .leading){
                                Text(audio.audioName)
                                
                                //Elias - 2 days ago
                                Text("\((audio.user?.username)!)- \(timeSinceDate(date:audio.date!))")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)))
                            }
                        Spacer()
                        Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .foregroundColor(.blue)
                        
                        
                        }
                        .padding(.horizontal)
                        .padding(.vertical,5)
                        .frame(width: 393,alignment: .leading)
                            
                    }
                }
            }.navigationTitle(group.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {}){
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }
                        
                    }
                }
                .navigationBarColor(Color("bg-color"))
                .background(Color("bg-color"))
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
    TrackLibraryView(group: GroupColab.MOCK_GROUPS[1])
}
