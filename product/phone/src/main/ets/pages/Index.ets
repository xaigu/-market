import { MainPage } from '@meihui/home';
// import { CategoryPage}from  '@meihui/Category'
// axios基础测试
import {getBannerAPI } from  '../apis/banner'
import { BannerItem } from '../apis/goodsList';

@Entry
@Component
struct Index {
  @State bannerList:BannerItem[]=[]

  build() {
    Row() {
      Column() {
        // MainPage()
        Button('发送请求')
          .onClick(async ()=>{
           const res=await getBannerAPI()
            console.log(JSON.stringify(res.data.result))
            this.bannerList=res.data.result
          })
      }

    }

  }
}