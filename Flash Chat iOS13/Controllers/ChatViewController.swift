//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [
    Message(sender: "123@123.com", body: "Hey!"),
    Message(sender: "123@123.com", body: "Hola"),
    Message(sender: "123@123.com", body: "What's up")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self //For trigger the delegate
        title = K.appName
        navigationItem.hidesBackButton = true
        
        //Link to our MessageCell.Nib
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        
        do {
            try Auth.auth().signOut()
            //Go to the Root VC (WelcomeVC)
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError{
            print("Error signing out: %@", signOutError)
        }
    }
    
}

//Protocolo which needs to know HOW MANY CELL IT NEEDS and WHAT TO DISPLAY IN THE TableView
extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        //We can use cell.label from our MessageCell afetr "as! MessageCell"
        cell.label.text = messages[indexPath.row].body
        return cell
    }
}
