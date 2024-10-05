import SwiftUI

struct ModelPickerView: View {
    
    // MARK: - Properties

    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    
    var models: [Model]
    
    // MARK: Body
    
    var body: some View {
        //geometry reader is the new one for the changes: and scrollview is inside it:
        
        VStack(){
        
            GeometryReader{ //
                let size = $0.size //
                let padding = (size.width - 70) / 2
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(models, id: \.self) { model in
                            Button {
                                print("Picked model: \(model.modelName)")
                                selectedModel = model
                                isPlacementEnabled = true
                            } label: {
                                Image(uiImage: model.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 45)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                                    .padding(.all, 10)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, padding)
                    
                }
                .scrollIndicators(.hidden)
                .frame(height: 45) ///
                
            }
            .frame(height: 45) //
            Text("      ") //temporary spacing method, not efficient
        }
    }
}


