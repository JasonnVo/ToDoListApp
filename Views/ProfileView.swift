//
//  ProfileView.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import SwiftUI


struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color(red: 93 / 255, green: 130 / 255,
                                       blue: 178 / 255))
                .offset(y: -650)
            // VStack
            VStack {
                // Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.gray)
                    .frame(width: 125, height: 125)
                    .padding()
                    .offset(y: 150)
                // Info: Name, Email, Member Since
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                            .bold()
                        Text(user.name)
                    }
                    .padding()
                    HStack {
                        Text("Email: ")
                            .bold()
                        Text(user.email)
                    }
                    .padding()
                    HStack {
                        Text("Member Since: ")
                            .bold()
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    }
                    .padding()
                }
                .offset(y: 150)
                .padding()
                // Sign out
                Button("Log out") {
                    viewModel.logOut()
                }
                .offset(y: 150)
                .tint(.red)
                .padding()
                Spacer()
            }
            Text("Profile")
                .offset(x: -140)
                .offset(y: -280)
                .font(.system(size: 33))
                .bold()
                .foregroundColor(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
