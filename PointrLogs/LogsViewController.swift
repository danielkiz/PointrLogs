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
    /// IBOutlet of the button we use to see the logs
    @IBOutlet weak var logsButton: UIButton!
    
    /// Action responsible for creating the template application logs
    @IBAction func generateLogsButton(_ sender: Any) {
        /// Templates for the log generating
        let templateLogs = ["App successfully started", "Establishing connection with the server", "Successful", "The app crashed because of the bug", "Please restart the app", "Error 404", "Something went wrong"]
        
        /// Adding the time when the log was created
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd-MM-yyyy - HH:mm:ss"
        let dateString = formatter.string(from: Date())
        
        /// Writing the randomly generated template log with the time of creation
        logger.write(singleLog: "\(dateString)\n\(templateLogs.randomElement()!)\n")
    }
    
    /// Displaying our logs in the UITextView
    @IBAction func showLogsButton(_ sender: Any) {
        
        if logsView.isHidden == true {
            /// Making the logs UIView visible, set invisible by standard
            logsView.isHidden = false
            
            /// Changing the text of the button so the user could go back
            logsButton.setTitle("Back", for: .normal)
            
            /// Checking if there are any logs, if not we show the message that there are no logs
            if logger.print().count != 0 {
                /// Displaying the logs, each log starting from the new line
                textView.text = logger.print().joined(separator: "\n")
            } else {
                textView.text = "No logs recorded"
            }
        } else {
            logsView.isHidden = true
            /// Changing the text of the button so the user could go to see logs
            logsButton.setTitle("Logs", for: .normal)
        }
    }
    
    /// Action responsible for clearing all the logs history
    @IBAction func clearLogsButton(_ sender: Any) {
        /// Hiding the UIView to make the main UIView visible
        logsView.isHidden = true
        /// Changing the text of the button back to Logs
        logsButton.setTitle("Logs", for: .normal)
        logger.clear()
    }
}
