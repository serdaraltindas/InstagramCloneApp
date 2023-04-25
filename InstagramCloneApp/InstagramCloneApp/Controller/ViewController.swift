

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func girisYapButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toFeedVC", sender: self)
    }
    
    @IBAction func kayitOlButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toFeedVC", sender: self)
    }
}

