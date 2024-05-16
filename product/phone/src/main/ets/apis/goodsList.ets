// 封装和banner相关的类型声明以及请求方法
import { httpInstance } from '@meihui/common'
import { AxiosResponse } from '@ohos/axios'

// 1. 定义一个接口通用的泛型返回类型
interface HttpRes<T> {
  code:string,
  msg:string,
  result: T
}

// 2. 定义当前业务接口的具体返回值类型
export interface BannerItem {
  id:string,
  imgUrl: string,
  hrefUrl: string,
  type: string
}
type Res = BannerItem[]

// 定义一个请求banner的函数
export const getBannerAPI = ()=>{
  // 请求发送
  return httpInstance.request<null, AxiosResponse<HttpRes<BannerItem[]>,null>,null>({
    url:'/home/banner',
    method:'GET'
  })
}