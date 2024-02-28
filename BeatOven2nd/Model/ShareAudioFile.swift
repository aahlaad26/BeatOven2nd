//
//  ShareAudioFile.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import Foundation

struct ShareAudioFile:Identifiable,Codable{
    let id:String
    let ownerUID:String
    let audioName:String
    let ImageURL:String
    var user:User?
    var date:Date?
    var group:GroupColab?
    // var audioURL:
}
extension ShareAudioFile{
    static var MOCK_SHAREDAUDIOS:[ShareAudioFile] = [
        .init(id: NSUUID().uuidString, ownerUID: NSUUID().uuidString, audioName: "Great song", ImageURL: "batman", user: User.MOCK_USERS[1], date: Calendar.current.date(byAdding: .day, value: -10, to: Date()), group: GroupColab.MOCK_GROUPS[0]),
        .init(id: NSUUID().uuidString, ownerUID: NSUUID().uuidString, audioName: "Great song2", ImageURL: "batman", user: User.MOCK_USERS[1], date: Calendar.current.date(byAdding: .day, value: -101, to: Date()), group: GroupColab.MOCK_GROUPS[0]),
        .init(id: NSUUID().uuidString, ownerUID: NSUUID().uuidString, audioName: "Great song3", ImageURL: "batman", user: User.MOCK_USERS[0], date: Calendar.current.date(byAdding: .day, value: -11, to: Date()), group: GroupColab.MOCK_GROUPS[1]),
        .init(id: NSUUID().uuidString, ownerUID: NSUUID().uuidString, audioName: "Great song4", ImageURL: "batman", user: User.MOCK_USERS[0], date: Calendar.current.date(byAdding: .day, value: -10, to: Date()), group: GroupColab.MOCK_GROUPS[2]),
        .init(id: NSUUID().uuidString, ownerUID: NSUUID().uuidString, audioName: "Great song5", ImageURL: "batman", user: User.MOCK_USERS[1], date: Calendar.current.date(byAdding: .day, value: -1, to: Date()), group: GroupColab.MOCK_GROUPS[3]),
        .init(id: NSUUID().uuidString, ownerUID: NSUUID().uuidString, audioName: "Great song6", ImageURL: "batman", user: User.MOCK_USERS[1], date: Calendar.current.date(byAdding: .day, value: -8, to: Date()), group: GroupColab.MOCK_GROUPS[3])
    
    
    
    ]
}
