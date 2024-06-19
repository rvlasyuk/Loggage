//
//  DateExtension.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 11/10/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import Foundation

fileprivate let dateFormatter: DateFormatter = DateFormatter()

extension Date {
    func toString() -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd, HH:mm:ss.SSS"
        dateFormatter.timeZone = Loggage.usesLocalTimeZone ? TimeZone.current : TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: self)
    }
}
