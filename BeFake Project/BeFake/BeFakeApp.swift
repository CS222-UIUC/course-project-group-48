//
//  BeFakeApp.swift
//  BeFake
//
//  Created by Madhav Parthasarathy on 10/6/22.
//

import SwiftUI

@main


struct BeFakeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            SettingsPage()
            GroupsPage()
//            ProfileView()
        }
    }
}

struct Previews_BeFakeApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
