import { UserType } from '@meihui/common';
import { fetchData } from '@meihui/common/src/main/ets/utils/http';

export interface request {
  account: string;
  password: string;
}
export interface Result {
  account: string;
  avatar: string;
  birthday: null;
  cityCode: null;
  gender: null;
  id: string;
  mobile: string;
  nickname: null;
  profession: null;
  provinceCode: null;
  token: string;
}
export  const loginAPI=(data:request)=>{
  return fetchData<UserType>({
    url:'/login',
    method:'POST',
    data
  })
}

