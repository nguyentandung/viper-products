//
//  ViewController.swift
//  ViperProducts
//
//  Created by Nguyen Tan Dung on 12/08/21.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var btnShowVCProduct: UIButton!
    @IBOutlet weak var btnCreateLCN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    func customview() {
        self.btnCreateLCN.layer.borderWidth = 1
        self.btnCreateLCN.layer.borderColor = UIColor.orange.cgColor
        
        self.btnShowVCProduct.setTitleColor(UIColor.blue, for: .normal)
        self.btnShowVCProduct.layer.borderWidth = 1
        self.btnShowVCProduct.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func actionShowProject(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        self.navigationController!.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func actionCreateLCNotifi(_ sender: Any) {
        scheduleLocalNotification()
    }
    
    func scheduleLocalNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound], completionHandler: { (success, error) in
            if success {
                print("Success")
            }else if let error = error {
                print(error.localizedDescription)
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Offer letter"
            content.body = "Onboard to Bosch on 4th.12/15/2021"
            content.sound = UNNotificationSound(named: UNNotificationSoundName("notificationChat.mp3"))
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
            })
        })
    }
    
}

