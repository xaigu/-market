import { Auth, TitleBar } from '@meihui/common/Index'
import { promptAction, router } from '@kit.ArkUI'
import { loginAPI,request } from '../apis/login'
import { Log } from '@abner/log'
import { ifaa } from '@kit.OnlineAuthenticationKit'

// interface FormState{
//   account: string,
//   password: string
// }
@Entry
@Component
struct LoginPage {
@State formState:request={
  account:'',
  password:''
}
  //勾选协议
  @State isAgree:boolean=false
  login=async ()=>{
    if(this.isAgree===false){
      promptAction.showToast({message:'勾选隐私协议'})
      return
    }

    //判断是否同意协议
    if(this.formState.account===''||this.formState.password===''){
      promptAction.showToast({message:'请输入账号或密码'})
    }else {
      try {
        const res = await loginAPI(this.formState)
        // Log.info(res.data.result)
        AlertDialog.show({message:JSON.stringify(res.data.result,null,2)})
        Auth.setUser(res.data.result)
        promptAction.showToast({message:'登陆成功'})
        router.pushUrl({
          url:'/pages/Index'.slice(1)
        })
      } catch (e) {
        Log.error('fetch login error ',e)
      }
    }

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
          .onClick(()=>{
            this.login()
          })
        // 协议
        Row() {
          Toggle({ type: ToggleType.Checkbox, isOn: this.isAgree })
            .size({ width: 10 })
            .selectedColor('#191919')
            .onChange((value)=>{
              this.isAgree=value
            })
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