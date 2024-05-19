import { TitleBar } from '@meihui/common'
import { router } from '@kit.ArkUI'
interface FormState{
  account: string,
  password: string
}
@Entry
@Component
struct LoginPage {
@State formState:FormState={
  account:'',
  password:''
}

  build() {
    Column(){
      // 顶部区域
      TitleBar({
        title:'登录',
        showBack:true,
        onBack:()=>{
          router.back()
        }
      })

      // 表单区域
      Column() {
        // 账号
        TextInput({ placeholder: '请输入手机号',text:this.formState.account })
          .margin({ top: 20 })
          .fontSize(14)
          .fontColor('#191919')
          .onChange((account)=>{
            this.formState.account=account
          })
        // 密码
        TextInput({ placeholder: '请输入密码',text:this.formState.password })
          .margin({ top: 20 })
          .fontSize(14)
          .fontColor('#A6A3AD')
          .onChange((password)=>{
            this.formState.password=password
          })
        Button('登录')
          .width('100%')
          .fontSize(14)
          .backgroundColor('#191919')
          .margin({ top: 20 })

        // 协议
        Row() {
          Toggle({ type: ToggleType.Checkbox, isOn: false })
            .size({ width: 10 })
            .selectedColor('#191919')

          Text('查看并同意《隐私条款》和《用户协议》')
            .fontSize(12)
            .fontColor('#A6A3AD')
        }
        .margin({
          top: 4
        })
      }
      .alignItems(HorizontalAlign.Start)
      .padding({
        left: 24,
        right: 24,
        top: 30
      })
    }

  }
}