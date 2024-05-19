// 基于appStorage封装存取方法
export  const  USER_KEY='user'
export interface UserType {
  account: string;
  avatar: string;
  id: string;
  mobile: string;
  token: string;
}
export  class  Auth{
  //存
  static setUser(userInfo:UserType){
    AppStorage.setOrCreate(USER_KEY,userInfo)
  }
  //取
  static  getUser():UserType{
    return AppStorage.get(USER_KEY) as UserType
  }
  //删
  static  delUser(){
    AppStorage.setOrCreate(USER_KEY,{})
  }
}