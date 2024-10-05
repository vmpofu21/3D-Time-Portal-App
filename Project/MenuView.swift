//
//  MenuView.swift
//  sampleProject
//
//  Created by Surya Sharma and Vanessa Mpofu on 12/2/23.
//

import SwiftUI
struct MenuView: View {
    var body: some View {
        VStack {
            // TajMahalView()
           //ColosseumView()
        //EiffelTowerView()
         //   JurassicView()
         // IceAgeView()
            //PyramidView(isMenuVisible: false)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct CircleImage: View {
    @State var imageName: String
    
    var body: some View {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 6)
                )
//                .shadow(radius: 7)
    }
}

//struct ARButton: View{
//    @State private var modelConfirmedForPlacement: Model?
//    @State private var shouldRemoveAllModels = false
//
//    var body: some View{
//        NavigationLink(destination:  ARViewRepresentable(
//            modelConfirmedForPlacement: $modelConfirmedForPlacement,
//            shouldRemoveAllModels: $shouldRemoveAllModels
//        ))
//        {
//            Rectangle()
//                .frame(width: 100, height: 40)
//                .foregroundColor(Color("brown"))
//                .font(.system(size: 15))
//                .fontWeight(.semibold)
//                .cornerRadius(10)
//                .overlay(
//                    Text("Try AR")
//                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
//                )
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}

struct ARButton: View {
    @State private var isARViewActive = false
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
        Button(action: {
            isARViewActive = true
        }) {
            Rectangle()
                .frame(width: 100, height: 40)
                .foregroundColor(Color("brown"))
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .cornerRadius(10)
                .overlay(
                    Text("Try AR")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                )
        }
        .sheet(isPresented: $isARViewActive) {
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
        .ignoresSafeArea()
    }
}



struct TajMahalView : View{
    
        var body: some View{
            VStack{
                
                LocationView()
                    .frame(height: 200)
                   // .ignoresSafeArea()
               
                    CircleImage(imageName: "tmClear")
                        .offset(y: -100)
                        .padding(.bottom, -110)
                    
                    VStack(alignment: .leading) {
                        ScrollView(){
                            
                        Text("Taj Mahal")
                            .font(.title)
                            .fontWeight(.bold)
                            
                        HStack {
                            Text("Agra, India")
                            Spacer()
                            ARButton()
                        }
                        .font(.system(size: 15))
                        .foregroundStyle(.secondary)
                        
                        Divider()
                            VStack(spacing: 15){
                                Text("About Taj Mahal")
                                    .font(.system(size: 20))
                                    .fontWeight(.light)
                                VStack{
                                    HStack{
                                        Text("Time Period:")
                                            .font(.system(size: 17, weight: .medium))
                                        Spacer()
                                    }
                                    
                                    Text("Commissioned in 1632 by the Mughal emperor Shah Jahan, the  construction of the Taj Mahal spanned over 20 years, eventually completing in the 17th century.")
                                       // .padding(3)
                                }
                                
                                VStack{
                                    HStack{
                                        Text("Geographical Impact:")
                                            .font(.system(size: 17, weight: .medium))
                                        Spacer()
                                    }
                                    
                                    Text("Situated in Agra, India, the Taj Mahal stands as a stunning example of Mughal architecture, crafted from white marble by thousands of artisans.")
                                        //.padding(3)
                                }
                                
                                VStack{
                                    HStack{
                                        Text("Fun Fact:")
                                            .font(.system(size: 17, weight: .medium))
                                        Spacer()
                                    }
                                    
                                    Text("The Taj Mahal exhibits a captivating play of colors throughout the day, appearing pink in the morning, dazzling white under the midday sun, and radiating a soft golden hue by the light of the moon.")
                                       // .padding(3)
                                }
                            }
                            .padding()
                    }
                    .padding()
                    Spacer()
                   // Spacer()
            }
        }
    }
}


struct PyramidView : View{
    
    var body : some View{
        VStack{
            LocationView()
                .frame(height: 200)
            
            CircleImage(imageName: "pClear")
                .offset(y: -100)
                .padding(.bottom, -110)
            
            VStack(alignment: .leading) {
                ScrollView(){
                    Text("The Great Pyramid of Giza")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("Al Haram, Egypt")
                        Spacer()
                        ARButton()
                    }
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    VStack(spacing: 15){
                        Text("About the Pyramid of Giza")
                            .font(.title2)
                            .fontWeight(.light)
                        
                        VStack{
                            HStack{
                                Text("Time Period:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("The Pyramids of Egypt, including the iconic Great Pyramid of Giza, were constructed during the third millennium BCE.")
                              //  .padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Geographical Impact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("Situated in Egypt, these pyramids served as monumental tombs for pharaohs, showcasing intricate engineering and architectural skills.")
                               // .padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Fun Fact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("Initially, the Great Pyramid of Giza had a smooth, reflective surface made of white Tura limestone casing stones, contrary to the common perception. Over time, most of these casing stones were removed, exposing the stepped core structure visible today.")
                               // .padding(3)
                        }
                        
                    }
                    .padding()
                   
                }
                .padding()
                Spacer()
               // Spacer()
            }
        }
    }
}


struct EiffelTowerView : View{
    
