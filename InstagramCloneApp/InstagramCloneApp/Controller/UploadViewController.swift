
import UIKit

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
        
    }
    
}
