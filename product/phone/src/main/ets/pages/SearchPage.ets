import { router } from '@kit.ArkUI'
import {SpeechManager,AudioManager} from  '@meihui/common'
type PressState=1|2|3
function  formatPresssState(pressState:PressState):string{
  const Map:Record<PressState,string>={
    1:'长按语音搜索',
    2:'识别中，请讲话...',
    3:'转文字中...'
  }
  return Map[pressState]
}
@Entry
@Component
struct SearchPage {
  @State tabcontent: string = ''
  audio = new AudioManager()
  speech = new SpeechManager()
@State keyword:string=''
  @State pressState:PressState=1
  //点击语音格式化

  // formatState:()=>string = ()=>{
  //   if(this.pressState === 1){
  //     return '长按语音搜索'
  //   }
  //   if(this.pressState === 2){
  //     return "请讲话.."
  //   }
  //   if(this.pressState === 3){
  //     return '识别中'
  //   }
  //   return ''
  // }
  aboutToAppear(): void {
    this.audio.requestPermission()
  }
  build() {
    Column() {
      Stack() {
        Row() {
          Row() {
            Image($r('app.media.arrow_left'))
              .width(22)
          }
          .margin({ right: 10, left: 5 })

          Row() {
            TextInput({ text: $$this.tabcontent, placeholder: '搜索' })
              .fontColor('#bcbac2')
              .backgroundColor('#ffffff')
              .layoutWeight(1)
            Button('搜索')
              .margin(10)
              .height(30)
              .linearGradient({
                angle: 135,
                direction: GradientDirection.Left,
                colors: [
                  ['#fe4a7e', 0], ['#ff6f48', 1]
                ]
              })//跳转到搜索结果页面
              .onClick(() => {
                router.pushUrl({
                  url: '/pages/SearchResult'.slice(1),
                  params: {
                    tab: this.tabcontent
                  }
                })
              })
          }
          .width('100%')
          .layoutWeight(1)
          .backgroundColor('#ffffff')
          .borderRadius(25)
          .margin({ right: 15 })
        }
        .backgroundColor('#f2e7dc')
        .height(80)
        .width('100%')

      }

      // 搜索内容区域
      Column() {
        Column() {
          Row() {
            Image($r("app.media.ic_public_input_voice"))
              .width(24)
              .fillColor('#fff')
            Text(formatPresssState(this.pressState)).fontColor('#fff').fontSize(14)
          }
          .borderRadius(22)
          .width(156)
          .justifyContent(FlexAlign.Center)
          .height(44)
          .linearGradient({
            angle: 135,
            colors: [
              ['#FD3F8F', 0.0],
              ['#FF773C', 1.0]
            ],
            direction: GradientDirection.Left
          })
          .gesture(
            LongPressGesture({ repeat: false })

              .onAction((event: GestureEvent | undefined) => {
                this.pressState=2
                // 开始录音
                this.audio.start()
              })
              .onActionEnd(async () => {
                this.pressState=3
                // 录音结束
                const filePath = await this.audio.stop()
                // 开始识别
                if (filePath) {
                  this.speech.start(filePath, (res) => {
                    console.log(JSON.stringify(res))
                    this.keyword=res.result
                    this.pressState=1

                  })
                }
              })
          )
        }
        .width('100%')
        .height('100%')
        .padding({ bottom: 16 })
        .justifyContent(FlexAlign.Center)
        .backgroundImage($r("app.media.ic_public_voice_bg"))
        .backgroundImageSize({ width: '100%', height: '100%' })

      }
      .height('100%')
    }
  }
}