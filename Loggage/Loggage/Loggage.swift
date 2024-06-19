//
//  Loggage.swift
//  Loggage
//
//  Created by Thomas Kalhøj Clemensen on 24/08/2017.
//  Copyright © 2017 ThomasCle. All rights reserved.
//

import UIKit

public class Loggage: NSObject {
    
    /// Filters the handled log messages. The value of this property defines the minimum level of log messages that should be handled.
    /// 
    /// Default value is `.verbose`
    public static var minimumLogLevel: LogLevel = .verbose
    
    /// Controls whether the system uses emojis or not.
    ///
    /// Default value is `true`.
    ///
    /// **Note:** Developers who disable this are usually grumpy old men 💩
    public static var areEmojisEnabled: Bool = true {
        didSet {
            if !self.areEmojisEnabled {
                self.verbose("It looks like we met a grumpy old man! Emojis are disabled. (╯°□°）╯︵ ┻━┻ (no one said anything about ASCII-art, right?")
            }
        }
    }
    
    /// Controls whether file, function and line are printed with the log messages
    ///
    /// Default value is `false`.
    public static var isDebugInformationEnabled: Bool = false
    
    /// Control whether the system should create an empty linebreak before all log messages.
    /// 
    /// Default value is `true`
    public static var isLineBreakEnabled: Bool = true
    
    /// Controls whether the system should flash the user when a log message occurs. ⚡️
    ///
    /// See `minimumFlashLogLevel` to control which log levels.
    ///
    /// *We strongly advise you to disable this in Release builds!*
    ///
    /// Default value is `false`.
    public static var isFlashEnabled: Bool = false
    
    /// Filters the flashing of log messages. This property defines the minimum log level that should cause flashes.
    ///
    /// Default value is `.warning`
    public static var minimumFlashLevel: LogLevel = .warning
    
    /// Controls whether Loggage will perform prints in the console.
    ///
    /// This should be se to `false` when building a Release build.
    ///
    /// The default value is `true`.
    public static var isPrintingEnabled: Bool = true
    
    /// Controls whether log messages will be timestamped. Set this property to `false` to remove timestamps from log messages.
    ///
    /// Default value is `true`.
    public static var isTimestampEnabled: Bool = true
    
    /// Controls whether timestamps are printed according to the time zone of the device.
    ///
    /// Default value is `false` and will cause UTC timestamps.
    public static var usesLocalTimeZone: Bool = false
    
    /// Custom event handler, which will be invoked for all messages allowed by the `minimumLogLevel` property.
    ///
    /// This can be used to send log message to Firebase, Fabric Answers or anything you'd like!
    public static var eventHandler: ILoggageEventHandler?
    
    /// Logs a verbose message.
    public static func verbose(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        self.log(message: message, logLevel: .verbose, file: file, function: function, line: line)
    }

    /// Logs a debug message.
    public static func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        self.log(message: message, logLevel: .debug, file: file, function: function, line: line)
    }
    
    /// Logs an info message.
    public static func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        self.log(message: message, logLevel: .info, file: file, function: function, line: line)
    }
    
    /// Logs a todo message.
    public static func todo(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        self.log(message: message, logLevel: .todo, file: file, function: function, line: line)
    }
    
    /// Logs a warning message.
    public static func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        self.log(message: message, logLevel: .warning, file: file, function: function, line: line)
    }
    
    /// Logs an error message.
    public static func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        self.log(message: message, logLevel: .error, file: file, function: function, line: line)
    }
    
    //MARK: - Internals
    static func constructConsoleString(message: String, logLevel: LogLevel, file: String, function: String, line: Int) -> String {
        let timestamp: String = self.isTimestampEnabled ? " [\(Date().toString())] " : " "
        let tag: String = self.areEmojisEnabled ? logLevel.emoji() : logLevel.name().uppercased()
        let fileName: String = file.components(separatedBy: "/").last ?? "UNKNOWN_FILE"
        let debugInfo: String = self.isDebugInformationEnabled ? "\(fileName):\(line) - \(function)" : ""
        let lineBreak: String = self.isLineBreakEnabled ? "\n" : ""
        return "\(lineBreak)\(tag)\(timestamp)\(debugInfo): \(message)"
    }
    
    
    //MARK: - Privates
    private static func log(message: String, logLevel: LogLevel, file: String, function: String, line: Int) {
        if logLevel.rawValue >= self.minimumLogLevel.rawValue {
            let consoleMessage: String = self.constructConsoleString(message: message, logLevel: logLevel, file: file, function: function, line: line)
            self.eventHandler?.logging(message: consoleMessage, withLogLevel: logLevel)
            self.printToConsole(consoleMessage)
            
            if self.isFlashEnabled && logLevel.rawValue >= self.minimumFlashLevel.rawValue {
                self.flash(forLogLevel: logLevel)
            }
        }
    }
    
    private static func printToConsole(_ message: String) {
        if self.isPrintingEnabled {
            print(message)
        }
    }
    
    private static func flash(forLogLevel logLevel: LogLevel) {
        DispatchQueue.main.async {
            if let window: UIWindow = UIApplication.shared.keyWindow {
                let view: UIView = UIView(frame: window.bounds)
                view.backgroundColor = logLevel.color()
                window.addSubview(view)
                
                UIView.animate(withDuration: 0.2, animations: {
                    view.alpha = 0.0
                }, completion: { (finished: Bool) in
                    view.removeFromSuperview()
                })
            }
        }
    }
}
