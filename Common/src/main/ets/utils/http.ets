// 基于axios做一些基础封装
import axios, { InternalAxiosRequestConfig,AxiosError,AxiosResponse} from '@ohos/axios'
// 1. 实例化（baseURL + timeout）

const httpInstance = axios.create({
  baseURL:'https://meikou-api.itheima.net/',
  timeout:5000
})


// 2. 拦截器
// 请求  客户端 (请求参数 token)-> 服务端
// 拦截器是可以添加多个的  前一个拦截器处理之后的结果交给下一个拦截器继续处理 直到没有拦截器了 最后一个return出去的config就是最终的请求参数

httpInstance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 注意：return千万不要丢
  return config
}, (error: AxiosError) => {
  return Promise.reject(error)
})


// 响应
// 响应返回数据
// 服务器 ->[拦截器]  客户端
// 1. 判断响应状态码做逻辑处理 401(token失效) 404
// 依据 http code  2xx(成功走第一个回调)  4xx 5xx（走第二个回调）
// 注意：return语句

httpInstance.interceptors.response.use((response: AxiosResponse) => {

  return response
}, (error: AxiosError) => {

  return Promise.reject(error)
})

export  { httpInstance }