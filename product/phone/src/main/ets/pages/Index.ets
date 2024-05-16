import { Log } from '@abner/log';
import { MainPage } from '@meihui/home';
// import { CategoryPage}from  '@meihui/Category'
// axios基础测试
import {getBannerAPI } from  '../apis/banner'
import { BannerItem } from '../apis/goodsList';

@Entry
@Component
struct Index {
 @State index:number=0

  build() {
    // 自定义builder 传参的方式适配
    Tabs({barPosition:BarPosition.End,index:$$this.index}){
      TabContent(){
        Text('首页的内容')
      }
        .tabBar(this.Tabbuilder($r('app.media.ic_public_home_normal'),$r('app.media.ic_public_home_actived'),'首页',0))
      TabContent(){
        Text('推荐的内容')}
        .tabBar(this.Tabbuilder($r('app.media.ic_public_pro_normal'),$r('app.media.ic_public_pro_actived'),'分类',1))
      TabContent(){
        Text('发现的内容')}
        .tabBar(this.Tabbuilder($r('app.media.ic_public_cart_normal'),$r('app.media.ic_public_cart_actived'),'购物袋',2))
      TabContent(){
        Text('我的内容')}
        .tabBar(this.Tabbuilder($r('app.media.ic_public_my_normal'),$r('app.media.ic_public_my_actived'),'我的',3))

    }
    .scrollable(false)
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