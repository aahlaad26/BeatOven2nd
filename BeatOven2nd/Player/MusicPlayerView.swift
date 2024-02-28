//
//  MusicPlayerView.swift
//  BeatOven2nd
//
//  Created by user2 on 29/02/24.
//

import SwiftUI
import AVKit
struct MusicPlayerView: View {
    @State private var musicData: Data?
    @State private var isPickerPresented = false
    @State private var player: AVPlayer?
    var body: some View {
        NavigationView{
            VStack {
                
                AudioPlayerView(player: $player)
                
//                if let musicData = musicData {
//                    AudioPlayerView(musicData: musicData, player: $player)
//                } else {
//                    Button("Select Music") {
//                        isPickerPresented.toggle()
//                    }
//                    .fileImporter(
//                        isPresented: $isPickerPresented,
//                        allowedContentTypes: [.audio],
//                        allowsMultipleSelection: false
//                    ) { result in
//                        do {
//                            let fileURL = try result.get().first!
//                            let data = try Data(contentsOf: fileURL)
//                            musicData = data
//                            let url = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
//                                let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
//
//                                player = try AVPlayer(playerItem:playerItem)
//                        } catch {
//                            print("Error reading the selected file: \(error.localizedDescription)")
//                        }
//                    }
//                }
            }
            .padding()
        }
    }
}

#Preview {
    MusicPlayerView()
}


struct AudioPlayerView: View {
    @Binding var player: AVPlayer?
    
    var body: some View {
        VStack {
            Text("Now Playing")
                .font(.headline)
                .padding(.top, 20)
            
            AudioPlayerControlsView(player: $player)
        }
        .onAppear {
            if player == nil {
                do {let url = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
                    let playerItem:AVPlayerItem = AVPlayerItem(url: url!)

                    player = try AVPlayer(playerItem:playerItem)
                    
            
                } catch {
                    print("Error creating AVAudioPlayer: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct AudioPlayerControlsView: View {
    @Binding var player: AVPlayer?
    @State private var isPlay = true
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                self.playPause()
            }) {
                Image(systemName: isPlay ? "play.fill":"pause.fill")
            }
            
        }
        .padding(.top, 20)
    }
    func playPause(){
        self.isPlay.toggle()
        if isPlay{
            player?.pause()
        }
        else{
            player?.play()
        }
    }
//    func next(){
//
//    }
//    func prev(){
//
//    }
}
