//
//  File.swift
//  BeatOven2nd
//
//  Created by user2 on 29/02/24.
//

import Foundation
import SwiftUI
extension View{
    @available(iOS 14, *)
    func navigationBarColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().barTintColor = uiColor

        return self
    }
}
