import { NewGoods } from '../apis/banner'

@Component
export struct HomeNew {
  @State
  newgoods:NewGoods[]=new Array(8).fill({
    id: "4034793",
    name: "跟灯按弦超好玩碳纤维智能尤克里里",
    desc: "指板亮灯，指引按弦。可视化学习，更高效！还有更多游戏闯关，超有乐趣，不知不觉学会弹琴。",
    price: "599.00",
    picture: "https://yanxuan-item.nosdn.127.net/62107ce9769183757d9a425af9f503df.jpg",
    orderNum: 695
  })
  build() {
//新鲜好物
    Column(){
      Column(){
        Row(){
         Image($r('app.media.home_new_icon'))
           .width(150)
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        //列表区域
        Row(){
          GridRow({columns:4,gutter:8}){
            ForEach(this.newgoods,(item:NewGoods)=>{
              GridCol(){
                Column(){
                  Image(item.picture)
                    .aspectRatio(1)
                  Text(`￥${item.price}`)
                    .fontSize(13)
                    .fontColor('FF4B61')
                    .fontWeight(700)
                    .margin({top:10})
                }
                .padding(8)
                .borderRadius(10)
                .backgroundColor('#fff')
              }
              .layoutWeight(1)
            })
          }
        }
        .margin({top:10})
      }
      .width('100%')
      .borderRadius(8)
      .backgroundColor('#f8eff4')
      .padding(8)
      .margin({ top: 8, bottom: 8 })
      .alignItems(HorizontalAlign.Start)
    }
    .padding({
      left: 8,
      right: 8
    })
  }
}