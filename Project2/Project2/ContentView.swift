//
//  ContentView.swift
//  Project2
//
//  Created by Nevin Gregory on 5/29/20.
//  Copyright © 2020 Nevin Gregory. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0, green: 0, blue: 0.4, alpha: 1)
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    @State var offlineStars = [StarData]()
    @State var onlineStars = [StarData]()
    @State var isLoaded = 0;
    @State var buttonLoaded = false;
    
    var body: some View {
        NavigationView() {
            if(isLoaded >= 0) {
                ZStack(alignment: .top) {
                    //By putting this line right here, it reloads the data when the json var is filled
                    if !offlineStars.isEmpty || !onlineStars.isEmpty{
                        ScrollView() {
                            VStack(alignment: .leading) {
                                Text("LIVE NOW").font(Font.custom("BebasNeue-Regular", size: 33)).padding(.leading)
                            //showsIndicators: false hides the little scroll bar at the bottom
                            ScrollView(.horizontal, showsIndicators: false) {
                                    HStack() {
                                        ForEach(onlineStars, id:
                                        \.name) { i in
                                            LiveStars(name: i.name).frame(height: 250)
                                        }
                                        Spacer().frame(height: 250)
                                    }
                            }
                            
                            Text("TRENDING").font(Font.custom("BebasNeue-Regular", size: 33)).padding(.leading)
                            ScrollView(.horizontal) {
                                    HStack() {
                                        ForEach(offlineStars, id:
                                        \.name) { i in
                                            FeaturedStars(name: i.name).frame(height: 250)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Button(action: {
                        self.parse()
                        self.buttonLoaded.toggle()
                    }) {
                        Text("Press To Load")
                    //This makes the button "stick" to the bottom of the screen
                        }.frame(maxHeight: .infinity, alignment: .bottom).disabled(buttonLoaded)
                }
                .navigationBarTitle("YOKE", displayMode: .large)
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
    
    func addStar(star: StarData, isOnline: Bool) {
        if(isOnline) {
            onlineStars.append(star)
        } else {
            offlineStars.append(star)
        }
    }
    
    func parse() {
        print("HI")
        if let url = URL(string: "https://us-central1-yoke-gaming.cloudfunctions.net/testCall") {
            URLSession.shared.dataTask(with: url) {data, response, error in
                    if let data = data {
                        do{
                             let jsonResponse = try JSONSerialization.jsonObject(with:
                                                    data, options: [])
                            
                            guard let newValue = jsonResponse as? [String: Any] else {
                                print("invalid format")
                                return
                            }
                            //print(newValue)
                            guard let sData = newValue["stars"] as? [[String: Any]] else {
                                print("oops")
                                return
                            }
                            for content in sData {
                                let newStar = StarData(name: content["name"] as! String, bio: content["bio"] as! String, isOnline: content["isOnline"] as! Bool)
                                //print(newStar)
                                self.isLoaded += 1
                                self.addStar(star: newStar, isOnline: newStar.isOnline)
                            }
                            
                          } catch let parsingError {
                             print("Error", parsingError)
                        }
                }
                
            }.resume()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StarData {
    var name : String
    var bio : String
    var isOnline: Bool
}
