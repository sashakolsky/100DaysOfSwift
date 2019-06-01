//
//  ActionViewController.swift
//  Extension
//
//  Created by Alexander on 6/4/19.
//  Copyright © 2019 Dictality. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
      super.viewDidLoad()
    
      if let inputItem = extensionContext?.inputItems.first as? NSExtensionItem {
        if let itemProvider = inputItem.attachments?.first {
          itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) { [weak self] (dict, error) in
            // do stuff
            guard let itemDictionary = dict as? NSDictionary else { return }
            guard let javascriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }
            
            print(javascriptValues)
          }
        }
      }
      
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
    }

}