//
//  HomeView.swift
//  sampleProject
//
//  Created by Vanessa Mpofu on 12/3/23.

import SwiftUI

struct HomeView: View {
    @State private var isMenuVisible = true //new part 
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    HStack(spacing: 15){
                        NavigationLink(destination: EiffelTowerView()){
                            
                            imageIcon(title: "Effiel Tower", imageName: "eiffelTowerImage", lineArt: "eiffelTowerLineArt")
                        }
                        NavigationLink(destination: TajMahalView()){
                            
                            imageIcon(title: "Taj Mahal",imageName: "tajMahalImage", lineArt: "TajMahalLineArt")
                        }
                    }
                    
                    HStack(spacing: 15){
                        NavigationLink(destination: PyramidView()){
                            imageIcon(title: "Pyramids", imageName: "pyramidsImage", lineArt: "pyramidLineArt")
                        }
                        NavigationLink(destination: JurassicView()){
                        imageIcon(title: "Jurrasic Period", imageName: "jurassic", lineArt: "jArt")
                    }
                    }
                    
                    HStack(spacing: 15){
                        NavigationLink(destination: ColosseumView()){
                            imageIcon(title: "Colossuem", imageName: "colBlur", lineArt: "colArt")
                        }
                        NavigationLink(destination: IceAgeView()){
                            imageIcon(title: "Ice Age", imageName: "iceAge", lineArt: "iArt")
                        }
                    }
        
                    Spacer()
                }
                .padding(.all)
                .padding(.top, 10)
                .navigationBarTitle("Home")
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct imageIcon: View{
    var title: String
    var imageName: String
    var lineArt: String
    
    var body: some View{
        //NavigationLink(destination: MapView()){
            ZStack{
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color.red)
                    .frame(height: 170)
                    .overlay {
                        Color(.black)
                            .opacity(0.3)
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

struct bg: View{
    var body: some View{
        Rectangle()
            .foregroundColor(Color("bisque"))
            .frame(width: 100, height: 300)
            .offset(x: 80, y: -10)
            .rotationEffect(.degrees(45))
            .opacity(0.3)
            .ignoresSafeArea()
        
        Rectangle()
            .foregroundColor(Color("brown"))
            .frame(width: 100)
            .offset(x: 200, y: 0)
            .rotationEffect(.degrees(45))
            .opacity(0.3)
            .ignoresSafeArea()
        
    }
}
