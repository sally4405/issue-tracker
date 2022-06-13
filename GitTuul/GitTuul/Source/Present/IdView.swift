import UIKit

final class IdView: UIView {

    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디"
        label.font = .SFProText.regular(17)
        label.tintColor = .Custom.label1

        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = .SFProText.regular(17)
        label.tintColor = .Custom.label1

        return label
    }()

    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .GreyScale.grey5

        return view
    }()

    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.font = .SFProText.regular(17)
        textField.tintColor = .GreyScale.black

        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .SFProText.regular(17)
        textField.tintColor = .GreyScale.black
        textField.isSecureTextEntry = true
        
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        layoutIdLabel()
        layoutDivider()
        layoutPasswordLabel()
        layoutIdTextField()
        layoutPasswordTextField()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        layoutIdLabel()
        layoutDivider()
        layoutPasswordLabel()
        layoutIdTextField()
        layoutPasswordTextField()
    }

}

private extension IdView {

    func layoutIdLabel() {
        self.addSubview(idLabel)

        idLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(20)
        }
    }

    func layoutDivider() {
        self.addSubview(divider)

        divider.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(10.5)
            make.leading.equalTo(idLabel)
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    func layoutPasswordLabel() {
        self.addSubview(passwordLabel)

        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(10.5)
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(12)
        }
    }

    func layoutIdTextField() {
        self.addSubview(idTextField)

        idTextField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.65)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }

    func layoutPasswordTextField() {
        self.addSubview(passwordTextField)

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.equalToSuperview().multipliedBy(0.65)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
}
