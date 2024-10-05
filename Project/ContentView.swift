//
//  ContentView.swift
//  sampleProject
//
//  Created by Surya Sharma, Vanessa Mpofu and Nardos Mamo on 11/28/23.

import SwiftUI

struct ContentView: View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    @State private var shouldRemoveAllModels = false
    
    @State var selectedIndex = 0
    @State var presented: Bool = false
    let icons = ["house.fill", "location.fill", "camera.fill", "music.note.list"]
    
    private var models: [Model] = {
          let fileManager = FileManager.default
          guard let path = Bundle.main.resourcePath,
                let files = try? fileManager.contentsOfDirectory(atPath: path) else {
              return []
          }
          return files
              .filter { $0.hasSuffix(".usdz") }
              .compactMap { $0.replacingOccurrences(of: ".usdz", with: "") }
              .compactMap { Model(modelName: $0 ) }
      }()
    
    
    var body: some View {
        VStack{
            VStack{
                switch selectedIndex{
//                case 0:
//                    NavigationView{
//                        HomeView()
//                    }
                    
                case 1:
                    NavigationView{
                        LocationView()
                    }
                    
                case 2:
                    NavigationView{
                        //LocationView()
                        ZStack(alignment: .bottom) {
                                   ARViewRepresentable(
                                       modelConfirmedForPlacement: $modelConfirmedForPlacement,
                                       shouldRemoveAllModels: $shouldRemoveAllModels
                                   )

                                       if isPlacementEnabled {
                                           PlacementButtonView(
                                               isPlacementEnabled: $isPlacementEnabled,
                                               selectedModel: $selectedModel,
                                               modelConfirmedForPlacement: $modelConfirmedForPlacement
                                           )
                                      } else {
                                           ModelPickerView(
                                               isPlacementEnabled: $isPlacementEnabled,
                                               selectedModel: $selectedModel,
                                               models: models
                                           )
                                    }
                            }
                        .edgesIgnoringSafeArea(.all)
                    }
                    
                case 3:
                    NavigationView{
                        MusicView()
                    }
                    
                default:
                    NavigationView{
                        HomeView()
                    }
                }
            }
    
            HStack{
                ForEach(0..<4, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        self.selectedIndex = number
                        
                    }, label: {
                            Image(systemName: icons[number])
                                .foregroundColor(selectedIndex == number ? Color("persianOrange") : Color("unselectedColor"))
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .frame(width: 60, height: 60)
                        
                    })
                    Spacer()
                }
            }
        }
        .background(.white)
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

