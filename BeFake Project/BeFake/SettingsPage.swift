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

struct CurrentPasswordPage: View {
    var body: some View {
        return Text("Password: password01")
            .fontWeight(.semibold)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}

struct CurrentNamePage: View {
    var body: some View {
        return Text("Name: Anagha")
            .fontWeight(.semibold)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}

struct ChangePFPPage: View {
    var body: some View {
        return Text("Change Profile Image")
            .fontWeight(.semibold)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}

struct SettingsPage_Previews: PreviewProvider {
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


//struct ChangeUsername : View {
//
//    @State var username: String = ""
//    @State var password: String = ""
//
//    var body: some View {
//
//        VStack {
//        //[…]
//            Text("Change Username")
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

struct UploadPhoto : View {

    @State var username: String = ""
    @State var password: String = ""

    var body: some View {

        VStack {
        //[…]
            Text("Upload New Image")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
        }
            .padding()
    }
}

//struct ChangePassword : View {
//
//    @State var username: String = ""
//    @State var password: String = ""
//
//    var body: some View {
//
//        VStack {
//        //[…]
//            Text("Change Password")
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


func Click() {
    let session = URLSession.shared
            let url = "http://127.0.0.1:1323/v1/adduser"
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            var params :[String: Any]?
            params = ["username" : "kale-c", "password" : "gang"]
            do{
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions())
                let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                    if let response = response {
                        let nsHTTPResponse = response as! HTTPURLResponse
                        let statusCode = nsHTTPResponse.statusCode
                        print ("status code = \(statusCode)")
                    }
                    if let error = error {
                        print ("\(error)")
                    }
//                    if let data = data {
//                        do{
//                            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
//                            print ("data = \(jsonResponse)")
//                        }catch _ {
//                            print ("OOps not good JSON formatted response")
//                        }
//                    }
                })
                task.resume()
            }catch _ {
                print ("Oops something happened buddy")
            }
}

struct ChangeUsername : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { Click() }){ Text( "Change Username").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
            .padding()
    }
}

struct ChangePassword : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { Click() }){ Text( "Change Password").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
            .padding()
    }
}


struct UpdatePassUserView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            //SettingsPage()
            CurrentNamePage()
            TextField("Change Name", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            CurrentUserNamePage()
            //ChangeUsername()
            TextField("Change Username", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            CurrentPasswordPage()
            SecureField("Change Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            ChangePassword()
            ChangePFPPage()
            Image(systemName: "photo")
                .frame(width:50, height: 50)
                .foregroundColor(.accentColor)
            //UploadPhoto()
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
//        SettingsPage()
//    }
//}
