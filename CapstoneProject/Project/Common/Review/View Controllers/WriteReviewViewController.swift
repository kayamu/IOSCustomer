//
//  WriteReviewViewController.swift
//  iOSProjWithDashBoard
//
//  Created by  on 2022-04-16.
//
//hellooworld
import UIKit

class WriteReviewViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var headingT : UITextField!
    @IBOutlet weak var messageT : UITextField!
    @IBOutlet weak var sgRate : UISegmentedControl!
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addReviewClicked(sender : Any){
        let review : Review = Review.init()
        var rate = 0
        rate = sgRate.selectedSegmentIndex + 1
        review.initWithData(theRow: 0, theHeading: headingT.text!, theMessage: messageT.text!, theRating: rate)
        mainDelegate.reviews.append(review)
       
       
        let returnCode : Bool = mainDelegate.insertIntoDatabase(review : review)
        print(returnCode)
        performSegue(withIdentifier: "ReviewAddToList", sender: self)
       
    }
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
