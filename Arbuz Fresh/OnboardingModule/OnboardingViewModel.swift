//
//  File.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 23.05.2023.
//

import Foundation

struct OnboardingViewModel {
    
    var slides = [
        OnboardingSlide(title: "Добро пожаловать!", description: "Добро пожаловать в приложение Arbuz Fresh! Нажимай кнопку Next для дальнейших инструкций!", image: #imageLiteral(resourceName: "slide2")),
        OnboardingSlide(title: "Про вашу подписку!", description: "У вас подписка уровня Standard! Включает 50 долларов в неделю на все доступные товары и бесплатную доставку!", image: #imageLiteral(resourceName: "slide1")),
        OnboardingSlide(title: "Пример использования!", description: "Каждую неделю в понедельник список товаров обновляется, вы можете набрать корзину любых товаров, в сумме которые не превышают 50 долларов. Также после выбора товаров вы можете указывать любой адрес для доставки ваших товаров независимо от вашего расположения!", image: #imageLiteral(resourceName: "slide3"))
    ]
}
