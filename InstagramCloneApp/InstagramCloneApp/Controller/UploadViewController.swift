
import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //close keyboard.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    }
    @objc func gorselSec(){
        //kütüphane git-> pickerController
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        //galeri-> göster
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //medya seçimi bitti.
        imageView.image = info[.editedImage] as? UIImage
        //açılan galeriyi kapat.
        self.dismiss(animated: true)
    }
    @objc func klavyeyiKapat(){
        //aksiyonları kapat.
        view.endEditing(true)
    }
    
    @IBAction func uploadButtonClicked(_ sender: UIButton) {
        
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let mediaFolder = storageReferance.child("Media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data) { (StorageMetadata, error) in
                if error != nil {
                    self.hataMesajı(title: "Hata!", message: error?.localizedDescription ?? "Hata!")
                }else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                           
                            
                        }
                    }
                }
            }
        }
    }
    func hataMesajı(title : String , message : String){
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true)
    }
}