    var body: some View{
        VStack{
            LocationView()
                .frame(height: 200)
            
            CircleImage(imageName: "etClear")
                .offset(y: -100)
                .padding(.bottom, -110)
            
            VStack(alignment: .leading) {
                ScrollView{
                    Text("Eiffel Tower")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("Paris, France")
                        Spacer()
                        ARButton()
                    }
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    VStack(spacing: 15){
                        Text("About Eiffel Tower")
                            .font(.title2)
                            .fontWeight(.light)
            
                        VStack{
                            HStack{
                                Text("Time Period:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("The Eiffel Tower, an iconic symbol of Paris, was completed in 1889 for the 1889 World's Fair, commemorating the 100th anniversary of the French Revolution.")
                                //.padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Geographical Impact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("Designed by Gustave Eiffel, the tower stands as a remarkable entrance arch and has evolved into a global cultural icon, contributing significantly to the identity of Paris.")
                               // .padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Fun Fact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("The Eiffel Tower experiences height variations due to temperature changes; during cold weather, its iron structure contracts, making it slightly shorter, while in hotter temperatures, expansion causes the tower to grow, with fluctuations of up to 15 centimeters (about 6 inches).")
                               // .padding(3)
                        }
                    }
                    .padding()
                }
                .padding()
                Spacer()
                Spacer()
            }
        }
    }
}
      


struct ColosseumView : View{
    
    var body: some View{
        VStack{
            LocationView()
                .frame(height: 200)
            
            CircleImage(imageName: "colosseum")
                .offset(y: -100)
                .padding(.bottom, -110)
            
            VStack(alignment: .leading) {
                ScrollView{
                    Text("Colosseum")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Text("Rome, Italy")
                        Spacer()
                        ARButton()
                    }
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    VStack(spacing: 15){
                        Text("About Colosseum")
                            .font(.title2)
                            .fontWeight(.light)
                        
                        VStack{
                            HStack{
                                Text("Time Period:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("Completed in AD 80, the Colosseum, also called the Flavian Amphitheatre, stands as an ancient Roman marvel located in the heart of Rome, Italy.")
                               // .padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Geographical Impact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("Situated in Rome, Italy, the Colosseum served as an iconic venue with a seating capacity of up to 80,000 spectators, hosting gladiatorial contests, animal hunts, and executions.")
                               // .padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Fun Fact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("The Colosseum featured an innovative retractable awning, the 'velarium', designed to provide shade for the audience during hot Roman days. This engineering marvel utilized a complex system of ropes, pulleys, and wooden beams to enhance spectator comfort.")
                               // .padding(3)
                        }
                        
                    }
                    .padding()
                    
                }
                .padding()
                Spacer()
            }
        }
    }
}



struct IceAgeView : View{
    
    var body: some View{
        VStack{
            LocationView()
                .frame(height: 200)
            
            CircleImage(imageName: "iceAgeImage")
                .offset(y: -100)
                .padding(.bottom, -110)
            
            VStack(alignment: .leading) {
                ScrollView{
                    Text("Ice Age")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Text("Rome, Italy")
                        Spacer()
                        ARButton()
                    }
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    VStack(spacing: 15){
                        Text("About Ice Age")
                            .font(.title2)
                            .fontWeight(.light)
                        
                        VStack{
                            HStack{
                                Text("Time Period:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("The Ice Age (Pleistocene Epoch) lasted from about 2.6 million years ago to around 11,700 years ago.")
                                //.padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Geographical Impact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("Large ice sheets, some over a mile thick, covered significant parts of North America, Europe, and Asia during the last Ice Age.")
                                //.padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Fun Fact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("The extensive ice coverage dramatically altered Earth's geography, shaping landscapes and influencing species evolution.")
                                //.padding(3)
                        }
                        
                    }
                    .padding()
                }
                .padding()
                Spacer()
            }
        }
    }
}


struct JurassicView : View{
    
    var body: some View{
        VStack{
            LocationView()
                .frame(height: 200)
            
            CircleImage(imageName: "jClear")
                .offset(y: -100)
                .padding(.bottom, -110)
            
            VStack(alignment: .leading) {
                ScrollView{
                    Text("Jurrasic Period")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Text("Rome, Italy")
                        Spacer()
                        ARButton()
                    }
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    VStack(spacing: 15){
                        Text("About Jurrasic Period")
                            .font(.title2)
                            .fontWeight(.light)
                        
                        VStack{
                            HStack{
                                Text("Time Period:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("The Jurassic Period lasted from approximately 201 to 145 million years ago, during the Mesozoic Era.")
                                //.padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Geographical Impact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("During the Jurassic Period, the Earth's landmasses were still connected in the supercontinent Pangaea, although it started to break apart. The climate was generally warm, and vast shallow seas covered some areas.")
                                //.padding(3)
                        }
                        
                        VStack{
                            HStack{
                                Text("Fun Fact:")
                                    .font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                            
                            Text("Dinosaurs like the iconic Stegosaurus and Apatosaurus roamed the Earth during the Jurassic Period. Additionally, this period witnessed the evolution of early mammals and the appearance of the first birds, like the Archaeopteryx, which had features of both dinosaurs and birds.")
                                //.padding(3)
                        }
                    }
                    .padding()
                }
                .padding()
                Spacer()
            }
        }
    }
}

