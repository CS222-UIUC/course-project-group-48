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

func signClick() {
    SignUpView()
}

func onClick() {
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

struct SubmitButton : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { onClick() }){ Text( "Sign in").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
        }
            .padding()
    }
}

struct CreateUser : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { signClick() }){ Text( "Sign Up").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
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
            
            CreateUser()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


