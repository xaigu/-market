import { CategoryType } from '../apis/banner'

@Component
export struct HomeCategory {
//获取分类
  categoryList:CategoryType[]=new Array(6).fill({
id:'1181622001',
    name:'气质女装',
    picture:"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png"
  })
  //背景颜色组
  @State bgColorList:string[]=[
    '#faf7f0',
    '#f9ecf1',
    '#dedfe7',
    '#f0f9f9',
    '#faf7f0',
    '#faf7f0',
    '#f9ecf1',
    '#dedfe7',
  ]
  build() {
    Row(){
Scroll(){
  Row({space:20}){
    ForEach(this.categoryList,(item:CategoryType,index:number)=>{
      Column(){
        Image(item.picture)
          .width(42)
        Text(item.name)
          .fontColor('#CC191919')
          .fontSize(10)
      }
      .width(60)
      .aspectRatio(6 / 8)
      .backgroundColor(this.bgColorList[index])
      .borderRadius(30)
      .justifyContent(FlexAlign.Center)
    })
  }
}
      .scrollable(ScrollDirection.Horizontal)

    }
    .padding(8)
  }
}