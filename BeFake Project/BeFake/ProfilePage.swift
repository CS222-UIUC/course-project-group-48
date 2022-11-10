import SwiftUI

struct ProfileView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Image(systemName: "camera")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Profile")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.all,20.0)
                .border(Color.yellow,width: 2)
            Text("")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.top,20.0)
            Text("")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.top,20.0)
            Image(systemName: "circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Madhav Parthasarathy")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.top,20.0)
            Text("@theparthasaurus")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.all,20.0)
            Text("Feed")
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(Font.title)
                .padding(.all,20.0)
            LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3)]) {
                ForEach(1..<10) { ix in
                    Image(systemName: "camera")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .padding(.bottom)
                }
            }
        }
        .padding()
    }
}


struct Content2View_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
                ProfileView()
                    .tabItem {
                        Label("Groups", systemImage: "message")
                    }

                ProfileView()
                    .tabItem {
                        Label("Feed", systemImage: "camera")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "gear")
                    }
        }
    }
}
