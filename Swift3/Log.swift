//
//  Log.swift
//  Swift 3.1
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017 yangjehpark. All rights reserved.
//

import Foundation

/// Basic log
func log(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
    if (Log.logEnabled()) {
        print("\(Log.time())✅(\(Log.fileName(file)):\(line))📝\(message)")
    }
}

/// Log class
struct Log {
    
    /// show or ignore
    fileprivate static func logEnabled() -> Bool {
        #if !RELEASE
            return true
        #else
            return false
        #endif
    }
    
    /// debug
    public static func d(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.logEnabled()) {
            print("\(Log.time())🔬(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// info
    public static func i(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.logEnabled()) {
            print("\(Log.time())ℹ️(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// warning
    public static func w(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.logEnabled()) {
            print("\(Log.time())⚠️(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// error
    public static func e(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.logEnabled()) {
            print("\(Log.time())⛔️(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// Time stamp for Log
    fileprivate static func time() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SSSS"
        return "🕒"+dateFormatter.string(from: Date())
    }
    
    /// Simplified file name
    fileprivate static func fileName(_ file: String) -> String {
        return (file as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    }
    
    // More emoticons list is here 👉 http://www.grumdrig.com/emoji-list/
}
