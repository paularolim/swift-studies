//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Paula Rolim on 22/08/23.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class OnboardingContainerViewController: UIViewController {
    
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    private var pages: [UIViewController] = []
    
    private var pageViewController: UIPageViewController
    
    private var currentViewController: UIViewController {
        didSet {
            guard let index = pages.firstIndex(of: currentViewController) else { return }
            nextButton.isHidden = index == pages.count - 1
            backButton.isHidden = index == 0
            doneButton.isHidden = !(index == pages.count - 1)
        }
    }
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        let page1 = OnboardingViewController(imageName: "delorean", description: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
        let page2 = OnboardingViewController(imageName: "world", description: "Move your money around the world quickly and securely.")
        let page3 = OnboardingViewController(imageName: "thumbs", description: "Learn more at www.bankey.com.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentViewController = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Setup
extension OnboardingContainerViewController {
    private func setup() {
        view.backgroundColor = .systemBackground
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false)
        currentViewController = pages.first!
        
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backTapped), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 6)
        ])
        
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 6)
        ])
        
        view.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 6)
        ])
    }
}

//MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentViewController = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentViewController = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: currentViewController) ?? 0
    }
}

//MARK: - Actions
extension OnboardingContainerViewController {
    @objc private func closeTapped() {
        delegate?.didFinishOnboarding()
    }
    
    @objc private func backTapped() {
        guard let prevViewController = getPreviousViewController(from: currentViewController) else { return }
        pageViewController.setViewControllers([prevViewController], direction: .reverse, animated: false)
    }
    
    @objc private func nextTapped() {
        guard let nextViewController = getNextViewController(from: currentViewController) else { return }
        pageViewController.setViewControllers([nextViewController], direction: .forward, animated: false)
    }
    
    @objc private func doneTapped() {
        delegate?.didFinishOnboarding()
    }
}
