//
//  WalkThroughViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/16.
//

import UIKit

class WalkThroughViewController: UIPageViewController {

    
    //배열 형태로 뷰 컨트롤러를 추가
    var pageViewControllerList: [UIViewController] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPageViewController()
        configurePageViewController()
        view.backgroundColor = .blue

    }
    

    func createPageViewController() {
        let sb = UIStoryboard(name: "WalkThrough", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: FirstViewController.reuseIdentifier)
        
        let vc2 = sb.instantiateViewController(withIdentifier: SecondViewController.reuseIdentifier)
        
        let vc3 = sb.instantiateViewController(withIdentifier: ThirdViewController.reuseIdentifier)
        
        pageViewControllerList = [vc1, vc2, vc3]
    }

    
    func configurePageViewController() {
        delegate = self
        dataSource = self
        
        //display
        guard let first = pageViewControllerList.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }
}

extension WalkThroughViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 현재 페이지뷰컨트롤러에 보이는 뷰컨(viewcController)의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
    
        let previousIndex = viewControllerIndex - 1
        
        return previousIndex < 0 ? nil : pageViewControllerList[previousIndex]
        
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // 현재 페이지뷰컨트롤러에 보이는 뷰컨(viewcController)의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
    
        let nextIndex = viewControllerIndex + 1
        
        return nextIndex >= pageViewControllerList.count ? nil : pageViewControllerList[nextIndex]

    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllerList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageViewControllerList.firstIndex(of: first) else { return 0 }
        return index
    }
}