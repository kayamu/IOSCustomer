//
//  SummaryViewController.swift
//  HealthyMealFinance
//
//  Zawad Hossain
// the view controller managing the information of the subscription a summary page from there
//when user clicks the button takes them for payment, here it is just an animation screen

import UIKit
import WebKit


class SummaryViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var lblGeneralTotal: UILabel!
    @IBOutlet weak var lblTaxes: UILabel!
    @IBOutlet weak var lblServiceFee: UILabel!
    @IBOutlet weak var lblDeliveryFee: UILabel!
    @IBOutlet weak var lblPromotion: UILabel!
    @IBOutlet weak var lblSubtotal: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    
    
    @IBAction func btnPaymentAction(_ sender: Any) {
        
        let message : String = "Your subscription was successful"
        
        
        let alert = UIAlertController(title: "Thank you", message: message , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated:true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let subTotal = 237.28
        let taxes = ((subTotal / 1.13)*100).rounded()/100
        let serviceFee = 20.00*6
        let promotionFee = -10.00*6
        let deliveryFee = 9.25*6
        let generalTotal = ((subTotal+taxes+serviceFee+promotionFee+deliveryFee)*100).rounded()/100
        
        
        lblSubtotal.text = String(subTotal)+"$"
        lblTaxes.text = String(taxes)+"$"
        lblServiceFee.text = String(serviceFee)+"$"
        lblPromotion.text = String(promotionFee)+"$"
        lblDeliveryFee.text = String(deliveryFee)+"$"
        lblGeneralTotal.text = String(generalTotal)+"$"
        
        
        let urlAddress = URL(string: "https://www.healthline.com/nutrition/healthy-eating-tips")
        let url = URLRequest(url : urlAddress!)
        
        webView.load(url)
        webView.navigationDelegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnEmailUsAction(_ sender: Any) {
        
        
    }
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue){
        
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
