import { promptAction } from '@kit.ArkUI'

export  interface  listItem{
  id:number,
  title:string
}
@Component
export  struct MyTabs{
  @Prop list:listItem[]=[]
  @Prop activeBgColor:string|Resource=''
  @Prop activeFontColor:string|Resource=''
  onchange:(tab:listItem)=>void=()=>{}
  @State activeTab:listItem={
    id:0,
    title:''
  }
  build() {
Column(){
  ForEach(this.list,(item:listItem)=>{
    Row(){
      Text(item.title)
        .fontColor(this.activeTab.id===item.id?this.activeFontColor:'#000')
    }
    .width(60)
    .height(40)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.activeTab.id===item.id?this.activeBgColor:'#fff')
    .onClick((tab)=>{
      this.activeTab = item
      this.onchange(this.activeTab)
    })
  })
}
  }
}