//
//  ViewController.swift
//  Fortuna
//
//  Created by jeswang on 10/24/14.
//  Copyright (c) 2014 rainy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quotationTextView: UITextView!
    
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
        println("positive quotes path: \(path)")
        
        quotationTextView.editable = false
        quotationTextView.selectable = false
        
        displayRandomQuote()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayRandomQuote() {
        // quotes = randomly choose positiveQuotations or negativeQuotations
        // quote = randomly choose an element from quotes
        let delegate = UIApplication.sharedApplication().delegate as AppDelegate

        let type = arc4random_uniform(2)
        var quotes: [String]!;
        if type == 0 {
            quotes = delegate.negativeQuotes
        }
        else {
            quotes = delegate.positiveQuotes
        }
        let index = arc4random_uniform(UInt32(quotes.count))
        quotationTextView.text = quotes[Int(index)]
    }
    

}

