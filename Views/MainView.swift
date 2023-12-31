//
//  ContentView.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            // Signed in
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
