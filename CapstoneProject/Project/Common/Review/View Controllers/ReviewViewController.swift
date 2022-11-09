//
//  FAQViewController.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-04-20.
//

import UIKit

class ReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var reviews : [Review] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell (withIdentifier:
            "myCell", for: indexPath) as? ReviewTableViewCell ??
                                          ReviewTableViewCell(style: .default,
                                                                        reuseIdentifier:"myCell")
        cell.backgroundColor = .clear
        
        let row = indexPath.row
        
        
        cell.lblReview.text = reviews[row].message
        cell.lblHeading.text = reviews[row].heading
        cell.lblRaiting.text = "\(reviews[row].rating ?? 0)"
        
        return cell
        
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate.readDataFromDatabase()
        
        reviews = mainDelegate.reviews
        
        print("Reviews Count \(reviews.count)")
        
        
        // Do any additional setup after loading the view.
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
