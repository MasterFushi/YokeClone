//
//  StarProfile.swift
//  Project2
//
//  Created by Nevin Gregory on 5/29/20.
//  Copyright © 2020 Nevin Gregory. All rights reserved.
//

import SwiftUI

struct StarProfile: View {
    /*init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }*/
    
    var name: String
    
    @Binding var showingDetail: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack (){
                    Image("GenericImage")
                    VStack() {
                        HStack() {
                            Button(action: {
                                self.showingDetail.toggle()
                            }) {
                                Image(systemName: "xmark").foregroundColor(.white)
                                }.font(.headline).padding()
                            Spacer()
                            Text(self.name).font(Font.custom("BebasNeue-Regular", size: 28)).foregroundColor(.white).frame(width: 20,alignment: .center).multilineTextAlignment(.center)
                            Spacer()
                            Image(systemName: "square.and.arrow.up").foregroundColor(.white).font(.headline)
                            Image(systemName: "star").foregroundColor(.white).font(.headline).padding(5)
                        }
                        Spacer()
                        HStack (alignment: .bottom){
                            Button(action: {
                                
                            }) {
                                Text("JOIN NOW")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .regular, design: .default))
                                    .padding()
                            }.buttonStyle(PlainButtonStyle()).frame(width:175, height: 38).background(Color.orange).cornerRadius(50)
                        }.padding()
                    }.frame(width: geo.size.width, height: geo.size.height)
                }
            }
    }
}
