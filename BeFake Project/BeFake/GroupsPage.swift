//
//  GroupsPage.swift
//  BeFake
//
//  Created by Anagha Balaji on 10/20/22.
//

import SwiftUI



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


struct ExitGroup : View {
    var body: some View {

        VStack {
        //[…]
            Text("Exit Group")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 20)
                .background(Color.green)
                .cornerRadius(15.0)
        }
            .padding()
    }
}

struct ReportMember : View {
    var body: some View {

        VStack {
        //[…]
            Text("Report Member")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 20)
                .background(Color.green)
                .cornerRadius(15.0)
        }
            .padding()
    }
}


struct GroupsPage: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            MyGroups()
            Image(systemName: "photo")
                .frame(width:50, height: 50)
                .foregroundColor(.accentColor)
            Group1()
            ExitGroup()
            Group2()
            ExitGroup()
            Group3()
            ExitGroup()
            
            ReportMember()
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

                    GroupsPage()
                        .tabItem {
                            Label("Feed", systemImage: "camera")
                        }
                    GroupsPage()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                    GroupsPage()
                        .tabItem {
                            Label("Profile", systemImage: "gear")
                        }
        }
    }
}
