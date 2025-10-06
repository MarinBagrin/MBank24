import UIKit
import Foundation
import Combine

class UITransactionCell: UITableViewCell {
    var imageNiche = UIImageView()
    var titleMechant = UILabel()
    var cardPayed = UILabel()
    var transactionAmount = UILabel()
    var paymentGadgetImage = UIImageView()
    var stateExecutionImage = UIImageView()
    
    
    init(reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    private func setupUI() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        //MARK: sepGen
        let topSep = sepGen
        let bottomSep = sepGen
        [topSep,bottomSep].forEach {sep in
            self.contentView.addSubview(sep)
            sep.translatesAutoresizingMaskIntoConstraints = false
            sep.backgroundColor = .gray.withAlphaComponent(0.2)
            NSLayoutConstraint.activate([
                sep.heightAnchor.constraint(equalToConstant: 0.5),
                sep.widthAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.widthAnchor),
                sep.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            ])
        }
        NSLayoutConstraint.activate([
            topSep.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            bottomSep.topAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
        //MARK: imageNiche
        self.contentView.addSubview(imageNiche)
        //self.imageNiche.contentMode = .scaleAspectFit
//        self.imageNiche.layer.shouldRasterize = false
//        self.imageNiche.layer.magnificationFilter = .linear
//        self.imageNiche.layer.minificationFilter = .linear
        self.imageNiche.translatesAutoresizingMaskIntoConstraints = false
        self.imageNiche.layer.cornerRadius = 27.5
        self.imageNiche.layer.borderColor = UIColor.white.cgColor
        self.imageNiche.layer.borderWidth = 5
        NSLayoutConstraint.activate([
            self.imageNiche.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            self.imageNiche.widthAnchor.constraint(equalToConstant: 55),
            self.imageNiche.heightAnchor.constraint(equalToConstant: 55),
            //self.imageNiche.centerYAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor),
            self.imageNiche.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            self.imageNiche.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
        ])
        
        //MARK: titleMechant
        self.contentView.addSubview(titleMechant)
        self.titleMechant.translatesAutoresizingMaskIntoConstraints = false
        self.titleMechant.textColor = UIColor(red: 0, green: 0, blue: 0.8, alpha: 0.9)
        self.titleMechant.font = .systemFont(ofSize: 16, weight: .bold)
        
        NSLayoutConstraint.activate([
            self.titleMechant.leadingAnchor.constraint(equalTo: self.imageNiche.trailingAnchor,constant: 8),
            self.titleMechant.widthAnchor.constraint(equalToConstant: 200),
            self.titleMechant.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor, constant: 0),
        ])
        //MARK: cardPayed

        self.contentView.addSubview(cardPayed)
        self.cardPayed.translatesAutoresizingMaskIntoConstraints = false
        self.cardPayed.textColor = .systemGray
        self.cardPayed.font = .systemFont(ofSize: 12, weight: .medium)
        NSLayoutConstraint.activate([
            self.cardPayed.leadingAnchor.constraint(equalTo: self.imageNiche.trailingAnchor,constant: 8),
            self.cardPayed.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor, constant: 4),
        ])
        //MARK: transactionAmount

        self.contentView.addSubview(transactionAmount)
        self.transactionAmount.translatesAutoresizingMaskIntoConstraints = false
        self.transactionAmount.textColor = UIColor(red: 0, green: 0, blue: 0.8, alpha: 0.9)
        self.transactionAmount.font = .systemFont(ofSize: 16, weight: .bold)
        NSLayoutConstraint.activate([
            self.transactionAmount.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            self.transactionAmount.topAnchor.constraint(equalTo: self.titleMechant.topAnchor),
        ])

        
    }
    func updateView(transaction:TransactionDomain) {
        //MARK: installPhotoMechant
        self.paymentGadgetImage.removeFromSuperview()
        self.stateExecutionImage.removeFromSuperview()
        self.transactionAmount.textColor =  UIColor(red: 0, green: 0.1, blue: 0.65, alpha: 1)
        if (MerchantType(rawValue: transaction.type_merchant)  == .MIA ) {
            if transaction.amount < 0 {
                self.transactionAmount.textColor = UIColor(red: 0.1, green: 0.8, blue: 0.2, alpha: 1)
            }
            self.contentView.addSubview(stateExecutionImage)
            self.stateExecutionImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.stateExecutionImage.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
                self.stateExecutionImage.topAnchor.constraint(equalTo: self.contentView.centerYAnchor,constant: 4),
                self.stateExecutionImage.widthAnchor.constraint(equalToConstant: 20),
                self.stateExecutionImage.heightAnchor.constraint(equalToConstant: 20),
                ])
        } else {
            
            self.contentView.addSubview(stateExecutionImage)
            self.stateExecutionImage.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(paymentGadgetImage)
            self.paymentGadgetImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.paymentGadgetImage.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
                self.paymentGadgetImage.topAnchor.constraint(equalTo: self.contentView.centerYAnchor,constant: 0),
                self.stateExecutionImage.trailingAnchor.constraint(equalTo: self.paymentGadgetImage.leadingAnchor,constant: -4),
                self.stateExecutionImage.topAnchor.constraint(equalTo: self.contentView.centerYAnchor,constant: 4),
                self.stateExecutionImage.widthAnchor.constraint(equalToConstant: 20),
                self.stateExecutionImage.heightAnchor.constraint(equalToConstant: 20),
                self.paymentGadgetImage.widthAnchor.constraint(equalToConstant: 20),
                self.paymentGadgetImage.heightAnchor.constraint(equalToConstant: 30),
            ])
        }
        switch transaction.status {
        case 0:
            self.stateExecutionImage.image = UIImage(resource: .executing)
        case 1:
            self.stateExecutionImage.image = UIImage(resource: .payed)
        default:
            break
        }
        switch transaction.type_merchant {
        case 1:
            imageNiche.image = UIImage(resource: .food)
        case 2:
            imageNiche.image = UIImage(resource: .mia)
        case 3:
            imageNiche.image = UIImage(resource: .restourant)
        case 4:
            imageNiche.image = UIImage(resource: .others)
        case 5:
            imageNiche.image = UIImage(resource: .tourism)
        default:
            break
        }
        self.paymentGadgetImage.image = UIImage(resource: .paydPhone)
        self.titleMechant.text = transaction.merchant
        self.cardPayed.text = transaction.card_number
        self.transactionAmount.text = FormatterUtills.decoupleNumber(accountInDouble: abs(transaction.amount))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
