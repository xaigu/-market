import { router } from '@kit.ArkUI'

@Entry
@Component
struct SearchPage {
@State tabcontent:string=''

  build() {
Column(){
  Stack(){
    Row(){
      Row(){
      Image($r('app.media.arrow_left'))
        .width(22)
    }
.margin({right:10,left:5})
      Row(){
        TextInput({text:$$this.tabcontent,placeholder:'搜索'})
          .fontColor('#bcbac2')
          .backgroundColor('#ffffff')
          .layoutWeight(1)
        Button('搜索')
          .margin(10)
          .height(30)
          .linearGradient({
            angle:135,
            direction:GradientDirection.Left,
            colors:[
              ['#fe4a7e',0],['#ff6f48',1]
            ]
          })
        //跳转到搜索结果页面
          .onClick(()=>{
            router.pushUrl({
              url:'/pages/SearchResult'.slice(1),
              params:{
                tab:this.tabcontent
              }
            })
          })
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#ffffff')
      .borderRadius(25)
      .margin({right:15})
    }
    .backgroundColor('#f2e7dc')
    .height(80)
    .width('100%')

  }

}
    .height('100%')
  }
}