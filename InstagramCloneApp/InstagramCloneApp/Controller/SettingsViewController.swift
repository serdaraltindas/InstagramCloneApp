
import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cikisYapButtonClicked(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        }catch {
            print("Hata!")
        }
        performSegue(withIdentifier: "toMainVC", sender: self)
    }
}
