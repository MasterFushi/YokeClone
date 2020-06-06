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
    
    var body: some View {
        ZStack(alignment: .top) {
        Image("GenericImage")
                .resizable().aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 250).clipShape(RoundedRectangle(cornerRadius: 20))
            VStack() {
                Text(self.name).foregroundColor(.white).font(.system(size: 16, weight: .bold)).padding(.top, 5)
                Spacer()
            }
        }.frame(width: 150, height: 35)
    }
}

struct FeaturedStars_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedStars(name: "Chiozza")
    }
}
