//
//  MainView.swift
//  Shrill
//
//  Created by Marcelo de Araújo on 29/11/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var config: Config
       var body: some View {
           TabView {
               Group {
                   StartedView()
                     .tabItem {
                       Label("Landing page", systemImage: "house")
                     }
                     .tag(1)

                  CalendarView()
                     .tabItem {
                       Label("Progress", systemImage: "calendar")
                     }
                     .tag(2)
                   
                   SettingsView()
                     .tabItem {
                       Label("Settings", systemImage: "gear")
                     }
                     .navigationTitle("Settings")
                     .tag(3)
                   
               }
               .toolbar(.visible, for: .tabBar)
               .toolbarBackground(.black, for: .tabBar)
               .toolbarColorScheme(.dark, for: .tabBar)

           }
           .environmentObject(config)
       }
}

#Preview {
    MainView()
}
