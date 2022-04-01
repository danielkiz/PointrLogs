//
//  Logging.swift
//  PointrLogs
//
//  Created by Daniel on 3/31/22.
//

import Foundation

class Logging {
    
    /// Variable responsible for handling the logs
    var logs: [String] = []
    
    /// Function for writing data to our "logs" variable
    func write(singleLog: String) {
        let _logs: [String] = {
            if logs.count == 0 {
                return [singleLog]
            } else {
                logs.append(singleLog)
                return logs
            }
        }()
        logs = _logs
    }
    
    /// Responsible for printing out the logs
    func print() -> [String] {
        return logs.reversed()
    }
    
    /// Function which deletes all the logs
    func clear() {
        logs.removeAll()
    }
    
}
