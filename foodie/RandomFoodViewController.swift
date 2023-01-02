//
//  RandomFoodViewController.swift
//  foodie
//
//  Created by Wei Pan on 2022/12/4.
//

import UIKit

class RandomFoodViewController: UIViewController {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var soupAndDrinkName: UILabel!
    @IBOutlet weak var soupAndDrinkImage: UIImageView!
    
    var name: String?
    var gender: String = ""
    var period: String = ""
    var meal: String = ""
    var randomFoodName = ""
    var randomFoodImage = ""
    var randomSoupAndDrinkName = ""
    var randomSoupAndDrinkImage = ""
    
    @IBOutlet weak var firstSentence: UILabel!
    @IBOutlet weak var secondSentence: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(frame: CGRect(x: 0, y: 620, width: 414, height: 314))
        view.addSubview(imageView)
        let animatedImage = UIImage.animatedImageNamed("b6b7fd021bf9e617cbc140fb73774204-", duration: 3)
        imageView.image = animatedImage
        
        showAnswer()
        
        // Do any additional setup after loading the view.
    }
    
    func showAnswer(){
        
        let foodieName = name ?? "Foodie"
        firstSentence.text = "\(foodieName) \(gender) \(period)，"
        secondSentence.text = "今天的\(meal)就決定是～"
        
        foodName.text = randomFoodName
        foodImage.image = UIImage(named: randomFoodName)
        
        soupAndDrinkName.text = randomSoupAndDrinkName
        soupAndDrinkImage.image = UIImage(named: randomSoupAndDrinkName)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
