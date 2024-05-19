
@Component
 export  struct TitleBar {
  @Prop title:string=''
  @Prop showBack:boolean=true
  // 不能使用prop修饰，否则编辑器不报错，但是通不过编译器
  onBack=()=>{}
  build() {
    Stack({ alignContent:Alignment.Start}) {
      Row(){
        Text(this.title).fontSize(17)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      Image($r('app.media.arrow_left'))
        .width(22)
        .margin({
          left: 6
        })
        .visibility(this.showBack ? Visibility.Visible: Visibility.Hidden)
        .onClick(()=>{
          this.onBack && this.onBack()
        })
    }
    .width('100%')
    .height(56)
  }
}