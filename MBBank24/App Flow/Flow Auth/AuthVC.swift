import UIKit
import Combine
class AuthVC: FlowVC {
    //Logic
    var authVM:AuthVM
    
    //UI
    //var header = UIHeader(title: "6")
    var stackCodeDigits = UIStackView()
    var stackFillCodeDigits = UIStackView()
    var codeOFAccess = UILabel()
    var resetCodeAccess = UILabel()
    var languageButton = UIButton()
    //^UI
    init(coordinator: AuthCoordinator,domain:Domain,appVM:AppVM) {
        self.authVM = AuthVM(domain: domain)
        super.init(coordinator:coordinator, domain: domain, appVM: appVM, title: "")
        setupUI()
        subscribeONPublisher()        
    }
    deinit {
        print("AuthVC is destrcuted")
    }
    private func subscribeONPublisher() {
        authVM.$isCorrectCodeAuth
            .dropFirst()
            .sink {[weak self] isCorrectCodeAuth in //FEW
                if (isCorrectCodeAuth) {
                    (self?.coordinator as? AuthCoordinator)?.changeHomeFlow()
                }
            }
            .store(in: &cancellables)
    }
    private func subscribeCircleFillONPublisher(circleFill:UIView,index:Int) {
        authVM.$digitsCodePressed
            .sink { digitsCodePressed in
                let count = digitsCodePressed.count
                if (index <= count) {
                    circleFill.backgroundColor = UIColor(red: 0, green: 0, blue: 0.8, alpha: 1)
                }
                else {
                    circleFill.backgroundColor = .white
                }
            }
            .store(in: &cancellables)
    }
    private func setupUI() {
        self.view.backgroundColor = .white
        
        super.flowBar.removeFromSuperview()
        
        //header.translatesAutoresizingMaskIntoConstraints = false
        //self.view.addSubview(header)
        
        self.view.addSubview(stackCodeDigits)
        stackCodeDigits.translatesAutoresizingMaskIntoConstraints = false
        stackCodeDigits.axis = .vertical
        stackCodeDigits.spacing = 24
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.view.topAnchor),
            header.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            //
            stackCodeDigits.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackCodeDigits.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -48),
        ])
        
        self.view.addSubview(languageButton)
        self.languageButton.translatesAutoresizingMaskIntoConstraints = false
        self.languageButton.setImage(UIImage.langRu, for: .normal)
        
        NSLayoutConstraint.activate([
            languageButton.topAnchor.constraint(equalTo: super.header.bottomAnchor, constant: 8),
            languageButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            languageButton.widthAnchor.constraint(equalToConstant: 22),
            languageButton.heightAnchor.constraint(equalToConstant: 22),
        ])
        let colorFontDigits = UIColor(red: 0, green: 0, blue: 0.725, alpha: 0.8)
        for i in 0..<3 {
            let rowStack = UIStackView()
            rowStack.translatesAutoresizingMaskIntoConstraints = false
            rowStack.axis = .horizontal
            rowStack.spacing = 24
            for j in 1..<4 {
                let circleButtonCode = UIButton()
                
                let subText = UILabel()
                subText.textColor = .lightGray
                subText.translatesAutoresizingMaskIntoConstraints = false
                subText.font = UIFont.systemFont(ofSize: 13,weight: .medium)
                if (![1,7,8,9].contains( i * 3 + j)) {
                    
                    subText.text = String(UnicodeScalar(62 + (i * 3 + j-1) * 3)!) + String(UnicodeScalar(63 + (i * 3 + j-1) * 3)!) + String(UnicodeScalar(64 + (i * 3 + j-1) * 3)!)
                }
                else {
                    switch  i * 3 + j {
                    case 7:
                        subText.text = "PQRS"
                    case 8:
                        subText.text = "TUV"
                    case 9:
                        subText.text = "WXYZ"
                    default:
                        break
                    }
                }
                circleButtonCode.addSubview(subText)
                circleButtonCode.translatesAutoresizingMaskIntoConstraints = false
                circleButtonCode.setTitle(String(i * 3 + j), for: .normal)
                circleButtonCode.setTitleColor(colorFontDigits, for: .normal)
                circleButtonCode.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.30).cgColor
                circleButtonCode.layer.borderWidth = 1
                circleButtonCode.layer.cornerRadius = 43
                circleButtonCode.titleLabel?.font = UIFont.systemFont(ofSize:34)
                circleButtonCode.addTarget(self, action: #selector(buttonDigitCodeTapped), for: .touchUpInside)
                rowStack.addArrangedSubview(circleButtonCode)
                NSLayoutConstraint.activate([
                    circleButtonCode.widthAnchor.constraint(equalToConstant: 86),
                    circleButtonCode.heightAnchor.constraint(equalToConstant: 86),
                    subText.topAnchor.constraint(equalTo: circleButtonCode.titleLabel!.bottomAnchor, constant: -2),
                    subText.centerXAnchor.constraint(equalTo: circleButtonCode.centerXAnchor)
                ])
            }
            stackCodeDigits.addArrangedSubview(rowStack)
        }
        
        let rowStack = UIStackView()
        rowStack.translatesAutoresizingMaskIntoConstraints = false
        rowStack.axis = .horizontal
        rowStack.spacing = 24
        for i in 0..<3 {
            let circleButtonCode = UIButton()
            let faceIDButton = UIButton()
            let deleteDigitButton = UIButton()
            circleButtonCode.translatesAutoresizingMaskIntoConstraints = false
            faceIDButton.translatesAutoresizingMaskIntoConstraints = false
            deleteDigitButton.translatesAutoresizingMaskIntoConstraints = false
            if (i == 1) {
                circleButtonCode.setTitle(String(0), for: .normal)
                circleButtonCode.layer.borderWidth = 1
                circleButtonCode.layer.cornerRadius = 43
                circleButtonCode.setTitleColor(colorFontDigits, for: .normal)
                circleButtonCode.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.30).cgColor
                circleButtonCode.titleLabel?.font = UIFont.systemFont(ofSize:34)
                circleButtonCode.addTarget(self, action: #selector(buttonDigitCodeTapped), for: .touchUpInside)
                rowStack.addArrangedSubview(circleButtonCode)
                NSLayoutConstraint.activate([
                    circleButtonCode.widthAnchor.constraint(equalToConstant: 86),
                    circleButtonCode.heightAnchor.constraint(equalToConstant: 86),
                    
                ])
            }
            let config = UIImage.SymbolConfiguration(pointSize: 56, weight: .ultraLight)
            let configArrow = UIImage.SymbolConfiguration(pointSize: 33, weight: .thin)

            if (i == 0) {
                faceIDButton.setImage(UIImage(systemName: "faceid",withConfiguration: config), for: .normal)
                rowStack.addArrangedSubview(faceIDButton)
                NSLayoutConstraint.activate([
                    faceIDButton.widthAnchor.constraint(equalToConstant: 86),
                    faceIDButton.heightAnchor.constraint(equalToConstant: 86),
                ])
            }
            if (i == 2) {
                deleteDigitButton.setImage(UIImage(systemName: "arrow.backward",withConfiguration: configArrow), for: .normal)
                rowStack.addArrangedSubview(deleteDigitButton)
                NSLayoutConstraint.activate([
                    deleteDigitButton.widthAnchor.constraint(equalToConstant: 86),
                    deleteDigitButton.heightAnchor.constraint(equalToConstant: 86),
                ])
                deleteDigitButton.addTarget(self, action: #selector(buttonDeleteDigitCodeTapped), for: .touchUpInside)
            }
            
        }
        stackCodeDigits.addArrangedSubview(rowStack)
        self.view.addSubview(stackFillCodeDigits)
        stackFillCodeDigits.translatesAutoresizingMaskIntoConstraints = false
        stackFillCodeDigits.axis = .horizontal
        stackFillCodeDigits.spacing = 18
        NSLayoutConstraint.activate([
            stackFillCodeDigits.bottomAnchor.constraint(equalTo: stackCodeDigits.topAnchor, constant: -24),
            stackFillCodeDigits.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        for i in 0..<5 {
            let circleFill = UIView()
            circleFill.translatesAutoresizingMaskIntoConstraints = false
            circleFill.backgroundColor = .white
            circleFill.layer.cornerRadius = 6
            circleFill.layer.borderWidth = 1
            circleFill.layer.borderColor = UIColor.lightGray.cgColor
            stackFillCodeDigits.addArrangedSubview(circleFill)
            NSLayoutConstraint.activate([
                circleFill.widthAnchor.constraint(equalToConstant: 12),
                circleFill.heightAnchor.constraint(equalToConstant: 12),
            ])
            subscribeCircleFillONPublisher(circleFill: circleFill, index: i+1)
        }
        
        self.view.addSubview(codeOFAccess)
        
        codeOFAccess.translatesAutoresizingMaskIntoConstraints = false
        codeOFAccess.text = "Введите код доступа"
        codeOFAccess.textColor = .black
        codeOFAccess.font = UIFont.systemFont(ofSize: 16)
        NSLayoutConstraint.activate([
            codeOFAccess.bottomAnchor.constraint(equalTo: stackFillCodeDigits.topAnchor, constant: -20),
            codeOFAccess.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        self.view.addSubview(resetCodeAccess)
        resetCodeAccess.translatesAutoresizingMaskIntoConstraints = false
        resetCodeAccess.text = "Cбросить код доступа"
        resetCodeAccess.textColor = .black
        resetCodeAccess.font = UIFont.systemFont(ofSize: 16)
        NSLayoutConstraint.activate([
            resetCodeAccess.topAnchor.constraint(equalTo: stackCodeDigits.bottomAnchor, constant: 16),
            resetCodeAccess.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    @objc func buttonDeleteDigitCodeTapped() {
        authVM.pressedDeleteDigitCode()
    }
    @objc func buttonDigitCodeTapped(_ sender:UIButton) {
        //CEF
        print(sender.titleLabel?.text)
        if let digitPressed = sender.titleLabel?.text {
            authVM.pressedDigitCode(digitCode: digitPressed)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

