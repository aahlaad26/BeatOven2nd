//
//  AudioPosts.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import Foundation
import SwiftUI
import Firebase
let db = Firestore.firestore()
struct AudioPost: Identifiable,Codable{
    let id:String
    let ownerUID:String
    let audioName:String
    var likes:Int
    let ImageURL:String
    var user:User?
    var date:Date?
    // var audioURL: String/URL?
}
extension AudioPost{
    static var MOCK_POSTS : [AudioPost] = [
        .init(id: NSUUID().uuidString, ownerUID:NSUUID().uuidString, audioName: "Hello", likes: 32, ImageURL: "fists", user: User.MOCK_USERS[0],date: Calendar.current.date(byAdding: .day, value: -10, to: Date())),
        .init(id: NSUUID().uuidString, ownerUID:NSUUID().uuidString, audioName: "Good Morning", likes: 12, ImageURL: "batman", user: User.MOCK_USERS[1],date: Calendar.current.date(byAdding: .day, value: -1, to: Date())),
        .init(id: NSUUID().uuidString, ownerUID:NSUUID().uuidString, audioName: "Good Afternoon", likes: 2, ImageURL: "black-panther-1", user: User.MOCK_USERS[2],date: Calendar.current.date(byAdding: .day, value: -1000, to: Date())),
        .init(id: NSUUID().uuidString, ownerUID:NSUUID().uuidString, audioName: "Good Night", likes: 3, ImageURL: "Rohan", user: User.MOCK_USERS[0],date: Calendar.current.date(byAdding: .day, value: -100, to: Date())),
        .init(id: NSUUID().uuidString, ownerUID:NSUUID().uuidString, audioName: "Good Night", likes: 3, ImageURL: "spiderman", user: User.MOCK_USERS[4],date: Calendar.current.date(byAdding: .day, value: 50, to: Date()))
    ]
}
