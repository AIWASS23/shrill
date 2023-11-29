//
//  CalendarViewModel.swift
//  Shrill
//
//  Created by Marcelo de Araújo on 29/11/2023.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var dayStates: [Int: DayState] = [:]
}
