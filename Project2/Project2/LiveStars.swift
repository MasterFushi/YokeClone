//
//  LiveStars.swift
//  Project2
//
//  Created by Nevin Gregory on 6/3/20.
//  Copyright © 2020 Nevin Gregory. All rights reserved.
//

import SwiftUI

struct LiveStars: View {
    var name : String
    
    @State var showingDetail = false;
    
    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
        }) {
            ZStack(alignment: .top) {
                Image("GenericImage").renderingMode(.original)
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 250).clipShape(RoundedRectangle(cornerRadius: 20))
                VStack() {
                    HStack() {
                        Spacer()
                        Text(name).foregroundColor(.white).font(.system(size: 16, weight: .bold)).padding(.trailing)
                        Image(systemName: "bolt.circle.fill").foregroundColor(.orange).padding(.trailing, 7)
                    }.padding(.top, 5)
                    Spacer()
                    Button(action: {}) {
                        Text("Fortnite").foregroundColor(.white)
                        }.padding().frame(width:125, height: 35).background(Color.orange).cornerRadius(40).padding()
                }
            }.frame(width: 150, height: 35)
        }.sheet(isPresented: $showingDetail) {
            StarProfile(name: self.name)
        }
    }
}

struct LiveStars_Previews: PreviewProvider {
    static var previews: some View {
        LiveStars(name: "Chiozza")
    }
}
