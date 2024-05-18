//分类列表api接口
import { fetchData } from '@meihui/common/src/main/ets/utils/http';

export interface CategoryType {
  children: Child[];
  goods: Good[];
  id: string;
  name: string;
  picture: string;

}
export interface Child {
  children?: null;
  goods?: null;
  id: string;
  name: string;
  picture: string;

}

export interface Good {
  desc: string;
  id: string;
  name: string;
  orderNum: number;
  picture: string;
  price: string;

}

export  const categoryAPI=()=>{
  return fetchData<CategoryType[]>({
    url:'/home/category/head',
    method:'GET'
  })
}