//
//  FilterViewController.swift
//  foodie
//
//  Created by Wei Pan on 2022/12/4.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var periodSegmentedControl: UISegmentedControl!
    @IBOutlet weak var soupAndDrinkSwtch: UISwitch!
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    let foodArray1 = ["奶粉", "副食品", "水果"]
    let foodArray2 = ["三明治", "小籠包","沙拉", "法式吐司", "麥片", "飯糰", "漢堡", "鬆餅", "麵包"]
    let soupAndDrinkArray2 = ["豆漿", "味噌湯", "抹茶", "果汁", "茶", "咖啡", "牛奶", "水"]
    var foodArray3 = ["三明治", "小籠包","沙拉", "麥片", "飯糰", "漢堡", "麵包", "日式丼飯", "日式定食", "水餃", "火鍋", "牛排", "印度捲餅", "肉粽", "串燒", "咖喱飯", "拉麵", "泡麵", "炒飯", "炒麵", "便當", "炭烤", "炸魚薯條", "炸雞", "烏龍麵", "烤鴨", "烤雞", "速食", "港式點心", "越南春捲", "義大利麵", "壽司", "壽喜燒", "辣炒年糕", "墨西哥捲餅", "燉菜", "燉飯", "燒烤", "蕎麥麵", "龍蝦", "韓式拌飯", "關東煮", "pizza", "牛肉麵", "炸醬麵"]
    let soupAndDrinkArray3 = ["豆漿", "味噌湯", "抹茶", "果汁", "茶", "咖啡", "牛奶", "水", "珍珠奶茶", "啤酒", "可樂", "清酒", "燒酒", "雞湯", "泰式冬陰功", "紅酒", "白酒", "威士忌", "西式濃湯", "中式清湯", "紅豆湯"]
    let foodArray4 = ["三明治", "小籠包", "冰淇淋", "法式吐司", "泡麵", "炸雞", "甜甜圈", "蛋糕", "章魚燒", "飯糰", "漢堡", "雞蛋仔", "鬆餅", "麵包", "沙拉", "水果"]
    let soupAndDrinkArray4 = ["水", "牛奶", "可樂", "豆漿", "咖啡", "抹茶", "果汁", "珍珠奶茶", "紅豆湯", "茶"]
    let foodArray5 = ["三明治", "小籠包","沙拉", "麥片", "飯糰", "麵包", "串燒", "泡麵", "炸雞", "速食","辣炒年糕", "關東煮"]
    let soupAndDrinkArray5 = ["豆漿", "抹茶", "果汁", "茶", "牛奶", "水", "珍珠奶茶", "啤酒", "可樂", "清酒", "燒酒", "紅酒", "白酒", "威士忌", "紅豆湯"]
    let soupAndDrinkArray6 = ["豆漿", "味噌湯", "抹茶", "果汁", "茶", "咖啡", "牛奶", "水", "珍珠奶茶", "可樂", "雞湯", "泰式冬陰功", "西式濃湯", "中式清湯", "紅豆湯"]
    let soupAndDrinkArray7 = ["豆漿", "抹茶", "果汁", "茶", "牛奶", "水", "珍珠奶茶", "可樂", "紅豆湯"]
    let specialDayFoodArray = ["火鍋", "牛排", "炭烤", "燒烤", "龍蝦", "Pizza", "烤雞", "烤鴨"]
    let specialDaySoupAndDrinkArray = ["白酒", "威士忌", "紅酒", "啤酒", "清酒", "雞湯", "可樂", "茶", "咖啡"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeAgeSliderValue(_ sender: Any) {
        
        sliderValueLabel.text = "\(Int(ageSlider.value))"
    }
    
    
    @IBSegueAction func showAnswer(_ coder: NSCoder) -> RandomFoodViewController? {
        
        let name = String(nameTextField.text!)
        let controller = RandomFoodViewController(coder: coder)
        var gender = String(genderSegmentedControl.selectedSegmentIndex)
        var period = String(periodSegmentedControl.selectedSegmentIndex)
        var meal = String(periodSegmentedControl.selectedSegmentIndex)
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: date.date)
        
        var datePickerMonth = dateComponents.month!
        var datePickerDay = dateComponents.day!
        
        if genderSegmentedControl.selectedSegmentIndex == 0 {
            gender = "先生/小姐"
        } else if genderSegmentedControl.selectedSegmentIndex == 1 {
            gender = "小姐"
        } else if genderSegmentedControl.selectedSegmentIndex == 2 {
            gender = "先生"
        }
        
        if periodSegmentedControl.selectedSegmentIndex == 0 {
            period = "早安"
            meal = "早餐"
        } else if periodSegmentedControl.selectedSegmentIndex == 1 {
            period = "午安"
            meal = "午餐"
        } else if periodSegmentedControl.selectedSegmentIndex == 2 {
            period = "下午好"
            meal = "下午茶"
        } else if periodSegmentedControl.selectedSegmentIndex == 3 {
            period = "晚安"
            meal = "晚餐"
        } else if periodSegmentedControl.selectedSegmentIndex == 4 {
            period = "深夜好"
            meal = "宵夜"
        }
        
        controller?.name = name
        controller?.gender = gender
        controller?.period = period
        controller?.meal = meal
        
        if ageSlider.value <= 2 {
            
            let foodName1 = foodArray1.randomElement()
            
            if soupAndDrinkSwtch.isOn == true {
                let soupAndDrinkName = "沒有適合的湯或飲料"
                controller?.randomSoupAndDrinkName = soupAndDrinkName
            }
            
            controller?.randomFoodName = foodName1!
            
        } else if ageSlider.value < 18 {
            
            if periodSegmentedControl.selectedSegmentIndex == 0 {
                
                let foodName2 = foodArray2.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName2 = soupAndDrinkArray2.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName2!
                }
                
                controller?.randomFoodName = foodName2!
                
            } else if periodSegmentedControl.selectedSegmentIndex == 1 {
                
                let foodName3 = foodArray3.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName6 = soupAndDrinkArray6.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                }
                
                controller?.randomFoodName = foodName3!
                
            } else if periodSegmentedControl.selectedSegmentIndex == 2 {
                
                let foodName4 = foodArray4.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName4 = soupAndDrinkArray4.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName4!
                }
                
                controller?.randomFoodName = foodName4!
                
            } else if periodSegmentedControl.selectedSegmentIndex == 3 {
                
                let foodName3 = foodArray3.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName6 = soupAndDrinkArray6.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                }
                
                controller?.randomFoodName = foodName3!
                
            } else if periodSegmentedControl.selectedSegmentIndex == 4 {
                
                let foodName5 = foodArray5.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName7 = soupAndDrinkArray7.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName7!
                }
                
                controller?.randomFoodName = foodName5!
                
            }
        } else if ageSlider.value < 100 {
            
            if periodSegmentedControl.selectedSegmentIndex == 0 {
                
                let foodName2 = foodArray2.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName2 = soupAndDrinkArray2.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName2!
                }
                
                controller?.randomFoodName = foodName2!
                
            } else if periodSegmentedControl.selectedSegmentIndex == 1 {
                
                if datePickerMonth == 1 && datePickerDay == 1 {
                    
                    let foodName6 = specialDayFoodArray.randomElement()
                
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                            }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else if datePickerMonth == 12 && datePickerDay == 25 {
                            
                    let foodName6 = specialDayFoodArray.randomElement()
                            
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                    }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else if datePickerMonth == 12 && datePickerDay == 31 {
                            
                    let foodName6 = specialDayFoodArray.randomElement()
                            
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                    }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else {
                
                let foodName3 = foodArray3.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName3 = soupAndDrinkArray3.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName3!
                }
                
                controller?.randomFoodName = foodName3!
                    
                }
                
            } else if periodSegmentedControl.selectedSegmentIndex == 2 {
                
                let foodName4 = foodArray4.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName4 = soupAndDrinkArray4.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName4!
                }
                
                controller?.randomFoodName = foodName4!
                
            } else if periodSegmentedControl.selectedSegmentIndex == 3 {
                
                if datePickerMonth == 1 && datePickerDay == 1 {
                    
                    let foodName6 = specialDayFoodArray.randomElement()
                
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                            }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else if datePickerMonth == 12 && datePickerDay == 25 {
                            
                    let foodName6 = specialDayFoodArray.randomElement()
                            
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                    }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else if datePickerMonth == 12 && datePickerDay == 31 {
                            
                    let foodName6 = specialDayFoodArray.randomElement()
                            
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                    }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else {
                
                let foodName3 = foodArray3.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName3 = soupAndDrinkArray3.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName3!
                }
                
                controller?.randomFoodName = foodName3!
                    
                }
                
            } else if periodSegmentedControl.selectedSegmentIndex == 4 {
                
                if datePickerMonth == 1 && datePickerDay == 1 {
                    
                    let foodName6 = specialDayFoodArray.randomElement()
                
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                            }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else if datePickerMonth == 12 && datePickerDay == 25 {
                            
                    let foodName6 = specialDayFoodArray.randomElement()
                            
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                    }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else if datePickerMonth == 12 && datePickerDay == 31 {
                            
                    let foodName6 = specialDayFoodArray.randomElement()
                            
                    if soupAndDrinkSwtch.isOn == true {
                        let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
                        controller?.randomSoupAndDrinkName = soupAndDrinkName6!
                    }
                            
                    controller?.randomFoodName = foodName6!
                            
                } else {
                
                let foodName5 = foodArray5.randomElement()
                
                if soupAndDrinkSwtch.isOn == true {
                    let soupAndDrinkName5 = soupAndDrinkArray5.randomElement()
                    controller?.randomSoupAndDrinkName = soupAndDrinkName5!
                }
                
                controller?.randomFoodName = foodName5!
                    
                }
                
            }
            
        }
        
