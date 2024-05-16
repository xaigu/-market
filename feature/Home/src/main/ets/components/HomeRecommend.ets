import { RecommendList } from '../apis/banner'

@Component
export struct HomeRecommend {
  recommendList:RecommendList[]=new Array(6).fill({
    id: "4034793",
    name: "跟灯按弦超好玩碳纤维智能尤克里里",
    price: 599,
    picture: "https://yanxuan-item.nosdn.127.net/62107ce9769183757d9a425af9f503df.jpg",
    payCount: 0
  })
  build() {
    Column(){
      GridRow({
        columns: 2,
        gutter: 8
      }) {
        ForEach(this.recommendList, (goods: RecommendList) => {
          GridCol() {
            Column() {
              // 图片区域
              Row() {
                Image(goods.picture)
                  .width('100%')
                  .aspectRatio(1)
              }
              .padding({
                top: 20,
                bottom: 20,
                left: 35,
                right: 35
              })

              // 商品信息区域
              Column() {
                Row() {
                  Text(goods.name)
                    .width('100%')
                    .maxLines(2)
                    .fontSize(13)
                    .fontColor('#434343')
                    .margin({ bottom: 8 })
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .width('100%')

                Row() {
                  // 标题区域
                  Text(`￥${goods.price}`)
                    .fontSize(13)
                    .fontWeight(700)
                    .fontColor('#191919')
                  // 价格和付款区域
                  Text('2.9万+付款')
                    .fontSize(10)
                    .fontColor('#A6A3AD')
                }
                .justifyContent(FlexAlign.SpaceBetween)
                .width('100%')
              }
              .padding({
                left: 16,
                right: 16,
                bottom: 9
              })
            }
            .width("100%")
            .justifyContent(FlexAlign.Center)
            .backgroundColor('#fff')
            .borderRadius(8)
          }
        })
      }
    }
  }
}