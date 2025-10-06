import UIKit

class UIAnalyticTransactionsCell: UITableViewCell {
    var imageCircleAnalytics = UIImageView()
    var titleLabel =  UILabel()
    var imageArrow = UIImageView()
    
   
    init(reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .lightGray.withAlphaComponent(0.1)
        //MARK: imageCircleAnaltyics
        self.contentView.addSubview(imageCircleAnalytics)
        self.imageCircleAnalytics.translatesAutoresizingMaskIntoConstraints = false
        self.imageCircleAnalytics.image = UIImage(resource: .chromatic)
        NSLayoutConstraint.activate([
            self.imageCircleAnalytics.widthAnchor.constraint(equalToConstant: 37.5),
            self.imageCircleAnalytics.heightAnchor.constraint(equalToConstant: 37.5),
            self.imageCircleAnalytics.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.contentView.heightAnchor.constraint(equalToConstant: 78),
            //self.imageCircleAnalytics.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            //self.imageCircleAnalytics.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            self.imageCircleAnalytics.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
        ])
        //MARK: titleLabel
        self.contentView.addSubview(titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = "Аналитика танзакций"
        self.titleLabel.textColor = UIColor(red: 0, green: 0, blue: 0.8, alpha: 0.9)
        self.titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.imageCircleAnalytics.trailingAnchor,constant: 16),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor),
        ])
        //MARK: imageArrow
        self.contentView.addSubview(imageArrow)
        self.imageArrow.translatesAutoresizingMaskIntoConstraints = false
        self.imageArrow.image = UIImage(systemName: "arrow.right")
        NSLayoutConstraint.activate([
            self.imageArrow.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            self.imageArrow.centerYAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor),
        ])
       
    }
}
