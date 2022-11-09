//
//  ContactFormViewController.swift
//  mixapp
//
//  Created by  on 2022-04-14.
//

import UIKit

//user interface for email funtionality e.g. compose email & text messages
import MessageUI

class ContactFormViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var emailT : UITextField!
    @IBOutlet weak var subjectT : UITextField!
    @IBOutlet weak var messageT : UITextField!
    
    
    @IBAction func emailButtonTapped(_ sender: Any){
        
        //call the funtion of email compose and run on the actaul device
        showMailComposer()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    //function of composing an email on a device
    func showMailComposer(){
        
        //call a method of 'cansendmail' return the boolean indicating
        //whether  the current device is able to send email.
        guard MFMailComposeViewController.canSendMail()
        else
        {
            // show alert informing the user
            print(MFMailComposeViewController.canSendMail())
            return
        }
        
        //creating a format of the email composer
        //standard interface for manage, send, edit email message.
        //set the recipient - array of string, set the email subject, set the message of email body
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["hossazaw@sheridancollege.ca",emailT?.text ?? "abc@abc.com"])
        composer.setSubject(subjectT?.text ?? "Genaral Query")
        composer.setMessageBody(messageT?.text ?? "Please contact back!", isHTML: false)
        
        //this is present the copmose created above
        present(composer, animated : true)
    }


}
//delegate object will manage the email composing by dismissing it
extension ViewController : MFMailComposeViewControllerDelegate {
    
    // result - returned when the email composing is dismiss and has case of cancel email, saved email, sent email and failed email.
    private func mailComposeController( controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        
        // if error exist
        if let _ = error{
            //dispaly the error alert
            controller.dismiss(animated: true)
            return
        }
        
        //switched statement shows the result of email compose on the console
        switch result {
        case .cancelled:
            print("Cancelled")
        case .saved:
            print("Email Saved!")
        case .sent:
            print("Email Sent!")
        case .failed:
            print("Failed to Send Email.")
       
        controller.dismiss(animated: true)

        }
    }
    
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


