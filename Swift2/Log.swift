//
//  Log.swift
//  Swift 2.3
//
//  Created by yangjehpark on 2017. 1. 18..
//  Copyright © 2017 yangjehpark. All rights reserved.
//

import Foundation

/// Basic log
func log(message: String, file: String = #file, line: Int = #line, function: String = #function) {
    if (Log.enable()) {
        print("\(Log.time())✅(\(Log.fileName(file)):\(line))📝\(message)")
    }
}

/// Log class
struct Log {
    
    private static func enable() -> Bool {
        #if !RELEASE
            return true
        #else
            return false
        #endif
    }
    
    /// debug
    static func d(message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.enable()) {
            print("\(Log.time())🔬(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// info
    static func i(message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.enable()) {
            print("\(Log.time())ℹ️(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// warning
    static func w(message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.enable()) {
            print("\(Log.time())⚠️(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// error.
    static func e(message: String, file: String = #file, line: Int = #line, function: String = #function) {
        if (Log.enable()) {
            print("\(Log.time())⛔️(\(Log.fileName(file)):\(line))📝\(message)")
        }
    }
    
    /// Time stamp for Log
    private static func time() -> String {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SSSS"
        return "🕒"+dateFormatter.stringFromDate(NSDate())
    }
    
    /// Simplified file name
    private static func fileName(file: String) -> String {
        return (file as NSString).lastPathComponent.stringByReplacingOccurrencesOfString(".swift", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
    }

    // More emoticons list is here 👉 http://www.grumdrig.com/emoji-list/
}