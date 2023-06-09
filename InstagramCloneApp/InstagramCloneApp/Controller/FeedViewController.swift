

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var emailDizisi = [String]()
    var yorumDizisi = [String]()
    var gorselDizisi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        firebaseVerileriAl()
    }
    
    func firebaseVerileriAl() {
        let firestoreDatabase = Firestore.firestore()
        //descanding -> yeni atılan en üstte
        firestoreDatabase.collection("Posted").order(by: "tarih", descending: true)
            .addSnapshotListener { (snapshot, error) in
            if error != nil {
                self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
            }else{
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.emailDizisi.removeAll(keepingCapacity: false)
                    self.gorselDizisi.removeAll(keepingCapacity: false)
                    self.yorumDizisi.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        //let documentId = document.documentID
                        
                        if let gorselUrl = document.get("gorselurl") as? String {
                            self.gorselDizisi.append(gorselUrl)
                        }
                        if let yorum = document.get("yorum") as? String {
                            self.yorumDizisi.append(yorum)
                        }
                        if let email = document.get("email") as? String {
                            self.emailDizisi.append(email)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailDizisi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        cell.emailText.text = emailDizisi[indexPath.row]
        cell.commentText.text = yorumDizisi[indexPath.row]
        cell.postImageView.sd_setImage(with: URL(string: self.gorselDizisi[indexPath.row]))
        return cell
        
    }
    func hataMesajı(title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
