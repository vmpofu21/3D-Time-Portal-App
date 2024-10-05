////
////  TabView.swift
////  sampleProject
////
////  Created by Surya Sharma on 11/30/23.
////
//
//import SwiftUI
//
//struct TabView: View {
//
//    @State var selectedIndex = 0
//    @State var presented: Bool = false
//    let icons = ["house.fill", "location.fill", "camera.fill", "music.note.list"]
//
//    var body: some View {
//        ZStack{
//            Rectangle()
//                .frame(width: .infinity, height: 80)
//                .cornerRadius(20)
//                .foregroundColor(.white)
//                .shadow(radius: 5)
//
//                HStack{
//                    ForEach(0..<4, id: \.self) { number in
//                        Spacer()
//                        Button(action: {
//                            self.selectedIndex = number
//
//                        }, label: {
//                            Image(systemName: icons[number])
//                                .foregroundColor(selectedIndex == number ? Color("selectedColor") : Color("unselectedColor"))
//                                .font(.system(size: 25,
//                                              weight: .regular,
//                                              design: .default))
//
//                    })
//                    Spacer()
//                }
//            }
//        }
//    }
//}
//
//struct TabView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabView()
//    }
//}
