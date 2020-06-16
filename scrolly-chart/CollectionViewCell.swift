import UIKit

class CollectionViewCell: UICollectionViewCell {

    var barHeight: CGFloat? {
        /**
         If this is omitted, unexpected rendering behavior will occur
         when cells are being reused.
         */
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {

        guard let barHeight = self.barHeight else { return }

        let insetRect = CGRect(x: rect.minX, y: (rect.height - barHeight), width: rect.width, height: barHeight)
        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: insetRect.width / 4)
        UIColor.purple.setFill()
        path.close()
        path.fill()
    }
}
