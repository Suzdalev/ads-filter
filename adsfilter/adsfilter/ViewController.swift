//
//  ViewController.swift
//  adsfilter
//
//  Created by Igor Suzdalev on 26.07.17.
//  Copyright © 2017 Igor Suzdalev. All rights reserved.
//

import Cocoa
import Alamofire


class ViewController: NSViewController {

    @IBOutlet weak var textSourceLinks: NSTextFieldCell!
   
    @IBOutlet weak var textFilteredLinks: NSTextField!
    
    @IBOutlet weak var proceedCount: NSTextField!
    @IBOutlet weak var srtStatus: NSTextField!
    @IBAction func btnMagic(_ sender: Any) {
        
        //btn code
        self.srtStatus.stringValue = "in process..."
        //print(textSourceLinks)
        var temp = textSourceLinks.stringValue
        
        print(temp)
      
        
        
        
        let urlArray = temp.components(separatedBy: "\n")
        
        print(urlArray)
        
        let totalURLS = urlArray.count
        var currentURL = 0
        
        
        for url  in urlArray {
            Alamofire.request("https://" + url + "/ads.txt").response { response in
                
                if response.response?.statusCode == 404
                {
                    self.textFilteredLinks.stringValue += "\(url) \n"
                }
                
                currentURL+=1
                self.proceedCount.stringValue = "\(currentURL)/\(totalURLS)"
                
            }
            
        self.srtStatus.stringValue = "Done!"
            
        }
        
        
 //       let strURL = textSourceLinks.stringValue
 //       Alamofire.request("https://" + strURL + "/ads.txt").response { response in
 //           print("Request: \(response.request)")
 //           print("Response: \(response.response)")
 //           print("Error: \(response.error)")
            
  //              self.textFilteredLinks.stringValue = "\(response.response?.statusCode) \n"
  //              self.textFilteredLinks.updateLayer()
            
  //      }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

