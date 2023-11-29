//
//  ShrillApp.swift
//  Shrill
//
//  Created by Marcelo de Araújo on 29/11/2023.
//

import SwiftUI

@main
struct ShrillApp: App {
    var body: some Scene {
        let config = Config(challangeStarted: false, startingCount: 0, increment: 0, lenght: 0, exercisesDone: 0, dailyProgress: 0, exercisesToday: 0, lastUpdateDate: Date.now, completedDays: Set<Int>())
        WindowGroup {
            if config.challangeStarted {
                MainView()
                    .environmentObject(config)
            } else {
                ContentView(challangeLenght: "")
                    .environmentObject(config)
            }
        }
    }
}
