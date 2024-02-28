//
//  TrackLibraryView.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import SwiftUI

struct TrackLibraryView: View {
    let group: GroupColab
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(0...4,id:\.self){ group in 
                    VStack{
                        HStack(spacing: 10){
                            Image("Rohan")
                                .resizable()
                                .frame(width:70,height: 70)
                                .clipShape(RoundedRectangle(cornerRadius:6))
                            VStack(alignment: .leading){
                                Text("Name the Name")
                                
                                //Elias - 2 days ago
                                Text("Elias - 2 days ago")
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
        }
    }
}

#Preview {
    TrackLibraryView(group: GroupColab.MOCK_GROUPS[1])
}