//        dateFormatter.dateFormat = "yyyy/MM/dd"
//
//        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: date.date)
//
//                //var datePickerYear = dateComponents.year!
//        var datePickerMonth = dateComponents.month!
//        var datePickerDay = dateComponents.day!
//
//        if datePickerMonth == 1 && datePickerDay == 1 {
//
//            let foodName6 = specialDayFoodArray.randomElement()
//
//            if soupAndDrinkSwtch.isOn == true {
//                let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
//                controller?.randomSoupAndDrinkName = soupAndDrinkName6!
//                    }
//
//            controller?.randomFoodName = foodName6!
//
//        } else if datePickerMonth == 12 && datePickerDay == 25 {
//
//            let foodName6 = specialDayFoodArray.randomElement()
//
//            if soupAndDrinkSwtch.isOn == true {
//                let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
//                controller?.randomSoupAndDrinkName = soupAndDrinkName6!
//            }
//
//            controller?.randomFoodName = foodName6!
//
//        } else if datePickerMonth == 12 && datePickerDay == 31 {
//
//            let foodName6 = specialDayFoodArray.randomElement()
//
//            if soupAndDrinkSwtch.isOn == true {
//                let soupAndDrinkName6 = specialDaySoupAndDrinkArray.randomElement()
//                controller?.randomSoupAndDrinkName = soupAndDrinkName6!
//            }
//
//            controller?.randomFoodName = foodName6!
//
//        }
        
        resetFilter()
        
        return controller
    
    }
    
    func resetFilter() {
        nameTextField.text = ""
        genderSegmentedControl.selectedSegmentIndex = 0
        ageSlider.value = 1
        sliderValueLabel.text = "1"
        date.date = .now
        periodSegmentedControl.selectedSegmentIndex = 0
        soupAndDrinkSwtch.isOn = false
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
