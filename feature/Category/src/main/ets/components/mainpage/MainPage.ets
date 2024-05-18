import { categoryItemtype,getcategoprylistAPI } from '../../apis'
import { image } from '@kit.ImageKit'

@Entry
@Component
export struct MainPage {

  @State currentindex:number=0
  @State categoryList:categoryItemtype[]=[]
  aboutToAppear(): void {
    this.getcategorylist()
  }
  getcategorylist=async ()=>{
    try {
      const res = await getcategoprylistAPI()
      this.categoryList = res.data.result
    } catch (e) {
      console.log('categorypage:',e)
    }
  }
  build() {
Column(){
  Row(){
    Text('分类')
      .fontSize(17)
    Row(){
      Image($r('app.media.home_search_left'))
        .width(12)
        .aspectRatio(1)
    }
   // .position({x:340,y:20})
    // .backgroundColor(Color.Blue)

  }
  .width('100%')
  .height(56)
  .justifyContent(FlexAlign.Center)
  // .backgroundColor(Color.Orange)
  //切换部分
  Row(){
    //左侧tab
Column(){
  ForEach(this.categoryList,(item: categoryItemtype,index:number)=>{
    Column(){
      Text(item.name)
        .fontSize(13)
        .fontColor(this.currentindex===index?'#fff':'#000')

    }
    .backgroundColor(this.currentindex===index?'#000':'#fff')
    .padding(10)

   .onClick(()=>{
     this.currentindex=index
   })
  })

}
    .height('100%')
    //右侧内容
    Scroll(){
      Column(){
       //大图
        Row(){
          Image(this.categoryList[this.currentindex]?.picture)
            .objectFit(ImageFit.Fill)
            .borderRadius(24)
            .aspectRatio(1)
        }
        .width('100%')
        //小图
        GridRow({columns:2,gutter:4}){
          ForEach(this.categoryList[this.currentindex]?.children,(item: categoryItemtype,index:number)=>{
            GridCol(){
              Column(){
                Image(item.picture)
                  .width(64)
                  .aspectRatio(1)
                Text(item.name)
                  .fontSize(14)
                  .margin({top:18})
              }
              .width('100%')
              .aspectRatio(1)
              .backgroundColor('F6F6F6')
              .borderRadius(16)
              .justifyContent(FlexAlign.Center)
            }
          })
        }
        .margin({top:8})
      }
      .padding({left:8,right:8})

      // .backgroundColor(Color.Blue)
    }
.layoutWeight(1)
    .padding({bottom:66})
  }
  .alignItems(VerticalAlign.Top)
  .width('100%')
  // .height('100%')
  // .backgroundColor(Color.Brown)
}
    .height('100%')
  }
}