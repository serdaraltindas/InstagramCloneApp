import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    //textField
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func girisYapButtonClicked(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdataresult, error) in
                if error != nil {
                    self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: self)
                }
            }
        }else{
            self.hataMesajı(title: "Hata!", message: "Email veya parola hatalı, tekrar deneyiniz!")
        }
    }
    
    @IBAction func kayitOlButtonClicked(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdataresult, error) in
                if error != nil {
                    self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: self)
                }
            }
        } else {
            //error!
            hataMesajı(title: "Hata!", message: "Email veya parola hatalı, tekrar deneyiniz!")
        }
    }
    //alert message
    func hataMesajı(title : String , message : String){
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true)
    }
}

