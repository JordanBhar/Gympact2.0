//
//  WeekView.swift
//  Gympact2.0
//
//  Created by Jordan Bhar on 2023-06-26.
//

import SwiftUI

struct WeekView: View {
    let calendar = Calendar.current
    let currentDate = Date()
    
    @State private var selectedWeekStartDate = Date()
    @GestureState private var translation: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(monthYearText(selectedWeekStartDate))
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<7) { dayIndex in
                        if let day = calendar.date(byAdding: .day, value: dayIndex, to: selectedWeekStartDate) {
                            VStack {
                                Text(dayOfWeek(day))
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("\(dayNumber(day))")
                                    .font(.title)
                                    .foregroundColor(.primary)
                            }
                            .background(isCurrentDay(date: day) ? .red : .white)
                        }
                    }
                }
                .padding()
                .gesture(swipeGesture())
                .animation(.easeOut)
            }
        }
    }
    
    func swipeGesture() -> some Gesture {
        return DragGesture()
            .updating($translation) { value, state, _ in
                state = value.translation.width
            }
            .onEnded { value in
                if value.translation.width < 0 {
                    navigateToNextWeek()
                } else if value.translation.width > 0 {
                    navigateToPreviousWeek()
                }
            }
    }
    
    func navigateToPreviousWeek() {
        if let previousWeek = calendar.date(byAdding: .weekOfYear, value: -1, to: selectedWeekStartDate) {
            selectedWeekStartDate = previousWeek
        }
    }
    
    func navigateToNextWeek() {
        if let nextWeek = calendar.date(byAdding: .weekOfYear, value: 1, to: selectedWeekStartDate) {
            selectedWeekStartDate = nextWeek
        }
    }
    
    func monthYearText(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func dayOfWeek(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
    
    func isCurrentDay(date: Date) -> Bool {
        return calendar.isDate(date, inSameDayAs: currentDate)
    }
    
    func dayNumber(_ date: Date) -> Int {
        let dayNumber = calendar.component(.day, from: date)
        return dayNumber
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}

