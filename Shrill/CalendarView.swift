//
//  CalendarView.swift
//  Shrill
//
//  Created by Marcelo de Araújo on 29/11/2023.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var config: Config
    @StateObject var calendarViewModel = CalendarViewModel()

    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 8)
    var body: some View {
        @State var rowLenght:Int = config.lenght 
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 3) {
                    ForEach(0..<rowLenght) { i in
                        let day = i + 1
                        let state = calendarViewModel.dayStates[day] ?? determineStateForDay(day)
                        CalendarDayView(count: day, state: state)
                            .padding(3)
                    }
                }
                .id(UUID().uuidString)
                .frame(width: UIScreen.main.bounds.width * 0.9)
                .navigationTitle(Text("Your progress"))
            }
        }
    }
    
    func determineStateForDay(_ day: Int) -> DayState {
        if config.completedDays.contains(day) {
            return .success
        } else if !(config.completedDays.contains(day)) && !(day >= config.dailyProgress) {
            return .failed
        } else if day == config.dailyProgress {
            return .current
        } 
        return .upcoming
    }
}

#Preview {
    CalendarView()
}
