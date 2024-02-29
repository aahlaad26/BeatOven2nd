//
//  BeatOven2ndApp.swift
//  BeatOven2nd
//
//  Created by user2 on 27/02/24.
//

import SwiftUI
import Firebase
@main
struct BeatOven2ndApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
