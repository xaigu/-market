// 封装一个检测横竖屏的组件
import { LoadingCom, MyTabs, TitleBar, } from '@meihui/common'
import { listItem } from '@meihui/common/src/main/ets/components/MyTabs'
import mediaQuery from '@ohos.mediaquery'
//封装一个检测横竖屏的组件
interface LandState{
  isLand:boolean
}
@Component
struct  CheckOriginType{
  @State landState:LandState={
    isLand:false
  }
  //配置通过媒体查询检测什么——横竖屏状态
  listenerScreen = mediaQuery.matchMediaSync('(orientation: landscape)')
  aboutToAppear(): void {
    this.listenerScreen.on('change',(mediaQueryResult)=>{
      // console.log(JSON.stringify(mediaQueryResult,null,2))
      this.landState.isLand=mediaQueryResult.matches
    })
  }
  @Builder DefaultSlot(){}
  // 支持插槽传入的语法
  @BuilderParam Slot:(landState:LandState)=>void = this.DefaultSlot
  build() {
    //传递响应式的状态数据 把要传递的数据变为对象（传递引用对象出去以保持响应式）
    this.Slot(this.landState)
  }
}
@Entry
@Component
struct TextPage {
@Builder RenderText(landState:LandState){
  Text(`传过来的横竖屏状态值为:${landState.isLand}`)
}
  @Builder RenderTabs(landState:LandState){

  }
  build() {
    // Row(){
    //   CheckOriginType({
    //     Slot: (landState)=>{
    //       this.RenderTabs(landState)
    //     }
    //   })
    // }
    //tabbar组件封装
    // Column(){
    //
    //   TitleBar({
    //     title:'分类',
    //     onBack:()=>{
    //       console.log('123')
    //     }
    //   })
    //   TitleBar({
    //     title:'搜索',
    //     showBack:false,
    //     onBack:()=>{
    //       console.log('456')
    //     }
    //   })
    // }


    //loadingcom实现
    // Column(){
    //   LoadingCom({showLoading:true}){
    //     Text('请问这是干什么的')
    //   }
    // }
    Column(){
      MyTabs({
        list: [{ title: 'tab1', id: 0 }, { title: 'tab2', id:1 }],
        activeBgColor: '#000',
        activeFontColor: '#fff',
        onchange:(tab)=>{
          console.log(tab.title)
        }
      })

    }

  }
}