import UIKit

final class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        let gradientView = GradientView()
        gradientView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
