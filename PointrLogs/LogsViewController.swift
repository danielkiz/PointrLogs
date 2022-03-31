//
//  LogsViewController.swift
//  PointrLogs
//
//  Created by Daniel on 3/31/22.
//

import UIKit

class LogsViewController: UIViewController {
    
    @IBOutlet weak var logsView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Action responsible for creating application logs
    @IBAction func generateLogsButton(_ sender: Any) {
    }
    
    /// Displaying our logs data in the UITextView
    @IBAction func showLogsButton(_ sender: Any) {
    }
    
    /// Action responsible for clearing all the logs history
    @IBAction func clearLogsButton(_ sender: Any) {
    }
}
