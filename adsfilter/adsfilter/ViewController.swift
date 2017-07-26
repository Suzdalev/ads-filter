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

    @IBOutlet weak var textSourceLinks: NSTextField!
   
    @IBOutlet weak var textFilteredLinks: NSTextField!
    
    @IBOutlet weak var proceedCount: NSTextField!
    @IBOutlet weak var textAdsLinks: NSTextField!
    @IBOutlet weak var srtStatus: NSTextField!
    @IBAction func btnMagic(_ sender: Any) {
        
        //btn code
        self.srtStatus.stringValue = "in process..."
        //print(textSourceLinks)
        let temp = textSourceLinks.stringValue
        
        let urlArray = temp.components(separatedBy: "\n")
        
        let totalURLS = urlArray.count
        var currentURL = 0
        for url  in urlArray {

            Alamofire.request("https://" + url + "/ads.txt").responseString { response in
                //print("\n Success: \(response.result.isSuccess)")
                //print("\n Response String: \(response.result.value)")
            
                if response.result.isSuccess == true {
                    if (response.result.value?.contains(", DIRECT"))! || (response.result.value?.contains(", RESELLER"))!  {
                        self.textAdsLinks.stringValue += "\(url)\n"
                    } else {
                        self.textFilteredLinks.stringValue += "\(url)\n"
                    }
                }else {
                    self.textFilteredLinks.stringValue += "\(url)\n"
                }
            
            
                currentURL+=1
                
                self.proceedCount.stringValue = "\(currentURL)/\(totalURLS)"
                if currentURL == urlArray.count {
                    self.srtStatus.stringValue = "Done!"
                }
            }
            
        
            
        }
        
        

        
        
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

