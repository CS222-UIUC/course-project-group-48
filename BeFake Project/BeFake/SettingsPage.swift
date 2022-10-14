//
//  SettingsPage.swift
//  BeFake
//
//  Created by Anagha Balaji on 10/13/22.
//

import SwiftUI

//struct SettingsPage : View {
//    var body: some View {
//        return Text("Welcome to BeFake!")
//            .font(.largeTitle)
//            .fontWeight(.semibold)
//            .padding(.bottom, 20)
//    }
//}
//
//struct Content: View {
//    var body: some View {
//        VStack {
//            SettingsPage()
//        }
//        .padding()
//    }
//}

//import SwiftUI
//
struct SettingsPage: View {
    var body: some View {
        return Text("Settings")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct CurrentUserNamePage: View {
    var body: some View {
        return Text("UserName: anaghab3")
            .fontWeight(.semibold)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePassUserView()
    }
}



struct UpdatePassUserView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            SettingsPage()
            CurrentUserNamePage()
            TextField("Change Username", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Change Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
        .padding()
    }
}

//
//  ContentView.swift
//  BeFake
//
//  Created by Madhav Parthasarathy on 10/6/22.
//


//
//struct Login : View {
//    var body: some View {
//        return Text("Login:")
//            .font(.largeTitle)
//            .fontWeight(.semibold)
//            .padding(.bottom, 20)
//    }
//}
//
//struct SubmitButton : View {
//
//    @State var username: String = ""
//    @State var password: String = ""
//
//    var body: some View {
//
//        VStack {
//        //[…]
//            Text("SUBMIT")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .frame(width: 220, height: 60)
//                .background(Color.green)
//                .cornerRadius(15.0)
//        }
//            .padding()
//    }
//}
//
//struct ContentView: View {
//    @State var username: String = ""
//    @State var password: String = ""
//    var body: some View {
//        VStack {
//            WelcomeText()
//            Image(systemName: "camera")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("BeFake")
//                .fontWeight(.heavy)
//                .foregroundColor(.black)
//                .font(Font.title)
//                .padding(.all,20.0)
//                .border(Color.yellow,width: 2)
//            AngularGradient(gradient: Gradient(colors:[Color.red,Color.blue]),center:.center)
//            Login()
//            TextField("Username", text: $username)
//                .padding()
//                .cornerRadius(5.0)
//                .padding(.bottom, 20)
//            SecureField("Password", text: $password)
//                .padding()
//                .cornerRadius(5.0)
//                .padding(.bottom, 20)
//            SubmitButton()
//
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}