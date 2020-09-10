//
//  ViewController.swift
//  Firebase101
//
//  Created by jung on 2020/09/03.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var curvalue = 0
    let ref = Database.database().reference()
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var numOfCustomers: UILabel!
    
    var customers_local : [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updataLabel()
        
        fetchCustomers()
        
        updateBasicTypes()
        //deleteBasicTypes()
    }
    
    func updataLabel(){
        ref.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("--> \(snapshot)")
            
            let value = snapshot.value as? String ?? ""
            
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
            
        }
    }
    
    @IBAction func createCustomer(_ sender: Any) {
        saveCustomers()
    }
    
    @IBAction func readCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    func updateCustomers(){
        guard customers_local.isEmpty == false else { return }
        customers_local[0].name = "Min"
        
        let dictionaries = customers_local.map { $0.toDictionary }
        ref.updateChildValues(["customers": dictionaries])
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomers()
    }
    
    @IBAction func deleteCustomer(_ sender: Any) {
        ref.child("customers").removeValue()
    }
}

extension ViewController {
    func saveBasicTypes() {
        ref.child("int").setValue(3)
        
    }
    
    func saveCustomers(){
        let books = [Book(title: "Good to Great", author: "Someone"), Book(title: "abc", author: "twotwo")]
        
        let cu1 = Customer(id: "\(Customer.id)", name: "Son", books: books)
        Customer.id += 1
        let cu2 = Customer(id: "\(Customer.id)", name: "Deke", books: books)
        Customer.id += 1
        let cu3 = Customer(id: "\(Customer.id)", name: "soso", books: books)
        Customer.id += 1
        
        ref.child("customers").child(cu1.id).setValue(cu1.toDictionary)
        ref.child("customers").child(cu2.id).setValue(cu2.toDictionary)
        ref.child("customers").child(cu3.id).setValue(cu3.toDictionary)
    }
}

extension ViewController {
    func fetchCustomers(){
        ref.child("customers").observeSingleEvent(of: .value){snapshot in
            print("--> \(snapshot.value)")
            
            do{
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                
                self.customers_local = customers
                DispatchQueue.main.async {
                    self.numOfCustomers.text = "# of Customers: \(customers.count)"
                }
                print("--> customers: \(customers.count)")
            
            } catch let error {
                print("---> error: \(error.localizedDescription)")
            }
        }
    }
}

extension ViewController {
    func updateBasicTypes(){
        ref.updateChildValues(["int": 6])
        ref.updateChildValues(["double": 10.9])
        ref.updateChildValues(["str": "change!"])
    }
    func deleteBasicTypes(){
        
    }
}

struct Customer: Codable {
    let id: String
    var name: String
    let books: [Book]
    
    var toDictionary: [String:Any] {
        let booksArray = books.map{ $0.toDictionary}
        let dict: [String:Any] = ["id":id, "name":name, "books": booksArray]
        return dict
    }
    
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
    
    var toDictionary: [String:Any] {
        let dict : [String:Any] = ["title": title, "author":author]
        return dict
    }
}
