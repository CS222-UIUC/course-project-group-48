//
//  ContentView.swift
//  BeFake
//
//  Created by Madhav Parthasarathy on 10/6/22.
//

import SwiftUI

struct WelcomeText : View {
    var body: some View {
        return Text("Welcome to BeFake!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct Login : View {
    var body: some View {
        return Text("Login:")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

func onClick() {
    print("Hello")
}

struct SubmitButton : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { onClick() }){ Text( "Submit").padding().font(.largeTitle).fontWeight(.semibold).foregroundColor(.black)}
        }
            .padding()
    }
}

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            WelcomeText()
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
            Login()
            TextField("Username", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SubmitButton()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
