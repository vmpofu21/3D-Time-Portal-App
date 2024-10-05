
//
//  MusicView.swift
//  Sample
//
//  Created by Nardos Mamo on 12/5/23.

import SwiftUI
import AVFoundation

struct MusicView: View {
    var body: some View {
        NavigationView {
            VStack {
                // First Row
                HStack(spacing: 15) {
                    NavigationLink(destination: SongListView(songs: ["Song 1", "Song 2", "Song 3", "Song 4", "Song 5"], images: ["Music cover", "Music cover", "Music cover", "Music cover", "Music cover"], titles: ["Arabic", "Egypt Ethnic", "Middle East", "Night of Egypt", "Nomad Places"])) {
                        MIcon(title: "Pyramid", lineArt: "pyramidLineArt")
                    }

                    NavigationLink(destination: SongListView(songs: ["Song 6", "Song 7", "Song 8", "Song 9", "Song 10"], images: ["Taj Maha", "Paris", "Jurrasic", "Collossium", "Ice Age"], titles: ["Indian Classical Tanpura", "60 Second ", "India classical flute", "Music with sitar", "Tunes surbahar"])) {
                        MIcon(title: "Taj Mahal", lineArt: "TajMahalLineArt")
                    }
                }

                // Second Row
                HStack(spacing: 15) {
                    NavigationLink(destination: SongListView(songs: ["Song 11", "Song 12", "Song 13", "Song 14", "Song 15"], images: ["Pyramid", "Taj Maha", "Paris", "Jurrasic", "Collossium"], titles: ["A walk in paris", "French Gypsy", "French Jazz", "Le Chaos Entre", "Pauline"])) {
                        MIcon(title: "Effiel Tower", lineArt: "pyramidLineArt")
                    }

                    NavigationLink(destination: SongListView(songs: ["Song 16", "Song 17", "Song 18", "Song 19", "Song 20"], images: ["Jurrasic", "Collossium", "Ice Age", "Pyramid", "Taj Maha"], titles: ["Avatar the way of Water ", "Jurrassic Park End Title", "Nothing is lost Avatar", "Pyramid", "Taj Mahal"])) {
                        MIcon(title: "Jurrasic World", lineArt: "jArt")
                    }
                }

                HStack(spacing: 15) {
                    NavigationLink(destination: SongListView(songs: ["Song 21", "Song 22", "Song 23", "Song 24", "Song 25"], images: ["Collossium", "Ice Age", "Pyramid", "Taj Maha", "Paris"], titles: ["Collossium", "Ice Age", "Pyramid", "Taj Mahal", "Effiel Tower"])) {
                        MIcon(title: "Collossium", lineArt: "colArt")
                    }

                    NavigationLink(destination: SongListView(songs: ["Song 26", "Song 27", "Song 28", "Song 29", "Song 30"], images: ["Ice Age", "Pyramid", "Taj Maha", "Paris", "Jurrasic"], titles: ["Ice Age", "Pyramid", "Taj Mahal", "Effiel Tower", "Jurrasic World"])) {
                        MIcon(title: "Ice Age", lineArt: "iArt")
                    }
                }

                Spacer()
            }
            .padding(.all)
            .padding(.top, 10)
           // .navigationBarTitle("Home")
            
        }
        .navigationBarTitle("Playlist")
    }
}


struct songIcon: View {
    var title: String
    var imageName: String
    var lineArt: String

    var body: some View {
        ZStack {
            Rectangle()
               // .aspectRatio(contentMode: .fill)
                .frame(height: 80) // Adjust the height as needed
                .foregroundColor(Color.clear)
                .cornerRadius(20)
                .shadow(radius: 4, y: 5)
//
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(height: 80) // Adjust the height as needed
//                .overlay {
//                    Color(.black)
//                        .opacity(0.3)
//                }
//                .cornerRadius(20)
//                .shadow(radius: 4, y: 5)

           // VStack {
//                Image(lineArt)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 50) // Adjust the height as needed

                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
          //  }
        }
    }
}

struct SongListView: View {
    let songs: [String]
    let images: [String]
    let titles: [String]  // Add titles array
    
    let backgroundColors: [Color] = [.red, .blue, .green, .purple, .orange, .pink]

    
    @State private var player: AVAudioPlayer?
    @State private var isPlaying = false
    @State private var currentSongIndex: Int?
    
    init(songs: [String], images: [String], titles: [String]) {
        self.songs = songs
        self.images = images
        self.titles = titles
    }
    
    var body: some View {
        VStack {
            List(songs.indices, id: \.self) { index in
                let song = songs[index]
                let imageName = images[index]
                let title = titles[index]  // Get the title
                Button(action: {
                    // Handle button tap for each song
                    print("Button tapped for \(song)")
                    playSong(song)
                }) {
                    songIcon(title: title, imageName: imageName, lineArt: "")
                       // .background(backgroundColors[index % backgroundColors.count])
                        .background(currentSongIndex == index ? Color("brown") : Color("persianOrange") )
                        .cornerRadius(20)
                }
            }
            .navigationBarTitle("Song List")
            
            // Controls Row
            HStack(spacing: 30) {
                Spacer()
                Button(action: {
                    if isPlaying {
                        player?.currentTime -= 10 // Rewind 10 seconds
                    }
                }) {
                    Image(systemName: "gobackward.10")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    if isPlaying {
                        player?.pause()
                        isPlaying = false
                    } else {
                        player?.play()
                        isPlaying = true
                    }
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(isPlaying ? .gray : .blue)
                }
                
                Button(action: {
                    if isPlaying {
                        player?.currentTime = 0 // Restart from the beginning
                    }
                }) {
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.green)
                }
                
                Spacer()
//                    .background(backgroundColors[index % backgroundColors.count])
            }
           
        }
    }
    
    private func playSong(_ fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3", subdirectory: "Sounds all 2") else {
            print("File not found for \(fileName)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = Coordinator(parent: self)
            
            print("Player initialized with URL: \(player?.url)")
            print("Player duration: \(player?.duration)")
            
            player?.play()
            isPlaying = true
            currentSongIndex = songs.firstIndex(of: fileName)
        } catch let error {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}

extension SongListView {
    class Coordinator: NSObject, AVAudioPlayerDelegate {
        var parent: SongListView
        
        init(parent: SongListView) {
            self.parent = parent
        }
        
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            parent.isPlaying = false
        }
    }
}


struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
       // MIcon(title: "", lineArt: "")
    }
}



struct MIcon: View{
    var title: String
    var lineArt: String
    
    var body: some View{
        //NavigationLink(destination: MapView()){
            ZStack{
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(height: 170)
                    .overlay {
                        Color(.black)
                            .opacity(0.4)
                    }
                    .cornerRadius(20)
                    .shadow(radius: 4, y: 5)
                
                VStack{
                    Image(lineArt)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                    
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
            }
        }
}
