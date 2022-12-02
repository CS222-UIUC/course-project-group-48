//
//  SignUpPage.swift
//  BeFake
//
//  Created by Madhav Parthasarathy on 12/1/22.
//


//update user needs to be one button - new username/password
//delete user
//leave group - username and groupname
//join group
//delete group - don't implement for now
//create group

import SwiftUI

func createClick() {
    
}

struct SignUpView: View {
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
            Text("New User")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.all,20.0)
            TextField("Username", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: { createClick() }){ Text( "Sign up").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
            
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
