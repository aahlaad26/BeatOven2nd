//
//  SwiftUIView.swift
//  BeatOven2nd
//
//  Created by user2 on 29/02/24.
//

import SwiftUI
import Firebase
class OurData: ObservableObject{
    @Published public var audioPosts = [AudioPost]()
    func loadAudioPosts(){
        Firestore.firestore().collection("songs").getDocuments{(snapshot,error) in
            if error == nil{
                print(snapshot)
            }else{
                print(error)            }
        }
    }
}
