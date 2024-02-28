//
//  Groups.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import Foundation
struct GroupColab:Identifiable,Hashable,Codable{
    let id: String
    var name: String
    var profileImsgeURL:String?
    var arrayOfPeople:[User?]
    
}
extension GroupColab{
    static var MOCK_GROUPS : [GroupColab] = [
        .init(id: NSUUID().uuidString, name: "Nobodies", profileImsgeURL: "fists", arrayOfPeople:[User.MOCK_USERS[1],User.MOCK_USERS[3],User.MOCK_USERS[2]]),
        .init(id: NSUUID().uuidString, name: "Avengers", profileImsgeURL: "spiderman", arrayOfPeople:[User.MOCK_USERS[0],User.MOCK_USERS[1]]),
        .init(id: NSUUID().uuidString, name: "Justice League", profileImsgeURL: "batman", arrayOfPeople:[User.MOCK_USERS[0],User.MOCK_USERS[4]]),
        .init(id: NSUUID().uuidString, name: "Teen Titans", profileImsgeURL: "fists", arrayOfPeople:[User.MOCK_USERS[2],User.MOCK_USERS[4],User.MOCK_USERS[0],User.MOCK_USERS[1]])
    
    
    ]
}
