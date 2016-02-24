//
//  ViewController.swift
//  LocalizationSample
//
//  Created by Oleksandr Bezpalchuk on 24/02/2016.
//  Copyright © 2016 Oleksandr Bezpalchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImageView.image = UIImage(named: NSLocalizedString("FlagImageName", comment: "Name of image that will appear on main screen in flagImageView."))
    }

    @IBAction func byeTouched(sender: UIButton) {
        let locale = NSLocale.currentLocale()
        let languageCode = locale.objectForKey(NSLocaleLanguageCode)
        let languageName = locale.displayNameForKey(NSLocaleIdentifier, value: languageCode!)
        
        let localizedMessage = String.localizedStringWithFormat(NSLocalizedString("GoodbyeAlertMessage", comment: "Message for alert when user touched goodbye."), languageName!)
        
        let localizedTitle = NSLocalizedString("GoodbyeAlertTitle", comment: "Title for alert when user touched goodbye.")
        
        let alertController = UIAlertController(title: localizedTitle, message: localizedMessage, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }))
        showViewController(alertController, sender: self)
    }
}

