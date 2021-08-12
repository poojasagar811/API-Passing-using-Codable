//
//  ViewController.swift
//  API Passing using Codable
//
//  Created by Pooja's MacBook Pro on 20/07/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    
    var  album = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
        
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)
            
            let dataTask = session.dataTask(with: url){data,response,error in
                
                if let unwrappedData = data{
                    
                    if let album = try?JSONDecoder().decode([Album].self, from: unwrappedData){
                        self.album = album
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                else {
                    print ("unable to unwrap data")
                }
            }
            dataTask.resume()
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let Cell =
        
                self.tableView.dequeueReusableCell(withIdentifier: "APITableViewCell")as? APITableViewCell
        else {
            return UITableViewCell()
        }
        
        let albums = album[indexPath.row]
        Cell.postId.text = String(albums.postId)
        Cell.id.text = String(albums.id)
        Cell.name.text = albums.name
        Cell.email.text = albums.email
        Cell.body.text = albums.body
        
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
        
    }
}

