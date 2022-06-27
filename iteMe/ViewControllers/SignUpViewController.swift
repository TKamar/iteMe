
import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        //Hide the error lablel
        errorLbl.alpha = 0
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(signUpBtn)
        
        
    }
    
    func validateFields() -> String? {
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all fields."
        }
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a spacial charcter and a number."
        }
    
        return nil
        
    }
    
    func showError(_ message : String) {
        errorLbl.text = message
        errorLbl.alpha = 1
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            let firstNamr = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) {
                (result, err) in
                if err != nil {
                    self.showError("Error creating user")
                }
                else{
                   let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["first_name": firstNamr, "last_name": lastName, "uid": result!.user.uid ]) {
                        (error) in
                        if error != nil {
                            self.showError("Error saving user data ")
                        }
                    }
                    self.transitionToHomePage()
                    
                }
                
            }
        }
        
    }
    
    
    func transitionToHomePage() {
        
        let homePageViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomePageViewController) as? HomePageViewController
        
        view.window?.rootViewController = homePageViewController
        view.window?.makeKeyAndVisible()
    }
    
    
    
    

}
