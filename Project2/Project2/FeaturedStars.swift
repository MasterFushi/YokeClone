//
//  FeaturedStars.swift
//  Project2
//
//  Created by Nevin Gregory on 6/3/20.
//  Copyright © 2020 Nevin Gregory. All rights reserved.
//

import SwiftUI

struct FeaturedStars: View {
    var name: String
    
    @State var showingDetail = false;
    
    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
        }) {
        ZStack(alignment: .top) {
        Image("GenericImage")
                .renderingMode(.original)
                .resizable().aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 250).clipShape(RoundedRectangle(cornerRadius: 20))
            VStack() {
                Text(secondWord(value: name)).font(Font.custom("BebasNeue-Regular", size: 24)).foregroundColor(.white).font(.system(size: 16, weight: .bold)).padding(.top, 5)
                Spacer()
            }
        }.frame(width: 150, height: 35)
        }.sheet(isPresented: $showingDetail) {
            StarProfile(name: self.name, showingDetail: self.$showingDetail)
        }
    }
}



struct FeaturedStars_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedStars(name: "Devin Robinson")
    }
}
