

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
        // Do any additional setup after loading the view.
    }
    
    
    func setUpElements() {
        
        //Hide the error lablel
        errorLbl.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginBtn)        
    }

    @IBAction func loginBtnTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, err) in
            if err != nil {
                self.errorLbl.text = err!.localizedDescription
                self.errorLbl.alpha = 1
            }
            else {
                self.signIn()
            }
        }
    }
    
    
    func signIn() {
        let homePageViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomePageViewController) as? HomePageViewController
        
        view.window?.rootViewController = homePageViewController
        view.window?.makeKeyAndVisible()
    }
    
    
    
}
