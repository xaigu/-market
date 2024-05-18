import { Log } from '@abner/log';
import { MainPage } from '@meihui/home';
// import { CategoryPage}from  '@meihui/Category'
// axios基础测试
import {getBannerAPI } from  '../apis/banner'
import { BannerItem } from '../apis/goodsList';
import { MainPage as Home } from '@meihui/home'
import { MainPage as Category } from '@meihui/Category'
import { MainPage as My } from '@meihui/my'
import { MainPage as Cart } from '@meihui/cart'
import mediaQuery from '@ohos.mediaquery'
import {CheckOriginType, LandState} from  '@meihui/common'



@Entry
@Component
struct Index {

 @State index:number=0

@Builder TabsContent(landState:LandState){
  // 自定义builder 传参的方式适配
  Tabs({barPosition:landState.isLand?BarPosition.Start:BarPosition.End,index:$$this.index}){
    TabContent(){
      Home()
    }

    .tabBar(this.Tabbuilder($r('app.media.ic_public_home_normal'),$r('app.media.ic_public_home_actived'),'首页',0))
    TabContent(){
      Category()
    }
    .tabBar(this.Tabbuilder($r('app.media.ic_public_pro_normal'),$r('app.media.ic_public_pro_actived'),'分类',1))
    TabContent(){
      Cart()}
    .tabBar(this.Tabbuilder($r('app.media.ic_public_cart_normal'),$r('app.media.ic_public_cart_actived'),'购物袋',2))
    TabContent(){
      My()}
    .tabBar(this.Tabbuilder($r('app.media.ic_public_my_normal'),$r('app.media.ic_public_my_actived'),'我的',3))

  }
  //禁止tab滑动
  .scrollable(false)
  .vertical(landState.isLand)
  .barMode(BarMode.Fixed)
}

  build() {
    Column(){
      // 自定义builder 传参的方式适配
      // 1. 通过媒体查询 检测当前是否是横屏
      // 2. 根据检测到的结果控制tabs某个属性
      CheckOriginType({
        Slot: (landState)=>{
          this.TabsContent(landState)
        }
      })
    }
  }
  @Builder
  Tabbuilder(img:ResourceStr,selectimg:ResourceStr,text:string,index:number){
    Column(){
      Image(this.index===index?selectimg:img)
        .width(22)
      Text(text)
        .fontColor(this.index===index?'#191919':'#6B6B6B')
        .fontSize(12)

    }
    .width('100%')
    .onClick(()=>{
      this.index=index
    })
  }
}