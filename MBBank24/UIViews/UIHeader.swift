import UIKit

class UIHeader:UIView{
    var title = UILabel()
    init(title:String) {
        super.init(frame: .zero)
        setupUI(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(title:String) {
        self.addSubview(self.title)
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.title.text = title
        self.title.textColor = .white
        self.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //self.title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
        ])
    }
}
