import UIKit

class ChartViewController: UICollectionViewController {

    var chartDataSource: [CGFloat] = [1.0, 2.0, 3.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "barCell")
    }

    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        print("init'd")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chartDataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath)
        cell.backgroundColor = UIColor.green
        return cell
    }
}

