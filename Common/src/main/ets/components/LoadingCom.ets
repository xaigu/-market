@Component
export struct LoadingCom{
   imageList:ResourceStr[]=[
    $r('app.media.loading_01'),
    $r('app.media.loading_02'),
    $r('app.media.loading_03'),
    $r('app.media.loading_04')
  ]
  @State currentindex:number=0
  timeid:number| null =null
  // 控制loading是否显示
  @Prop
  showLoading: boolean = false
  //定义主体内容
  @Builder
  defaultContent(){
    Column(){
      Text('请传入主题内容')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
  @BuilderParam
  mainContent:()=>void=this.defaultContent
  //切换要显示的图片
  loopLoading=()=>{
    setInterval(()=>{
     this.timeid= this.currentindex++
      if (this.currentindex===4) {
        this.currentindex=0
      }
    },200)
  }
  aboutToAppear(): void {
    this.loopLoading()
  }
  aboutToDisappear(): void {
    this.timeid&&clearInterval(this.timeid)
  }
  build() {
    if (this.showLoading){
      Column(){
        Image(this.imageList[this.currentindex])
          .width(60)
      }
      .height('100%')
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    else {
      this.mainContent()
    }

  }
}