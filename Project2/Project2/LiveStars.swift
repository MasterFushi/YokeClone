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
                        Text(secondWord(value: name)).font(Font.custom("BebasNeue-Regular", size: 24)).padding(.leading).foregroundColor(.white).font(.system(size: 16, weight: .bold)).padding(.trailing)
                        Image(systemName: "bolt.circle.fill").foregroundColor(.orange).padding(.trailing, 7)
                    }.padding(.top, 5)
                    Spacer()
                    Button(action: {}) {
                        Text("Fortnite").foregroundColor(.white)
                        }.padding().frame(width:125, height: 35).background(Color.orange).cornerRadius(40).padding()
                }
            }.frame(width: 150, height: 35)
        }.sheet(isPresented: $showingDetail) {
            StarProfile(name: self.name, showingDetail: self.$showingDetail)
        }
    }
}

func secondWord(value: String) -> String {
    // Find index of space.
    if let space = value.firstIndex(of: " ") {
        // Return String.
        // ... Use "after" to avoid including the space.
        //     Use String() to for Swift 4.
        return String(value[value.index(after: space)..<value.endIndex])
    }
    return ""
}


struct LiveStars_Previews: PreviewProvider {
    static var previews: some View {
        LiveStars(name: "Devin Robinson")
    }
}
