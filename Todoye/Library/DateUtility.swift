//
//  CommonExtensions.swift
//  Todoye
//
//  Created by Eetu Hernesniemi on 6.4.2022.
//

import Foundation
struct DateUtility {
    func currentLocalDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let date = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}
        return date
    }
    
    func currentUTC() -> Date {
        return Date()
    }
}
