import { MainPage } from '@meihui/home';
// import { CategoryPage}from  '@meihui/Category'
// axios基础测试
import { httpInstance } from '@meihui/common'
import  { AxiosResponse} from  '@ohos/axios'
//定义一个接口
interface  HttpRes<T>{
  code:string,
  msg:string,
  result: T
}
// 2. 定义当前业务接口的具体返回值类型
interface BannerItem {
  id:string,
  imgUrl: string,
  hrefUrl: string,
  type: string
}
type Res = BannerItem[]
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        MainPage()
        Button('发送请求')
          .onClick(async ()=>{
            //请求发送
            const res=await httpInstance.request<null,AxiosResponse<HttpRes<BannerItem[]>,null>,null>({
              url:'/home/banner',
              method:'GEt'
            })
            console.log(JSON.stringify(res.data.result))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}