import UIKit

class ChartViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var chartDataSource = (1...30).map { CGFloat($0) }
    var maxValue: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "barCell")
    }

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.maxValue = chartDataSource.max()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chartDataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! CollectionViewCell

        if let maxValue = self.maxValue {
            let dataValue = chartDataSource[indexPath.item]
            let barHeight = (dataValue / maxValue) * cell.frame.height
            cell.barHeight = barHeight
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(16.0)
        let height = self.view.safeAreaLayoutGuide.layoutFrame.height
        return CGSize(width: width, height: height)
    }
}

