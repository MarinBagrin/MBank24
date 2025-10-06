import UIKit
class UITableViewCardCell:UITableViewCell {
    var cardNumber = UILabel()
    var cardPhoto = UIImageView()
    var cardExpire = UILabel()
    var typeCard = UILabel()
    init(reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    func update(credentials: CredentialsCard) {
        self.cardNumber.text = credentials.cardNumberString
        self.cardExpire.text = String(credentials.expTime.month) + "/" + String(credentials.expTime.year)
        self.typeCard.text = credentials.typeCard == .visa ? "Visa Classic" : "MasterCard"
    }
    private func setupUI() {
        //MARK: CardPhoto
        self.contentView.addSubview(cardPhoto)
        self.cardPhoto.translatesAutoresizingMaskIntoConstraints = false
        //self.cardPhoto.backgroundColor = .blue.withAlphaComponent(0.6)
//        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .light)
        self.cardPhoto.image = UIImage(systemName: "creditcard.fill")
        self.cardPhoto.tintColor = .systemBlue
        NSLayoutConstraint.activate([
            self.cardPhoto.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            self.cardPhoto.widthAnchor.constraint(equalToConstant: 95),
            self.cardPhoto.heightAnchor.constraint(equalToConstant: 55),
            self.cardPhoto.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            self.cardPhoto.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor)
        ])
        
        //MARK: CardNumber
        self.contentView.addSubview(cardNumber)
        self.cardNumber.translatesAutoresizingMaskIntoConstraints = false
        self.cardNumber.textColor = .systemBlue
        NSLayoutConstraint.activate([
            self.cardNumber.leadingAnchor.constraint(equalTo: self.cardPhoto.trailingAnchor, constant: 8),
            self.cardNumber.topAnchor.constraint(equalTo: self.cardPhoto.topAnchor),
        ])
        //MARK: CardType
        self.contentView.addSubview(typeCard)
        self.typeCard.translatesAutoresizingMaskIntoConstraints = false
        self.typeCard.font = .systemFont(ofSize: 16)
        self.typeCard.textColor = .lightGray.withAlphaComponent(0.95)
        NSLayoutConstraint.activate([
            self.typeCard.leadingAnchor.constraint(equalTo: self.cardPhoto.trailingAnchor, constant: 8),
            self.typeCard.bottomAnchor.constraint(equalTo: self.cardPhoto.bottomAnchor),
        ])

        
        //MARK: CardExpire
        self.contentView.addSubview(cardExpire)
        self.cardExpire.font = .systemFont(ofSize: 12)
        self.cardExpire.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.cardExpire.trailingAnchor.constraint(equalTo: self.cardPhoto.trailingAnchor, constant: -16),
            self.cardExpire.bottomAnchor.constraint(equalTo: self.cardPhoto.bottomAnchor, constant: -11)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




