//
//  GroupsPage.swift
//  BeFake
//
//  Created by Anagha Balaji on 10/20/22.
//

import SwiftUI


struct AddGroup : View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var group: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { whenClick() }){ Text( "Add Group").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
        }
            .padding()
    }
}

struct CreateGroup : View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var group: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { whenClick() }){ Text( "Create Group").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
        }
            .padding()
    }
}

struct LeaveGroup : View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var group: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { whenClick() }){ Text( "Leave Group").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
        }
            .padding()
    }
}


struct MyGroups: View {
    var body: some View {
        return Text("My Groups")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct Group1: View {
    var body: some View {
        return Text("Group1")
            .fontWeight(.semibold)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}
struct Group2: View {
    var body: some View {
        return Text("Group2")
            .fontWeight(.semibold)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}

struct Group3: View {
    var body: some View {
        return Text("Group3")
            .fontWeight(.semibold)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
    }
}


//struct ExitGroup : View {
//    var body: some View {
//
//        VStack {
//        //[…]
//            Text("Exit Group")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .frame(width: 150, height: 20)
//                .background(Color.green)
//                .cornerRadius(15.0)
//        }
//            .padding()
//    }
//}

//struct ReportMember : View {
//    var body: some View {
//
//        VStack {
//        //[…]
//            Text("Report Member")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .frame(width: 150, height: 20)
//                .background(Color.green)
//                .cornerRadius(15.0)
//        }
//            .padding()
//    }
//}


func whenClick() {
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

struct ExitGroup : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
        //[…]
            Button(action: { whenClick() }){ Text( "Exit Group").padding().font(.headline).fontWeight(.semibold).foregroundColor(.white).background(Color.green).cornerRadius((15.0))}
        }
            .padding()
    }
}

//struct ReportMember : View {
//
//    @State var username: String = ""
//    @State var password: String = ""
//
//    var body: some View {
//
//        VStack {
//        //[…]
//            Button(action: { whenClick() }){ Text( "Report Member").padding().font(.largeTitle).fontWeight(.semibold).foregroundColor(.black)}
//        }
//            .padding()
//    }
//}

struct GroupsPage: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var group: String = ""
    var body: some View {
        VStack {
            MyGroups()
            Image(systemName: "photo")
                .frame(width:50, height: 50)
                .foregroundColor(.accentColor)

            TextField("Username: ", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Group: ", text: $group)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            AddGroup()
            LeaveGroup()
            TextField("New Group: ", text: $group)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            CreateGroup()
            Group1()
            ExitGroup()
            Group2()
            ExitGroup()
            Group3()
            ExitGroup()
            
            //ReportMember()
        }
        .padding()
    }
}



struct GroupsView_Previews: PreviewProvider {
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

struct Previews_GroupsPage_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
