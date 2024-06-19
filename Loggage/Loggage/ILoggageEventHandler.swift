//
//  ILoggageEventHandler.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 01/10/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import Foundation

public protocol ILoggageEventHandler {
    func logging(message: String, withLogLevel logLevel: LogLevel)
}
