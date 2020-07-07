import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // Mark: Actions
    @IBAction func logout_Btn_Pressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewC = storyboard.instantiateViewController(withIdentifier: "viewC")

        self.present(viewC, animated: true, completion: nil)
    }
    

}
