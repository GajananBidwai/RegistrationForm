//
//  ViewController.swift
//  RegistrationForm
//
//  Created by Neosoft on 10/05/24.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    var educationArray = ["PostGraduate", "Graduate", "HSC/Diploma", "SSC"]
    var datePicker2: UIDatePicker?
    var pickerView : UIPickerView?
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var dateOfBirthtextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!{
        didSet{
            nameTextField.tintColor = UIColor.black
            nameTextField.setIcon(UIImage(imageLiteralResourceName: "Person"))
            nameTextField.layer.borderWidth = 2.0
            nameTextField.layer.cornerRadius = 10
            nameTextField.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var lastNameTextField: UITextField!{
        didSet{
            lastNameTextField.tintColor = UIColor.black
            lastNameTextField.setIcon(UIImage(imageLiteralResourceName: "Person"))
            lastNameTextField.layer.borderWidth = 2.0
        }
    }
    @IBOutlet weak var phoneNumberTextField: UITextField!{
        didSet{
            phoneNumberTextField.tintColor = UIColor.black
            phoneNumberTextField.setIcon(UIImage(imageLiteralResourceName: "call 1"))
            phoneNumberTextField.layer.borderWidth = 2.0
        }
    }
    @IBOutlet weak var emailTextField: UITextField!{
        didSet{
            emailTextField.tintColor = UIColor.black
            emailTextField.setIcon(UIImage(imageLiteralResourceName: "Email1"))
            emailTextField.layer.borderWidth = 2.0
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            passwordTextField.tintColor = UIColor.black
            passwordTextField.setIcon(UIImage(imageLiteralResourceName: "Lock"))
            passwordTextField.layer.borderWidth = 2.0
        }
    }
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    {
        didSet{
            confirmPasswordTextField.tintColor = UIColor.black
            confirmPasswordTextField.setIcon(UIImage(imageLiteralResourceName: "Lock"))
            confirmPasswordTextField.layer.borderWidth = 2.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maleButton.setImage(UIImage(imageLiteralResourceName: "UnchackedRadioButton"), for: .normal)
        maleButton.setImage(UIImage(imageLiteralResourceName: "ChackedRadioButton"), for: .selected)
        femaleButton.setImage(UIImage(imageLiteralResourceName: "UnchackedRadioButton"), for: .normal)
        femaleButton.setImage(UIImage(imageLiteralResourceName: "ChackedRadioButton"), for: .selected)
        
    
        educationPickerDropdownButton()
        dateOfBirthDropdownButton()
        maleButton.setTitleColor(.black, for: .normal)
        femaleButton.backgroundColor = .clear
    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        
    guard let name = nameTextField.text, !name.isEmpty else {
        print("Please enter your first name")
        let alert = UIAlertController(title: "Invalid Name", message: "Please enter your first name", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default) { _ in
            }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true)
        return
    }
        if name.isValidName() {
            print("Your first name is valid")
        } else {
            print("More than 3 characters Required!!")
        let alert = UIAlertController(title: "Invalid Name", message: "Please enter a valid first name with more than 3 characters", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default) { _ in }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true)
        }
        
        
        guard let lastName = lastNameTextField.text, !name.isEmpty else{
            print("Please enter a last name")
            let alert = UIAlertController(title: "Invalid Last Name", message: "Please enter your last name", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in }
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
            return
        }
        if lastName.isValidName(){
            print("Your last name is valid")
        }else{
            print("More than 3 charecters Required!!")
            let alert = UIAlertController(title: "Invalid Last Name", message: "Please enter a valid last name with more than 3 characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        
        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty
        else{
            print("Please enter phone number")
            let alert = UIAlertController(title: "Invalid Phone Number", message: "Please enter your phone number", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
            return
        }
        
        if phoneNumber.isValidPhoneNumber(){
            print("Your phone number is valid")
        } else {
            print("Please enter a valid phone number")
            let alert = UIAlertController(title: "Invalid phone Number", message: "Please enter a valid 10 digit phone Number", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        
        guard let email = emailTextField.text, !email.isEmpty else {
            print("Please enter an email address")
            let alert = UIAlertController(title: "Invalid Email", message: "Please enter an email address", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
            return
        }
        if email.isValidEmail() {
            print("Your email is valid")
        } else {
            print("Please enter a valid email address")
            let alert = UIAlertController(title: "Invalid Email", message: "Please enter an Standard email formate", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        
        guard let password = passwordTextField.text, !password
            .isEmpty else{
            print("Please enter a password")
            let alert = UIAlertController(title: "Invalid Password", message: "Please enter Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
            return
        }
        if password.isValidPassword(){
            print("Your passoword is valid")
        }else{
            print("Please enter a valid password")
            let alert = UIAlertController(title: "Invalid Password", message: "Your password must contains minimum 1 charecter, number and special charecter", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        
        guard let confirmedPassword = confirmPasswordTextField.text, !confirmedPassword.isEmpty else{
            print("Please enter a valid confirm password")
            let alert = UIAlertController(title: "Invalid Password", message: "Please enter confirmed password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
            return
        }
        
        if password == confirmedPassword{
            print("Password matches")
        }else{
            print("Password does not mactches")
            let alert = UIAlertController(title: "Invalid Password", message: "Password does not mactches", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { _ in}
            let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in}
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let userEntity = UserEntity(context: context)
        userEntity.firstName = name
        userEntity.lastName = lastName
        userEntity.email = email
        userEntity.phoneNomber = phoneNumber
        userEntity.password = password
        userEntity.confirmPassword = confirmedPassword
        
        
        do{
            try context.save()
            
        }catch{
            print("User Saving Error", error)
        }
    }
    
    @objc func doneButtonTap(_ sender : UIBarButtonItem){

        let selectedRow = pickerView?.selectedRow(inComponent: 0)
        educationTextField.text = educationArray[selectedRow ?? 1]
        educationTextField.resignFirstResponder()

    }
    
    @objc func dropdownButtonTapped(_ sender: UIButton) {
        educationTextField.becomeFirstResponder()
        
    }
    
    @objc func dateDropdownButtonTapped(_ sender: UIButton) {
        dateOfBirthtextField.becomeFirstResponder()
    }
    
    @objc func dateSelected(_ sender: UIDatePicker) {
        let currentDate = Date()
        sender.maximumDate = currentDate

    }
   
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        if let datePicker = datePicker2 {
            let dateFormmater = DateFormatter()
            dateFormmater.dateStyle = .full
            dateFormmater.dateFormat = "DD-MM-YYYY"
            dateFormmater.dateStyle = .long
            let date = dateFormmater.string(from: datePicker.date)
            dateOfBirthtextField.text = date
            self.view.endEditing(true)
        }
    }
    
    @IBAction func buttonSelectGender(_ sender: UIButton) {
        if sender == maleButton{
            maleButton.isSelected = true
            femaleButton.isSelected = false
            maleButton.backgroundColor = .clear
        }else{
            maleButton.isSelected = false
            femaleButton.isSelected = true
            femaleButton.backgroundColor = .clear
        }
    }
}

extension ViewController {
    func educationPickerDropdownButton(){
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(imageLiteralResourceName: "dropDown20"), for: .normal)
        let buttonWidth : CGFloat = 40
        let buttonHeight : CGFloat = 40
        
        let buttonX = educationTextField.frame.width - buttonWidth - 255
        let buttonY = educationTextField.frame.height - buttonHeight / 2
        
        let view = UIView(frame: CGRect(x: buttonX, y: buttonY , width: buttonX, height: buttonY))
        
        button.frame = CGRect(x: 0, y: 8, width: 20, height: 20)
        view.addSubview(button)
        view.backgroundColor = .white
        educationTextField.rightView = view
        educationTextField.rightViewMode = .always
        educationTextField.tintColor = UIColor.black
        educationTextField.layer.borderWidth = 2.0
        
        button.addTarget(self, action: #selector(dropdownButtonTapped(_:)),for: .touchUpInside)
    
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .default
        //toolbar.isTranslucent = true
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTap(_ :)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
    
        
        pickerView = UIPickerView()
        if let pickerView2 = pickerView{
            pickerView2.delegate  = self
            pickerView2.dataSource = self
        educationTextField.inputAccessoryView = toolbar
        educationTextField.inputView = pickerView2
        
            pickerView2.reloadAllComponents()
        }
        educationTextField.addPaddingToTheTextField()
    }
    
    func dateOfBirthDropdownButton(){
        dateOfBirthtextField.layoutIfNeeded()
        let buttonWidth: CGFloat = 40
        let buttonHeight: CGFloat = 40
        let buttonY: CGFloat = dateOfBirthtextField.frame.height - buttonHeight
        let buttonX: CGFloat = dateOfBirthtextField.frame.width - buttonWidth
        let view = UIView(frame: CGRect(x: buttonX , y: buttonY , width: buttonWidth , height: buttonHeight))
        view.backgroundColor = .white
        let buttonDOB = UIButton(frame: CGRect(x: 0, y: 10, width: 20, height: 20))
        buttonDOB.setImage(UIImage(named: "dropDown20"), for: .normal)
        view.addSubview(buttonDOB)
        
        dateOfBirthtextField.rightView = view
        dateOfBirthtextField.rightViewMode = .always
        dateOfBirthtextField.tintColor = UIColor.black
        dateOfBirthtextField.layer.borderWidth = 2.0
        
        buttonDOB.addTarget(self, action: #selector(dateDropdownButtonTapped(_:)), for: .touchUpInside)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped(_:)))
        let spaceBotton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceBotton, done], animated: true)
        
        datePicker2 = UIDatePicker()
        if let datepicker = datePicker2 {
            datepicker.datePickerMode = .date
            dateOfBirthtextField.inputView = datepicker
            dateOfBirthtextField.inputAccessoryView = toolbar
        
            toolbar.isTranslucent = true
            datepicker.preferredDatePickerStyle = .wheels
            datepicker.addTarget(self, action: #selector(dateSelected(_ :)), for: .valueChanged)
            dateOfBirthtextField.addPaddingToTheTextField()
        }
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 7, width: 25, height: 25))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 40, height: 40))
        iconContainerView.addSubview(iconView)

        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension ViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedOption = educationArray[row]
        educationTextField.text = selectedOption
    }
    
}

extension ViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return educationArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return educationArray[row]
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        return true
    }
}
extension UITextField {
    func addPaddingToTheTextField() {
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        paddingView.backgroundColor = .green
    }
}

extension String {
    func isValidEmail() -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool{
        let passwordRegex = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: self)
    }
    
    func isValidPhoneNumber() -> Bool{
        let phoneRegex = "^(?:|0|[1-9]\\d*)(?:\\.\\d*)?.{10}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return passwordTest.evaluate(with: self)
    }
    
    func isValidName() -> Bool{
        let nameRegex = "^[a-zA-Z]{4,}$"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return nameTest.evaluate(with: self)
    }
}
