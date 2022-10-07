//
//  ContentView.swift
//  BeFake
//
//  Created by Madhav Parthasarathy on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Image(systemName: "camera")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("BeFake")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.all,20.0)
                .border(Color.yellow,width: 2)
            AngularGradient(gradient: Gradient(colors:[Color.red,Color.blue]),center:.center)
            TextField("Username", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
