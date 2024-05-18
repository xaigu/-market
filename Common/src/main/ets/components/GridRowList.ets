// 智能组件 vs UI组件（木偶组件）
// 智能组件 和后端交互 处理自己的状态数据 下发要渲染的数据...
// UI组件  本身没有状态 父组件传入什么就显示什么
//推荐列表区域
export interface recommendList {
  id: string;
  name: string;
  payCount: number;
  picture: string;
  price: string;

}
@Component
export  struct  GridRowList{
  @Prop goodrecommend:recommendList[]
  build() {
    GridRow({
      columns: { sm:2,md:4 },
      gutter: 8
    }) {
      ForEach(this.goodrecommend, (goods: recommendList) => {
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