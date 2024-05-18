import { getNewGoodsAPI, NewGoods } from '../apis/NewGoods'

@Component
export struct HomeNew {
  @State
  newgoods:NewGoods[]=[]
  aboutToAppear(): void {
    this.getNewGoods()
  }
 getNewGoods=async ()=>{
    // 1. 在其他方法中复用该方法
    // 2. 生命周期钩子函数 只做最基础的最少的初始化的事情 不包含逻辑代码
    // 3. 参数的二次处理 返回值做二次处理
    // 为什么要用箭头函数 1. 保证每个实例都有独立的getNewGoods  2. 保证this的指向始终指向的是当前的组件实例对象
    try {
      const res=await getNewGoodsAPI()
      this.newgoods=res.data.result
    }catch (e){
      // AlertDialog.show({message:JSON.stringify(e,null,2)})
      console.log('newgoods:',e)
    }
  }
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