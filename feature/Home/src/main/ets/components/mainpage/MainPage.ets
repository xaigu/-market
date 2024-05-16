import { HomeBanner } from '../HomeBanner'
import { HomeCategory } from '../HomeCategory'
import { HomeNew } from '../HomeNew'
import { HomeRecommend } from '../HomeRecommend'


@Component
export struct MainPage {


  build() {
   Column(){
     Scroll(){
       Column(){
         HomeBanner()
         HomeCategory()
         HomeNew()
         HomeRecommend()
       }

     }


   }
  }
}
