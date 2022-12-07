//
//  Feed.swift
//  BeFake
//
//  Created by Madhav Parthasarathy on 10/26/22.
//
import SwiftUI
import UIKit

struct FeedView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Image(systemName: "camera")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Feed")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.all,20.0)
                .border(Color.yellow,width: 2)
            Text("@theparthasaurus")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.all,20.0)
            ScrollView {
                ForEach(1..<10) { index in
                    LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3)]) {
                        ForEach(1..<10) { ix in
                            Image(systemName: "camera")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                                .padding(.bottom)
                        }
                    }
                }
            }
            
        }
        .padding()
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            GroupsPage()
                .tabItem {
                    Label("Groups", systemImage: "message")
                }

            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "camera")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            UpdatePassUserView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }

        
    }
}

