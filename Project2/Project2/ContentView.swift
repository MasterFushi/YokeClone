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
        UINavigationBar.appearance().backgroundColor = .systemBlue
    }
    
    @State var jsonData = [StarData]()
    @State var isLoaded = 0;
    
    var body: some View {
        NavigationView() {
            if(isLoaded >= 0) {
            ZStack(alignment: .top) {
                
                ScrollView() {
                        Text("LIVE NOW")
                        ScrollView([.horizontal, .vertical]) {
                            HStack() {
                                ForEach(jsonData, id:
                                \.name) { i in
                                    //if(i.isOnline) {
                                        LiveStars(name: i.name)
                                    //}
                                }
                            }
                        }
                        Text("TRENDING")
                        ScrollView([.horizontal, .vertical]) {
                            HStack() {
                                ForEach(jsonData, id:
                                \.name) { i in
                                    //if(!i.isOnline) {
                                        FeaturedStars(name: i.name)
                                    //}
                                }
                            }
                        }
                }
                Button(action: {
                    self.parse()
                    print("pressed")
                }) {
                    Text("Press To Load")
                }
            }
            
            .navigationBarTitle("YOKE")
            }
            
        }
    }
    
    func addStar(star: StarData) {
        jsonData.append(star)
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
                                print(newStar)
                                self.isLoaded += 1
                                self.addStar(star: newStar)
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
