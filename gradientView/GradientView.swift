import UIKit

final class GradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }

    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.addSublayer(makeGradientLayer())
        setupSize()
        setupCornerRadius()
        setupShadow()
    }

    private func makeGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.startPoint = .zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [
            UIColor.red.cgColor,
            UIColor.green.cgColor,
            UIColor.blue.cgColor
        ]
        gradient.locations = [0, 0.5, 1]
        return gradient
    }

    private func setupSize() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: Constants.width),
            heightAnchor.constraint(equalToConstant: Constants.height)
        ])

        layer.sublayers?.forEach {
            $0.frame = CGRect(
                origin: .zero,
                size: CGSize(width: Constants.width, height: Constants.height)
            )
        }
    }

    private func setupCornerRadius() {
        layer.cornerRadius = Constants.cornerRadius
        layer.sublayers?.forEach {
            $0.cornerRadius = Constants.cornerRadius
        }
    }

    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 30
    }

}

extension GradientView {

    private struct Constants {
        static let width: CGFloat = 100
        static let height: CGFloat = 100
        static let cornerRadius: CGFloat = 30
    }

}
