//
//  User.swift
//  BeatOven2nd
//
//  Created by user2 on 28/02/24.
//

import Foundation
import SwiftUI
struct User: Identifiable,Hashable,Codable{
    let id: String
    var username: String
    var profileImsgeURL:String?
    var designation:String?
    let email:String
    
}
extension User{
    static var MOCK_USERS:[User] = [
        .init(id: NSUUID().uuidString, username: "Batman",profileImsgeURL: "batman",designation: "Guitarist", email: "kk3344@srmist.edu.in"),
        .init(id: NSUUID().uuidString, username: "Spiderman",profileImsgeURL: "spiderman",designation: "Pianist",email: "kr.aireddy@gmail.com")
        ,
        .init(id: NSUUID().uuidString, username: "Rohan",profileImsgeURL: "Rohan",designation: "Flautist",email: "kr.airedy@gmail.com")
        ,
        .init(id: NSUUID().uuidString, username: "Superman",profileImsgeURL: "fists",designation: "Singer",email: "kr.airey@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Chadwick Boseman",profileImsgeURL: "black-panther-1",designation: "Guitarist",email: "kr.airey@gmail.com")
    
    ]
}
