import UIKit

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable { }
extension UITableViewHeaderFooterView: Reusable { }
extension UICollectionViewCell: Reusable { }

public extension UITableView {
    
    // Cells
    @discardableResult
    public func registerReusable(cellClass: Reusable.Type, fromNib: Bool = false) -> UITableView {
        if fromNib {
            let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: nil)
            self.register(nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
        } else {
            self.register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
        }
        
        return self
    }

    public func dequeueReusable<T: UITableViewCell>(indexPath: IndexPath, fromNib: Bool = false) -> T {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    // HeaderFooterViews
    @discardableResult
    public func registerReusableHeaderFooterClass(headerFooterViewClass: Reusable.Type, fromNib: Bool = false) -> UITableView {
        if fromNib {
            let nib = UINib(nibName: headerFooterViewClass.reuseIdentifier, bundle: nil)
            self.register(nib, forHeaderFooterViewReuseIdentifier: headerFooterViewClass.reuseIdentifier)
        } else {
            self.register(headerFooterViewClass, forHeaderFooterViewReuseIdentifier: headerFooterViewClass.reuseIdentifier)
        }
        
        return self
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(fromNib: Bool = false) -> T? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T
    }
}

public extension UICollectionView {
    public func registerReusable(cellClass: Reusable.Type, fromNib: Bool = false) -> UICollectionView {
        if fromNib {
            let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
        } else {
            self.register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
        }
        
        return self
    }
    
    public func dequeueReusable<T: UICollectionViewCell>(indexPath: IndexPath, fromNib: Bool = false) -> T {
        let _ = self.registerReusable(cellClass: T.self, fromNib: fromNib)
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath ) as! T
    }
}
