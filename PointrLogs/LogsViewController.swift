//
//  LogsViewController.swift
//  PointrLogs
//
//  Created by Daniel on 3/31/22.
//

import UIKit

class LogsViewController: UIViewController {
    
    /// Variable responsible for the connection with the Logging class
    var logger = Logging()
    
    /// The IBOutlets of the UIView and the UITextView which we see when tap to open logs
    @IBOutlet weak var logsView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    /// Action responsible for creating the template application logs
    @IBAction func generateLogsButton(_ sender: Any) {
        /// Templates for the log generating
        let templateLogs = ["App successfully started", "Establishing connection with the server", "Successful", "The app crashed because of the bug", "Please restart the app", "Error 404", "Something went wrong"]
        
        /// Adding the time when the log was created
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm:ss"
        let dateString = formatter.string(from: Date())
        
        /// Writing the randomly generated template log with the time of creation
        logger.write(singleLog: "\(dateString) - \(templateLogs.randomElement()!)")
    }
    
    /// Displaying our logs in the UITextView
    @IBAction func showLogsButton(_ sender: Any) {
        
        /// Making the logs UIView visible, set invisible by standard
        logsView.isHidden = false
        
        /// Checking if there are any logs, if not we show the message that there are no logs
        if logger.print().count != 0 {
            /// Displaying the logs, each log starting from the new line
            textView.text = logger.print().joined(separator: "\n")
        } else {
            textView.text = "No logs recorded"
        }
    }
    
    /// Action responsible for clearing all the logs history
    @IBAction func clearLogsButton(_ sender: Any) {
        /// Hiding the UIView to make the main UIView visible
        logsView.isHidden = true
        logger.clear()
    }
}
